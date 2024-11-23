//
//  APIClient.swift
//  Weak7
//
//  Created by jaewon Lee on 11/23/24.
//

import Foundation
import Alamofire

final class APIClient {
  static let shared = APIClient()
  // 네트워크 요청의 응답을 비동기로 처리할 때 사용할 디스패치 큐 설정 가능
  private let session: Session
  
  private init() {
//    let initialCredential = Credential(
//      accessToken: "initial_access_token",
//      expiration: Date().addingTimeInterval(3600)
//    )
//    let authenticator = Authenticator()
//    let interceptor = AuthenticationInterceptor(
//      authenticator: authenticator,
//      credential: initialCredential
//    )
//    let configuration = URLSessionConfiguration.default
//    configuration.timeoutIntervalForRequest = 30 // 요청 타임아웃
//    self.session = Session(
//      configuration: configuration,
//      interceptor: interceptor
//    )
    let interceptor = AuthorizationInterceptor()
    self.session = Session(interceptor: interceptor)
  }
  
  public func request<T: Codable>(
    _ url: String,
    method: HTTPMethod,
    parameters: Parameters? = nil,
    completion: @escaping (Result<T, Error>) -> Void
  ) {
    session.request(
      url,
      method: method,
      parameters: parameters
    ).validate(
      statusCode: 200..<300
    ).validate(
      contentType: ["application/json"]
      // responseDecodable를 통해서 모델 T에 디코딩
    ).responseDecodable(of: T.self) { response in
      switch response.result {
      case .success(let value):
        completion(.success(value))
      case .failure(let error):
        completion(.failure(error))
      }
    }
  }
}
