//
//  SecretClass.swift
//  KREAM
//
//  Created by jaewon Lee on 12/24/24.
//

import Foundation
class SecretClass {
  static var shared = SecretClass()
  
  func kakaoLoginAppKey() -> String {
    if let kakaoAppKey = Bundle.main.object(forInfoDictionaryKey: "KAKAO_NATIVE_KEY") as? String {
      return kakaoAppKey
    } else {
      return "Not key"
    }
  }
  
  func baseURL() -> String {
    if let baseURL = Bundle.main.object(forInfoDictionaryKey: "BASE_URL") as? String {
      return baseURL
    } else {
      return "BaseURL Not Found"
    }
  }
}
