//
//  ViewController.swift
//  KREAM
//
//  Created by jaewon Lee on 9/26/24.
//

import UIKit

class LoginViewController: UIViewController {
  var loginData: [LoginModel] = [
    LoginModel(id: "1234", pwd: "1234"),
    LoginModel(id: "1", pwd: "1111"),
    LoginModel(id: "2", pwd: "1111"),
    LoginModel(id: "3", pwd: "1111"),
  ]
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.view = loginView
  }
  
  private lazy var loginView: LoginView = {
    let view = LoginView()
    view.loginBtn.addTarget(
      self,
      action: #selector(loginBtnTapped),
      for: .touchUpInside
    )
    return view
  }()
  
  @objc func loginBtnTapped() {
    // guard and 조건으로 loginId와 loginPwd 받아옴
    guard let loginId = loginView.loginField.text, !loginId.isEmpty,
          let loginPwd = loginView.pwdField.text, !loginPwd.isEmpty else {
      showAlert(
        title: "Error",
        message: "아이디와 비밀번호를 입력해주세요!"
      )
      return
    }
    // loginData에서 조건을 만족하는 첫번째 배열 찾음. 못 찾으면 nil 반환
    if loginData.first(
      where: { $0.id == loginId && $0.pwd == loginPwd }
    ) != nil {
//      showAlert(title: "로그인 성공", message: "환영합니다!")
      lazy var tabBarMainViewController = TabBarMainViewController()
      tabBarMainViewController.modalPresentationStyle = .fullScreen
      present(tabBarMainViewController, animated: true)
    } else {
      showAlert(
        title: "Error",
        message: "아이디와 비밀번호가 일치하지 않습니다!"
      )
    }
  }
  
  private func showAlert(title: String, message: String) {
    let alert = UIAlertController(
      title: title,
      message: message,
      preferredStyle: .alert
    )
    alert.addAction(UIAlertAction(title: "OK", style: .default))
    self.present(alert, animated: true)
  }
}

