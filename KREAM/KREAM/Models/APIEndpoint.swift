//
//  APIEndpoint.swift
//  KREAM
//
//  Created by jaewon Lee on 11/25/24.
//

import Foundation

struct APIEndpoint {
  static let baseURL = "https://dapi.kakao.com"
  
  struct Auth {
    // 실제 frereshURL 적용하기
    static let refreshURL = "/auth/refresh"
  }
  
  struct Search {
    static let web = "/v2/search/web"
    static let image = "/v2/search/image"
  }
}
