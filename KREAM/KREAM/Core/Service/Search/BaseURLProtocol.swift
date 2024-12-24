//
//  BaseURLProtocol.swift
//  KREAM
//
//  Created by jaewon Lee on 12/24/24.
//

import Foundation
import Moya

protocol BaseURLProtocol: TargetType {}

extension BaseURLProtocol {
  var baseURL: URL {
    guard let url = URL(string: SecretClass.shared.baseURL()) else {
      fatalError("print: \(SecretClass.shared.baseURL())")
    }
    return url
  }
}
