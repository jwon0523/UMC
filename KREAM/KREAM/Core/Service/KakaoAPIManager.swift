//
//  KakaoAPIManager.swift
//  KREAM
//
//  Created by jaewon Lee on 11/24/24.
//

import Foundation
import KakaoSDKUser

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
        KeychainService.shared.saveToken(
          token: oauthToken.accessToken,
          account: "kakao_access_token",
          service: "com.example.kakaoLogin"
        )
        completion(.success(oauthToken.accessToken))
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
        KeychainService.shared.saveToken(
          token: oauthToken.accessToken,
          account: "com.example.kakaoLogin",
          service: "kakao_access_token"
        )
        completion(.success(oauthToken.accessToken))
      }
    }
  }
  
  // MARK: - 사용자 정보 가져오기
  func fetchUserInfo() {
    UserApi.shared.me {(user, error) in
      if let error = error {
        print("사용자 정보 가져오기 실패: \(error.localizedDescription)")
        return
      }
      print("사용자 정보 가져오기 성공")
      print("사용자 닉네임: \(user?.kakaoAccount?.profile?.nickname ?? "No nickname")")
      print("사용자 계정: \(user?.kakaoAccount?.email ?? "No email")")
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
