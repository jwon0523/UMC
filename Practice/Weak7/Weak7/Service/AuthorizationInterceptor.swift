//
//  AuthorizationInterceptor.swift
//  Weak7
//
//  Created by jaewon Lee on 11/23/24.
//

import Foundation
import Alamofire

final class AuthorizationInterceptor: RequestInterceptor {
  private let kakaoKey: String
  
  init(kakaoKey: String) {
    self.kakaoKey = kakaoKey
  }
  
  func adapt(
    _ urlRequest: URLRequest,
    for session: Session,
    completion: @escaping (Result<URLRequest, Error>) -> Void
  ) {
    var request = urlRequest
    request.setValue(
      "KakaoAK \(kakaoKey)",
      forHTTPHeaderField: "Authorization"
    )
    completion(.success(request))
  }
  
  func retry(
    _ request: Request,
    for session: Session,
    dueTo error: any Error,
    completion: @escaping (RetryResult) -> Void
  ) {
    completion(.doNotRetry)
  }
}
