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

struct User: Decodable {
  let id: Int
  let nickname: String?
  
  init(from dictionary: [String: Any]) {
    self.id = dictionary["id"] as? Int ?? 0
    let kakaoAccount = dictionary["kakao_account"] as? [String: Any]
    let profile = kakaoAccount?["profile"] as? [String: Any]
    self.nickname = profile?["nickname"] as? String
  }
}

class KakaoAPIManager {
  static let shared = KakaoAPIManager()
  private let keychainService = KeychainService.shared
  
  func KakaoLogin(completion: @escaping (Result<String, Error>) -> Void) {
    // 카카오톡 실행 가능 여부 확인
    if UserApi.isKakaoTalkLoginAvailable() {
      // 카카오톡 앱으로 로그인 인증
      loginWithKakaoTalk(completion: completion)
    } else { // 카톡이 설치가 안 되어 있을 때
      // 카카오 계정으로 로그인
      loginWithKakaoAccount(completion: completion)
    }
  }
  
  private func loginWithKakaoTalk(
    completion: @escaping (Result<String, Error>) -> Void
  ) {
    UserApi.shared.loginWithKakaoTalk { (oauthToken, error) in
      if let error = error {
        completion(.failure(error))
        return
      }
      if let oauthToken = oauthToken {
        self.saveTokenAndFetchUserInfo(
          oauthToken: oauthToken,
          completion: completion
        )
      }
    }
  }
  
  private func loginWithKakaoAccount(
    completion: @escaping (Result<String, Error>) -> Void
  ) {
    UserApi.shared.loginWithKakaoAccount { oauthToken, error in
      if let error = error {
        completion(.failure(error))
        return
      }
      if let oauthToken = oauthToken {
        self.saveTokenAndFetchUserInfo(oauthToken: oauthToken, completion: completion)
      }
    }
  }
  
  private func saveTokenAndFetchUserInfo(
    oauthToken: OAuthToken,
    completion: @escaping (Result<String, Error>) -> Void
  ) {
    keychainService.saveToken(
      token: oauthToken.accessToken,
      account: "com.example.kakaoLogin",
      service: "kakao_access_token"
    )
    
    fetchUserInfo(accessToken: oauthToken.accessToken) { result in
      switch result {
      case .success:
        completion(.success(oauthToken.accessToken))
      case .failure(let error):
        completion(.failure(error))
      }
    }
  }
  
  // MARK: - 사용자 정보 가져오기
  func fetchUserInfo(
    accessToken: String,
    completion: @escaping (Result<User, Error>) -> Void
  ) {
    let url = "https://kapi.kakao.com/v2/user/me"
    let headers: HTTPHeaders = [
      "Authorization" : "Bearer \(accessToken)"
    ]
    
    AF.request(
      url,
      method: .get,
      headers: headers
    ).responseJSON { response in
      switch response.result {
      case .success(let data):
        if let json = data as? [String: Any] {
          print("사용자 정보: \(json)")
          let user = User(from: json) // User 객체로 변환
          print(user)
          completion(.success(user)) // 성공 결과로 User 전달
        } else {
          completion(.failure(NSError(
            domain: "KakaoAPI",
            code: -1,
            userInfo: [NSLocalizedDescriptionKey: "Invalid response format"]
          )))
        }
      case .failure(let error):
        completion(.failure(error))
      }
    }
    
    func kakaoLogout() {
      UserApi.shared.logout {(error) in
        if let error = error {
          print(error)
        }
        else {
          print("logout() success.")
        }
      }
      
      // MARK: - 연결 끊기 및 토큰 삭제
      func kakaoUnlink() {
        UserApi.shared.unlink {(error) in
          if let error = error {
            print(error)
          }
          else {
            print("unlink() success.")
          }
        }
      }
    }
  }
  
  func validateToken(accessToken: String, completion: @escaping (Bool) -> Void) {
    let url = "https://kapi.kakao.com/v1/user/access_token_info"
    let headers: HTTPHeaders = [
      "Authorization": "Bearer \(accessToken)"
    ]
    
    AF.request(url, method: .get, headers: headers).responseJSON { response in
      switch response.result {
      case .success(let data):
        print("토큰 유효성 확인 성공: \(data)")
        completion(true)
      case .failure(let error):
        print("토큰 유효성 확인 실패: \(error.localizedDescription)")
        completion(false)
      }
    }
  }
}
