//
//  KeyChainService.swift
//  KREAM
//
//  Created by jaewon Lee on 11/24/24.
//

import Foundation
import Security

class KeychainService {
  static let shared = KeychainService()
  
  private init() {}
  
  @discardableResult
  func saveToken(
    token: String,
    account: String,
    service: String
  ) -> OSStatus {
    let tokenData = token.data(using: .utf8)!
    
    // Access Control 설정 (Face ID 또는 기기 잠금 해제 후 접근 가능)
    let accessControl = SecAccessControlCreateWithFlags(
      kCFAllocatorDefault,
      kSecAttrAccessibleWhenUnlocked,
      .userPresence,   // 사용자 인증 (Face ID, Touch ID 또는 기기 암호)
      nil
    )
    
    let query: [String: Any] = [
      kSecClass as String: kSecClassGenericPassword,  // 일반 데이터 저장
      kSecAttrAccount as String: account,             // 계정 이름
      kSecAttrService as String: service,             // 서비스 이름
      kSecValueData as String: tokenData,             // 실제 토큰 데이터
      kSecAttrAccessControl as String: accessControl! // 접근 제어 추가
    ]
    
    // 기존에 저장된 항목이 있다면 삭제
    SecItemDelete(query as CFDictionary)
    
    // 새 항목 저장
    return SecItemAdd(query as CFDictionary, nil)
  }
  
  // 토큰 불러오기
  func loadToken(account: String, service: String) -> String? {
    let query: [String: Any] = [
      kSecClass as String: kSecClassGenericPassword,
      kSecAttrAccount as String: account,
      kSecAttrService as String: service,
      kSecReturnData as String: true,
      kSecMatchLimit as String: kSecMatchLimitOne
    ]
    
    var item: CFTypeRef?
    let status = SecItemCopyMatching(query as CFDictionary, &item)
    
    guard status == errSecSuccess else { return nil }
    
    if let data = item as? Data, let token = String(data: data, encoding: .utf8) {
      return token
    }
    
    return nil
  }
  
  // 토큰 삭제
  @discardableResult
  func deleteToken(account: String, service: String) -> OSStatus {
    let query: [String: Any] = [
      kSecClass as String: kSecClassGenericPassword,
      kSecAttrAccount as String: account,
      kSecAttrService as String: service
    ]
    
    return SecItemDelete(query as CFDictionary)
  }
}
