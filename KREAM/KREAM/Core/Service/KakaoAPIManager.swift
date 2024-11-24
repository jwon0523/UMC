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
  
  func KakaoLogin() {
    // 카카오톡 실행 가능 여부 확인
    if (UserApi.isKakaoTalkLoginAvailable()) {
      // 카카오톡 앱으로 로그인 인증
      kakaoLoginWithApp()
    } else { // 카톡이 설치가 안 되어 있을 때
      // 카카오 계정으로 로그인
      kakaoLoginWithAccount()
    }
  }
  
  private func kakaoLoginWithApp() {
    UserApi.shared.loginWithKakaoTalk { (oauthToken, error) in
      if let error = error {
        print("KakaoTalk login failed: \(error.localizedDescription)")
        return
      }
      else {
        print("loginWithKakaoTalk success.")
        // TODO: - 키체인에 토큰 저장하기
        print(oauthToken ?? "No Token")
      }
    }
  }
  
  private func kakaoLoginWithAccount() {
    UserApi.shared.loginWithKakaoAccount {(oauthToken, error) in
      if let error = error {
        print(error)
      }
      else {
        print("loginWithKakaoAccount() success.")
        
        //do something
        _ = oauthToken
      }
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
  
  func getUserInfo() {
    UserApi.shared.me() {(user, error) in
      if let error = error {
        print(error)
      }
      else {
        print("me() success.")
        
        //do something
        let userName = user?.kakaoAccount?.name ?? ""
        let userEmail = user?.kakaoAccount?.email ?? ""
        let userProfile = user?.kakaoAccount?.profile?.profileImageUrl
        
        print("이름: \(userName)")
        print("이메일: \(userEmail)")
        print("프로필: \(userProfile)")
      }
    }
  }
}
