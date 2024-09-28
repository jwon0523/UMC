//
//  LoginView.swift
//  KREAM
//
//  Created by jaewon Lee on 9/26/24.
//

import UIKit

class LoginView: UIView {
  override init(frame: CGRect) {
    super.init(frame: frame)
    self.backgroundColor = .white
    self.addComponents()
    self.autoLayoutSetup()
    self.setupConstraints()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  public let kreamImgLogo: UIImageView = {
    let img = UIImageView()
    img.image = UIImage(named: "KreamLogo")
    return img
  }()
  
  public let loginLabel: UILabel = {
    let label = UILabel()
    label.font = UIFont.systemFont(
      ofSize: 12,
      weight: .bold
    )
    label.text = "이메일 주소"
    label.textColor = .black
    label.textAlignment = .left
    return label
  }()
  
  public let loginField: UITextField = {
    let field = UITextField()
    field.placeholder = "예) kream@kream.co.kr"
    field.font = UIFont.systemFont(ofSize: 12)
    field.layer.cornerRadius = 15
    // 경계 넘어가는 부분 잘라냄
    field.layer.masksToBounds = true
    // ios 기기별 저수준 색상 지원 위해 cgColor로 변환
    field.layer.borderColor = UIColor.gray.cgColor
    field.layer.borderWidth = 1
    field.borderStyle = .roundedRect
    return field
  }()
  
  public let pwdLabel: UILabel = {
    let label = UILabel()
    label.font = UIFont.systemFont(
      ofSize: 12,
      weight: .bold
    )
    label.text = "비밀번호"
    label.textColor = .black
    label.textAlignment = .left
    return label
  }()
  
  public let pwdField: UITextField = {
    let field = UITextField()
    field.placeholder = "비밀번호를 입력해 주세요."
    field.font = UIFont.systemFont(ofSize: 12)
    field.layer.cornerRadius = 15
    // 경계 넘어가는 부분 잘라냄
    field.layer.masksToBounds = true
    // ios 기기별 저수준 색상 지원 위해 cgColor로 변환
    field.layer.borderColor = UIColor.gray.cgColor
    field.layer.borderWidth = 1
    field.borderStyle = .roundedRect
    field.isSecureTextEntry = true
    return field
  }()
  
  let loginBtn: UIButton = {
    let button = UIButton()
    
    // ios 15부터는 configuration을 통해 버튼 속성 정의
    var config = UIButton.Configuration.filled()
    config.attributedTitle = AttributedString(
      "로그인",
      attributes: AttributeContainer([
        .foregroundColor: UIColor.white,
        .font: UIFont.systemFont(ofSize: 14, weight: .bold)
      ])
    )
    config.baseBackgroundColor = .systemBlue
    config.titleAlignment = .center
    config.background.cornerRadius = 8
    
    button.configuration = config
    
    return button
  }()
  
  let kakaoLoginBtn: UIButton = {
    let button = UIButton()
    var config = UIButton.Configuration.filled()
    
    if let logoImage = UIImage(named: "KakaoLogin") {
      config.image = logoImage
      config.imagePlacement = .leading
      config.imagePadding = 69
      // 콘텐트 위치 세밀하게 조정
      config.contentInsets = NSDirectionalEdgeInsets(
        top: 0,
        leading: 17,
        bottom: 0,
        trailing: 100
      )
    }
    
    // 텍스트 세밀하게 조절
    config.attributedTitle = AttributedString(
      "카카오로 로그인",
      attributes: AttributeContainer([
        .foregroundColor: UIColor.black,
        .font: UIFont.boldSystemFont(ofSize: 13),
      ])
    )
    config.titleAlignment = .center
    config.baseBackgroundColor = .white
    config.background.cornerRadius = 10
    config.background.strokeColor = .gray
    config.background.strokeWidth = 1
    
    button.configuration = config
    
    return button
  }()
  
  let appleLoginBtn: UIButton = {
    let button = UIButton()
    var config = UIButton.Configuration.filled()
    
    if let logoImage = UIImage(named: "AppleLogin") {
      config.image = logoImage
      config.imagePlacement = .leading
      config.imagePadding = 69
      config.contentInsets = NSDirectionalEdgeInsets(
        top: 0,
        leading: 17,
        bottom: 0,
        trailing: 100
      )
    }
    
    config.attributedTitle = AttributedString(
      "Apple로 로그인",
      attributes: AttributeContainer([
        .foregroundColor: UIColor.black,
        .font: UIFont.boldSystemFont(ofSize: 13),
      ])
    )
    config.titleAlignment = .center
    config.baseBackgroundColor = .white
    config.background.cornerRadius = 10
    config.background.strokeColor = .gray
    config.background.strokeWidth = 1
    
    button.configuration = config
    
    return button
  }()
}

extension LoginView {
  private func addComponents() {
    self.addSubview(kreamImgLogo)
    self.addSubview(loginLabel)
    self.addSubview(loginField)
    self.addSubview(pwdLabel)
    self.addSubview(pwdField)
    self.addSubview(loginBtn)
    self.addSubview(kakaoLoginBtn)
    self.addSubview(appleLoginBtn)
  }
  
