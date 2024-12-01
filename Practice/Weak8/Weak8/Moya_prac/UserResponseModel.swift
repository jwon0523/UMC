//
//  UserResponseModel.swift
//  Weak8
//
//  Created by jaewon Lee on 12/1/24.
//

import Foundation

struct UserResponseModel: Codable {
  let id: Int
  let email: String
  let password: String
  let name: String
  let role: String
  let avatar: String
}
