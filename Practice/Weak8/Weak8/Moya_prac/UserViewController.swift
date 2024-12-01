//
//  UserViewController.swift
//  Weak8
//
//  Created by jaewon Lee on 12/1/24.
//

import UIKit
import Moya

class UserViewController: UIViewController {
  private let provider = MoyaProvider<UserTargetType>()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.view.backgroundColor = .white
    
    getUserInfo()
  }
  
  func getUserInfo() {
    provider.request(.getAllUsers) { result in
      switch result {
      case .success(let response):
        do {
          let userResponse = try response.map([UserResponseModel].self)
          print("Successfully mapped response: \(userResponse)")
        } catch {
          print("Mapping error: \(error.localizedDescription)")
        }
      case .failure(let error):
        print("Network request error: \(error.localizedDescription)")
      }
    }
  }
}
