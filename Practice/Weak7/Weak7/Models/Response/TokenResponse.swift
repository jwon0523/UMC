//
//  TokenResponse.swift
//  Weak7
//
//  Created by jaewon Lee on 11/24/24.
//

import Foundation

struct TokenResponse: Codable {
    let accessToken: String
    let expiresIn: Int // 토큰 유효 기간 (초 단위)
}
