//
//  UserInfoResponse.swift
//  KREAM
//
//  Created by jaewon Lee on 12/24/24.
//

import Foundation

struct UserInfoResponse: Codable {
    let id: Int
    let properties: [String: String]?
}
