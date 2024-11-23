//
//  SearchModel.swift
//  Weak7
//
//  Created by jaewon Lee on 11/23/24.
//

import Foundation

struct SearchModel: Codable {
  let documents: [DetailDocument]
}

struct DetailDocument: Codable {
  let contestText: String
  let date: String
  let titleText: String
  let urlText: String
  
  enum CodingKeys: String, CodingKey {
    case contestText = "contents"
    case date = "datetime"
    case titleText = "title"
    case urlText = "url"
  }
}

//struct DetailDocument: Codable {
//  let contents: String
//  let datetime: String
//  let title: String
//  let url: String
//}
