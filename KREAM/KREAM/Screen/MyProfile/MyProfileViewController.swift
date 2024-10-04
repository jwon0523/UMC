//
//  MyProfileView.swift
//  KREAM
//
//  Created by jaewon Lee on 10/2/24.
//

import UIKit

class MyProfileViewController: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.view = MyProfileView()
  }
  
  private lazy var myProfileView: MyProfileView = {
    let view = MyProfileView()
    view.profileManageBtn.addTarget(self, action: #selector (profileManageBtnTapped), for: .touchUpInside)
    return view
  }()
  
  @objc
  private func profileManageBtnTapped() {
    
  }
}
