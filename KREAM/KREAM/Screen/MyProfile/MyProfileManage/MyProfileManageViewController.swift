//
//  MyProfileManageViewController.swift
//  KREAM
//
//  Created by jaewon Lee on 10/4/24.
//

import UIKit

class MyProfileManageViewController: UIViewController, UIGestureRecognizerDelegate {
  public var profileImageName: String?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.view = MyProfileManageView()
    navigationTitle()
    customBackButton()
  }
}

private extension MyProfileManageViewController {
  func customBackButton() {
    let customBackButton = UIBarButtonItem(
      image: UIImage(systemName: "arrow.backward"),
      style: .plain,
      target: self,
      action: #selector(backButtonTapped)
    )
    customBackButton.tintColor = .black
    navigationItem.hidesBackButton = true
    navigationItem.leftBarButtonItem = customBackButton
    
    // 스와이프 제스처 활성화
    // UINavigationController의 interactivePopGestureRecognizer 설정시 UIGestureRecognizerDelegate 프로토콜을 채택해야 delegeate를 self로 설정 가능
    navigationController?.interactivePopGestureRecognizer?.delegate = self
    navigationController?.interactivePopGestureRecognizer?.isEnabled = true
  }
  
  @objc
  func backButtonTapped() {
    // 원하는 뒤로가기 동작 (기본 pop 또는 원하는 동작 추가)
    navigationController?.popViewController(animated: true)
  }

  func navigationTitle() {
    navigationItem.title = "프로필 관리"
    navigationController?.navigationBar.titleTextAttributes = [
      NSAttributedString.Key.foregroundColor: UIColor.black,
      NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 16)
    ]
  }
}
