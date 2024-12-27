//
//  SecretClass.swift
//  KREAM
//
//  Created by jaewon Lee on 12/24/24.
//

import Foundation

/// xcconfig에 넣어둔 값을 Info.plist에 할당이 되었으니, 그 값을 가져와서 사용하기 위함입니다.
class SecretClass {
  static var shared = SecretClass()
  
  func kakaoLoginAppkey() -> String {
    if let kakaoAppKey = Bundle.main.object(forInfoDictionaryKey: "KAKAO_NATIVE_KEY") as? String {
      return kakaoAppKey
    } else {
      return "Not Key"
    }
  }
  
  func baseURL() -> String {
    if let baseUrl = Bundle.main.object(forInfoDictionaryKey: "BASE_URL") as? String {
      return baseUrl
    } else {
      return "BaseURL Not Found"
    }
  }
}
