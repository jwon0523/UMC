//
//  SearchRouter.swift
//  KREAM
//
//  Created by jaewon Lee on 12/24/24.
//

import Foundation
import Moya

enum SearchRouter {
  case search(query: String)
}

extension SearchRouter: BaseURLProtocol {
  var path: String {
    switch self {
    case .search:
      return "/products/search"
    }
  }
  
  var method: Moya.Method {
    switch self {
    case .search:
      return .get
    }
  }
  
  var task: Moya.Task {
    switch self {
    case .search(let query):
      return .requestParameters(
        parameters: ["q": query],
        encoding: URLEncoding.default
      )
    }
  }
  
  var headers: [String : String]? {
    let headers = ["Content-Type": "application/json"]
    
    return headers
  }
  
  
}
