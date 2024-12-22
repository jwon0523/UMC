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
  
  private func getUserInfo() {
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
  
  private func postFile() {
    guard let image = Image(named: "tempImage")?.pngData() else {
      fatalError("Error: Invalid image")
    }
    
    provider.request(.postFile(image: image)) { result in
      switch result {
      case .success(let response):
        do {
          let fileResponse = try response.map(FileResponseModel.self)
          print("Successfully mapped response: \(fileResponse)")
        } catch {
          print("Mapping error: \(error.localizedDescription)")
        }
      case .failure(let error):
        print("Network request error: \(error.localizedDescription)")
      }
    }
    
  }
}
