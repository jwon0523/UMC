//
//  KakaoAPIManager.swift
//  KREAM
//
//  Created by jaewon Lee on 11/24/24.
//

import Foundation
import KakaoSDKUser
import KakaoSDKAuth
import Alamofire

struct UserInfoResponse: Codable {
  let id: Int
  let properties: [String: String]?
}

/// 카카오톡 로그인을 담당하는 Manager 설정
/// 기본적으로 카카오 로그인은 Main Actor에서만 실행되기 떄문에 MainActor 지정
@MainActor
class KakaoLoginManager {
  static let shared = KakaoLoginManager()
  
  func fetchAccessToken() async throws -> String {
    return try await withCheckedThrowingContinuation { continuation in
      if UserApi.isKakaoTalkLoginAvailable() {
        UserApi.shared.loginWithKakaoTalk { oauthToken, error in
          if let error = error {
            continuation.resume(throwing: error)
          } else if let oauthToken = oauthToken {
            continuation.resume(returning: oauthToken.accessToken)
          }
        }
      } else {
        UserApi.shared.loginWithKakaoAccount { oauthToken, error in
          if let error = error {
            continuation.resume(throwing: error)
          } else if let oauthToken = oauthToken {
            continuation.resume(returning: oauthToken.accessToken)
          }
        }
      }
    }
  }
  
  /// AccessToken을 사용하여 해당 토큰의 사용자 이름을 받아온다.
  func fetchUserNickname(accessToken: String) async throws -> String {
    let url = "https://kapi.kakao.com/v2/user/me"
    let headers: HTTPHeaders = [
      "Authorization" : "Bearer \(accessToken)"
    ]
    
    return try await withCheckedThrowingContinuation { continuation in
      AF.request(url, method: .get, headers: headers).responseDecodable(of: UserInfoResponse.self) { response in
        switch response.result {
        case .success(let userInfo):
          if let nickname = userInfo.properties?["nickname"] {
            continuation.resume(returning: nickname)
          }
        case .failure(let error):
          continuation.resume(throwing: error)
        }
      }
    }
  }
}
