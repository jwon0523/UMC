//
//  KeyChainService.swift
//  KREAM
//
//  Created by jaewon Lee on 11/24/24.
//

import Foundation
import Security

class KeychainManager: @unchecked Sendable {
  static let standard = KeychainManager()
  
  private func save(_ data: Data, for key: String) -> Bool {
    /// keychain에 저장할 데이터의 속성과 값을 정의
    let query: [CFString: Any] = [
      kSecClass: kSecClassGenericPassword, // 키체인 항목의 유형 지정(일반 비밀번호로 지정)
      kSecAttrAccount: key, // 저장하려는 데이터와 연결할 키. 데이터 검색 및 삭제 시 이 값을 기준으로 조회
      kSecValueData: data, // 실제로 저장할 데이터. 항상 Data 타입이어야 함.
      // 디바이스 잠금이 해제된 상태에서만 데이터 접근하도록 설정
      kSecAttrAccessible: kSecAttrAccessibleWhenUnlocked
    ]
    
    // 동일한 키를 가진 항목이 이미 키체인에 저장되어 있으면 삭제(중복 추가 불가능하기 때문)
    SecItemDelete(query as CFDictionary)
    // 데이터가 설정된 조건에 맞게 키체인에 저장되었는지 확인하고, 새 항목 저장
    // 두 번째 매개변수는 새 항목의 래퍼런스를 반환하기 위한 포인터. nil로 설정하면 반환값을 무시함.
    // noErr는 저장 성공을 나타내는 상태 코드
    return SecItemAdd(query as CFDictionary, nil) == noErr
  }
  
  private func load(key: String) -> Data? {
    let query: [CFString: Any]  = [
      kSecClass: kSecClassGenericPassword,
      kSecAttrAccount: key,
      kSecReturnData: kCFBooleanTrue!, // 검색 결과로 데이터를 반환할지 여부를 정의
      kSecMatchLimit: kSecMatchLimitOne // 검색 결과의 개수를 제한
    ]
    
    var item: AnyObject?
    // 키체인 항목을 검색하는 함수
    // &item은 검색 결과를 저장할 포인터
    let status = SecItemCopyMatching(query as CFDictionary, &item)
    
    guard status == noErr, let data = item as? Data else { return nil }
    
    return data
  }
  
  private func delete(key: String) {
    let query: [CFString: Any] = [
      kSecClass: kSecClassGenericPassword,
      kSecAttrAccount: key
    ]
    
    SecItemDelete(query as CFDictionary)
  }
  
  public func saveSession(_ session: UserKeychainInfo, for key: String) -> Bool {
    // 객체나 구조체를 키체인에 저장할 때는 JSON 인코더를 사용해 Data로 변환 후 저장
    guard let data = try? JSONEncoder().encode(session) else { return false }
    return save(data, for: key)
  }
  
  public func loadSession(for key: String) -> UserKeychainInfo? {
    guard let data = load(key: key),
          let session = try? JSONDecoder().decode(UserKeychainInfo.self, from: data) else  { return nil}
    return session
  }
  
  public func deleteSession(for key: String) {
    delete(key: key)
  }
}
