//
//  UserDefaultsModel.swift
//  UserDefaults
//
//  Created by jaewon Lee on 10/8/24.
//

import Foundation
import UIKit
/*
 - UserDefault는 iOS와 macOS에서 사용하는 간단한 경량 데이터의 저장소(문자열, 숫자, 날짜, 배열 등)
 - UserDefault는 싱글톤 패턴으로 설계됨. 싱글톤 패턴이란, 특정 클래스의 인스턴스가 오직 하나만 존재하도록 보장하는 디자인 패턴. 인스턴스가 오직 하나이기 때문에 전역적으로 데이터를 쉽게 공유하고 관리 가능하며, 항상 동일한 데이터에 접근 가능함
 - UserDefaults는 스레드 안정성 염두하고 설계되었기 때문에 여러 곳에서 동시에 호출하여 데이터를 읽고 써도 순서가 꼬이거나 서로 영향을 끼칠 걱정 안해도 됨.
 */
class UserDefaultsModel {
  /*
   standard는 싱글톤 인스턴스임. 이걸 통해 앱 내전역으로 인스턴스 생성
   만약 특정 그룹이나 저장소에 데이터 저장하고 싶다면 standard 대신 사용자 지정 UserDefaults를 사용하면 됨.
   (자세한건 더 찾아보기)
   */
  private let userDefaults = UserDefaults.standard
  private let userTextKey: String = "userText"
  
  public func saveUserText(_ text: String) {
    userDefaults.set(text, forKey: userTextKey) // text 저장, forKey를 통해 UserDefaults 식별
  }
  
  public func loadUserText() -> String? {
    return userDefaults.string(forKey: userTextKey)
  }
}
