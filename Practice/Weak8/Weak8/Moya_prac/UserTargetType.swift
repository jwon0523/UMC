//
//  UserTargetType.swift
//  Weak8
//
//  Created by jaewon Lee on 12/1/24.
//

import Foundation
import Moya

enum UserTargetType {
  case getAllUsers
}

extension UserTargetType: TargetType {
  var baseURL: URL {
    guard let baseURL = URL(string: "https://api.escuelajs.co") else {
      fatalError("Base URL is not valid")
    }
    return baseURL
  }
  
  var path: String {
    switch self {
    case .getAllUsers:
      return "/api/v1/users"
    }
  }
  
  var method: Moya.Method {
    switch self {
    case .getAllUsers:
      return .get
    }
  }
  
  var task: Moya.Task {
    switch self {
    case .getAllUsers:
      return .requestPlain // 요청 파라미터 없음
    }
  }
  
  var headers: [String : String]? {
    return ["Content-Type": "application/json"]
  }
  
  
}
