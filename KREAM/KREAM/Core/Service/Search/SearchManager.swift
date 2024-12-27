//
//  SearchManager.swift
//  KREAM
//
//  Created by jaewon Lee on 12/24/24.
//

import Foundation
import Moya

class SearchManager {
  private let provider = MoyaProvider<SearchRouter>()
  
  func fetchSearchResults(
    query: String,
    completion: @escaping (Result<SearchResponse, Error>) -> Void
  ) {
    provider.request(.search(query: query)) { result in
      switch result {
      case .success(let response):
        do {
          let searchResponse = try JSONDecoder().decode(
            SearchResponse.self,
            from: response.data
          )
          completion(.success(searchResponse))
        } catch {
          completion(.failure(error))
        }
      case .failure(let error):
        completion(.failure(error))
      }
    }
  }
}
