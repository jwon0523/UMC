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
  case postFile(image: Data)
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
    case .postFile:
      return "api/v1/files/upload"
    }
  }
  
  var method: Moya.Method {
    switch self {
    case .getAllUsers:
      return .get
    case .postFile(image: let image):
      return .post
    }
  }
  
  var task: Moya.Task {
    switch self {
    case .getAllUsers:
      return .requestPlain // 요청 파라미터 없음
    case .postFile(image: let image):
      let formData = MultipartFormData(
        provider: .data(image),
        name: "file",
        fileName: "jokeBear",
        mimeType: "image/jpeg" // MIME: 데이터 종류와 형식을 알려주는 "라벨" 역할
      )
      
      return .uploadMultipart([formData])
    }
  }
  
  var headers: [String : String]? {
    switch self {
    case .getAllUsers:
      return ["Content-Type": "application/json"]
    case .postFile:
      return ["Content-Type": "multipart/form-data"]
    }
  }
  
  
}
