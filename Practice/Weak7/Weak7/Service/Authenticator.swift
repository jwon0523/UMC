//
//  Authenticator.swift
//  Weak7
//
//  Created by jaewon Lee on 11/24/24.
//

import Foundation
import Alamofire

// 인증 토큰 정보와 만료 상태 관리
struct Credential: AuthenticationCredential {
  let accessToken: String
  let expiration: Date
  
  // 토큰이 만료되기 전 갱신 여부를 판단
  var requiresRefresh: Bool {
    return Date(timeIntervalSinceNow: 60 * 5) > expiration // 5분전
  }
}

// 인증 실패 시 새로운 토큰 발급 및 갱신
final class Authenticator: Alamofire.Authenticator {
  func apply(
    _ credential: Credential,
    to urlRequest: inout URLRequest
  ) {
    urlRequest.headers.add(.authorization(bearerToken: credential.accessToken))
  }
  
  func refresh(
    _ credential: Credential,
    for session: Alamofire.Session,
    completion: @escaping @Sendable (Result<Credential, any Error>) -> Void
  ) {
    // 토큰 갱신 API 엔드포인트
    let refreshTokenURL = APIEndpoint.baseURL + APIEndpoint.Auth.refreshURL
    let parameters = [
      "refresh_token": "refresh_token" // 실제 저장된 refresh_token 사용
    ]
    session.request(
      refreshTokenURL,
      method: .post,
      parameters: parameters,
      encoding: JSONEncoding.default
      // responseDecodable를 통해서 TokenResponse에 디코딩
    ).validate().responseDecodable(of: TokenResponse.self) { response in
        switch response.result {
        case .success(let tokenResponse):
          // 서버 응답에서 새로 받은 access_token과 만료 시간 업데이트
          let newCredential = Credential(
            accessToken: tokenResponse.accessToken,
            expiration: Date().addingTimeInterval(TimeInterval(tokenResponse.expiresIn))
          )
          completion(.success(newCredential))
        case .failure(let error):
          print("토큰 갱신 실패: \(error)")
          completion(.failure(error))
        }
      }
  }
  
  func didRequest(
    _ urlRequest: URLRequest,
    with response: HTTPURLResponse,
    failDueToAuthenticationError error: any Error
  ) -> Bool {
    return response.statusCode == 401 // 401 Unauthorized 감지
  }
  
  func isRequest(
    _ urlRequest: URLRequest,
    authenticatedWith credential: Credential
  ) -> Bool {
    let bearerToken = HTTPHeader.authorization(bearerToken: credential.accessToken).value
    return urlRequest.headers["Authorization"] == bearerToken
  }
}
