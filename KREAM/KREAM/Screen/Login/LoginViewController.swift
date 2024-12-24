//
//  ViewController.swift
//  KREAM
//
//  Created by jaewon Lee on 9/26/24.
//

import UIKit

class LoginViewController: UIViewController {
  
  private let loginUserDefaultsModel = LoginUserDefaultsModel()
  
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
    view.kakaoLoginBtn.addTarget(
      self,
      action: #selector(kakaoLoginBtnTapped),
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
      changeRootViewController()
      loginUserDefaultsModel.saveUserInfo(true)
    } else {
      showAlert(
        title: "Error",
        message: "아이디와 비밀번호가 일치하지 않습니다!"
      )
    }
  }
  
  @objc func kakaoLoginBtnTapped() {
    Task {
      do {
        let accessToken = try await KakaoLoginManager.shared.fetchAccessToken()
        let nickname = try await KakaoLoginManager.shared.fetchUserNickname(accessToken: accessToken)
        let keychainCheck = KeychainManager.standard.saveSession(
          UserKeychainInfo(
            accessToken: accessToken,
            nickname: nickname
          ),
          for: "kreamKeychain"
        )
        print("키체인 저장 확인: \(keychainCheck)")
        
        changeRootViewController()
        loginUserDefaultsModel.saveUserInfo(true)
      }
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
  
  /// 로그인 뷰 -> TabBarMainViewController로 전환
  private func changeRootViewController() {
    let rootVC = TabBarMainViewController()
    
    if let window = UIApplication.shared.connectedScenes.first as? UIWindowScene,
       let sceneDelegate = window.delegate as? SceneDelegate,
       let window = sceneDelegate.window {
      window.rootViewController = rootVC
      UIView.transition(
        with: window,
        duration: 0.3,
        options: .transitionCrossDissolve,
        animations: nil,
        completion: nil
      )
    }
  }
  
//  private func showTabBarMainViewController() {
//    lazy var tabBarMainViewController = TabBarMainViewController()
//    tabBarMainViewController.modalPresentationStyle = .fullScreen
//    present(tabBarMainViewController, animated: true)
//  }
}