  private func autoLayoutSetup() {
    kreamImgLogo.translatesAutoresizingMaskIntoConstraints = false
    loginField.translatesAutoresizingMaskIntoConstraints = false
    loginLabel.translatesAutoresizingMaskIntoConstraints = false
    pwdField.translatesAutoresizingMaskIntoConstraints = false
    pwdLabel.translatesAutoresizingMaskIntoConstraints = false
    loginBtn.translatesAutoresizingMaskIntoConstraints = false
    kakaoLoginBtn.translatesAutoresizingMaskIntoConstraints = false
    appleLoginBtn.translatesAutoresizingMaskIntoConstraints = false
  }
  
  private func setupConstraints() {
    
    NSLayoutConstraint.activate([
      kreamImgLogo.topAnchor.constraint(
        equalTo: self.topAnchor,
        constant: 126
      ),
      kreamImgLogo.leadingAnchor.constraint(
        equalTo: self.leadingAnchor,
        constant: 53
      ),
      kreamImgLogo.trailingAnchor.constraint(
        equalTo: self.trailingAnchor,
        constant: -53
      ),
      
      loginLabel.topAnchor.constraint(
        equalTo: kreamImgLogo.bottomAnchor,
        constant: 87
      ),
      loginLabel.leadingAnchor.constraint(
        equalTo: self.leadingAnchor,
        constant: 45
      ),
      loginLabel.trailingAnchor.constraint(
        equalTo: self.trailingAnchor,
        constant: -45
      ),
      
      loginField.topAnchor.constraint(
        equalTo: loginLabel.bottomAnchor,
        constant: 8
      ),
      loginField.leadingAnchor.constraint(equalTo: loginLabel.leadingAnchor),
      loginField.trailingAnchor.constraint(equalTo: loginLabel.trailingAnchor),
      loginField.heightAnchor.constraint(equalToConstant: 34),
      
      pwdLabel.topAnchor.constraint(
        equalTo: loginField.bottomAnchor,
        constant: 17
      ),
      pwdLabel.leadingAnchor.constraint(equalTo: loginField.leadingAnchor),
      pwdLabel.trailingAnchor.constraint(equalTo: loginField.trailingAnchor),
      
      pwdField.topAnchor.constraint(
        equalTo: pwdLabel.bottomAnchor,
        constant: 8
      ),
      pwdField.leadingAnchor.constraint(equalTo: pwdLabel.leadingAnchor),
      pwdField.trailingAnchor.constraint(equalTo: pwdLabel.trailingAnchor),
      pwdField.heightAnchor.constraint(equalToConstant: 34),
      
      loginBtn.topAnchor.constraint(
        equalTo: pwdField.bottomAnchor,
        constant: 17
      ),
      loginBtn.leadingAnchor.constraint(equalTo: pwdField.leadingAnchor),
      loginBtn.trailingAnchor.constraint(equalTo: pwdField.trailingAnchor),
      loginBtn.heightAnchor.constraint(equalToConstant: 38),
      
      kakaoLoginBtn.topAnchor.constraint(
        equalTo: loginBtn.bottomAnchor,
        constant: 87
      ),
      kakaoLoginBtn.leadingAnchor.constraint(equalTo: loginBtn.leadingAnchor),
      kakaoLoginBtn.trailingAnchor.constraint(equalTo: loginBtn.trailingAnchor),
      kakaoLoginBtn.heightAnchor.constraint(equalToConstant: 40),
      
      appleLoginBtn.topAnchor.constraint(
        equalTo: kakaoLoginBtn.bottomAnchor,
        constant: 22
      ),
      appleLoginBtn.leadingAnchor.constraint(equalTo: kakaoLoginBtn.leadingAnchor),
      appleLoginBtn.trailingAnchor.constraint(equalTo: kakaoLoginBtn.trailingAnchor),
      appleLoginBtn.heightAnchor.constraint(equalToConstant: 40),
    ])
  }
}
