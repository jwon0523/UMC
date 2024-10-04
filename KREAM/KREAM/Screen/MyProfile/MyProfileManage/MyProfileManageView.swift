//
//  MyProfileManageView.swift
//  KREAM
//
//  Created by jaewon Lee on 10/4/24.
//

import UIKit

class MyProfileManageView: UIView {
  override init(frame: CGRect) {
    super.init(frame: frame)
    self.backgroundColor = .white
    self.addCompoents()
    self.setUpConstraints()
  }
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  let profileImage: UIImageView = {
    let img = UIImageView()
    img.image = UIImage(named: "ProfileImage")
    img.contentMode = .scaleAspectFill
    img.clipsToBounds = true
    img.layer.cornerRadius = 50
    return img
  }()
  
  let profileLabel: UILabel = {
    let label = UILabel()
    label.text = "프로필 정보"
    label.font = .systemFont(ofSize: 18, weight: .medium)
    label.textColor = .black
    return label
  }()
  
  public let loginLabel: UILabel = {
    let label = UILabel()
    label.font = UIFont.systemFont(
      ofSize: 12,
      weight: .bold
    )
    label.text = "유저 이메일"
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
    label.text = "유저 비밀번호"
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
  
  let createProfileBtn: (String) -> UIButton = { title in
    let button = UIButton()
    button.setTitle(title, for: .normal)
    button.setTitleColor(.black, for: .normal)
    button.titleLabel?.font = .systemFont(ofSize: 14, weight: .medium)
    button.layer.borderWidth = 1
    button.layer.borderColor = UIColor.systemGray.cgColor
    button.layer.cornerRadius = 8
    return button
  }
  
  lazy var loginCheckButton = createProfileBtn("확인")
  lazy var pwdCheckButton = createProfileBtn("확인")
}

private extension MyProfileManageView {
  func addCompoents() {
    self.addSubview(profileImage)
    self.addSubview(profileLabel)
    self.addSubview(loginField)
    self.addSubview(loginLabel)
    self.addSubview(pwdField)
    self.addSubview(pwdLabel)
    self.addSubview(loginCheckButton)
    self.addSubview(pwdCheckButton)
  }
  
  func setUpConstraints() {
    profileImage.translatesAutoresizingMaskIntoConstraints = false
    profileLabel.translatesAutoresizingMaskIntoConstraints = false
    loginField.translatesAutoresizingMaskIntoConstraints = false
    loginLabel.translatesAutoresizingMaskIntoConstraints = false
    pwdField.translatesAutoresizingMaskIntoConstraints = false
    pwdLabel.translatesAutoresizingMaskIntoConstraints = false
    loginCheckButton.translatesAutoresizingMaskIntoConstraints = false
    pwdCheckButton.translatesAutoresizingMaskIntoConstraints = false
    
    profileImage.snp.makeConstraints {
      $0.top.equalTo(safeAreaLayoutGuide.snp.top).offset(52)
      $0.leading.equalToSuperview().offset(151)
      $0.trailing.equalToSuperview().offset(-151)
      $0.height.width.equalTo(90)
    }
    
    profileLabel.snp.makeConstraints {
      $0.top.equalTo(profileImage.snp.bottom).offset(20)
      $0.leading.equalToSuperview().offset(25)
      $0.trailing.equalToSuperview().offset(-25)
    }
    
    loginLabel.snp.makeConstraints {
      $0.top.equalTo(profileLabel.snp.bottom).offset(52)
      $0.leading.equalToSuperview().offset(25)
      $0.trailing.equalToSuperview().offset(-25)
    }
    
    loginField.snp.makeConstraints {
      $0.top.equalTo(loginLabel.snp.bottom).offset(4)
      $0.leading.equalToSuperview().offset(25)
      $0.trailing.equalTo(loginCheckButton.snp.leading).offset(-9)
      $0.width.equalTo(282)
      $0.height.equalTo(32)
    }
    
    pwdLabel.snp.makeConstraints {
      $0.top.equalTo(loginField.snp.bottom).offset(23)
      $0.leading.equalToSuperview().offset(25)
      $0.trailing.equalToSuperview().offset(-25)
    }
    
    pwdField.snp.makeConstraints {
      $0.top.equalTo(pwdLabel.snp.bottom).offset(4)
      $0.leading.equalToSuperview().offset(25)
      $0.trailing.equalTo(pwdCheckButton.snp.leading).offset(-9)
      $0.width.equalTo(282)
      $0.height.equalTo(32)
    }
    
    loginCheckButton.snp.makeConstraints {
      $0.leading.equalTo(loginField.snp.trailing).offset(9)
      $0.trailing.equalToSuperview().offset(-17)
      $0.top.equalTo(loginLabel.snp.bottom).offset(4)
      $0.width.equalTo(58)
      $0.height.equalTo(32)
    }
    
    pwdCheckButton.snp.makeConstraints {
      $0.leading.equalTo(pwdField.snp.trailing).offset(9)
      $0.trailing.equalToSuperview().offset(-17)
      $0.top.equalTo(pwdLabel.snp.bottom).offset(4)
      $0.width.equalTo(58)
      $0.height.equalTo(32)
    }
  }
}
