//
//  LoginModel.swift
//  KREAM
//
//  Created by jaewon Lee on 9/26/24.
//

import Foundation

struct LoginModel {
  var id: String
  var pwd: String
}

class LoginUserDefaultsModel {
  private let userDefault = UserDefaults.standard
  private let userTextKey: String = "userLoginText"
  
  public func saveUserInfo(_ isLoginSuccess: Bool) {
    userDefault.set(isLoginSuccess, forKey: userTextKey)
  }
  
  public func loadUserLoginInfo() -> Bool? {
    userDefault.bool(forKey: userTextKey)
  }
}
