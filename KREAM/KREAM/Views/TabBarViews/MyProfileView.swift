//
//  MyProfileView.swift
//  KREAM
//
//  Created by jaewon Lee on 10/3/24.
//

import UIKit
import SnapKit

class MyProfileView: UIView {
  override init(frame: CGRect) {
    super.init(frame: frame)
    self.backgroundColor = .white
    self.setUpConstraints()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  let headerView: UIView = UIView()
  
  let settingBtn: UIButton = {
    let btn = UIButton()
    let image = UIImage(named: "SettingIcon")?.withRenderingMode(.alwaysOriginal)
    btn.setImage(image, for: .normal)
    return btn
  }()
  
  let cameraBtn: UIButton = {
    let btn = UIButton()
    let image = UIImage(named: "CameraIcon")?.withRenderingMode(.alwaysOriginal)
    btn.setImage(image, for: .normal)
    return btn
  }()
  
  let profileView: UIView = {
    let view = UIView()
    
    return view
  }()
  
  let profileImage: UIImageView = {
    let img = UIImageView()
    img.image = UIImage(named: "ProfileImage")
    img.contentMode = .scaleAspectFill
    img.clipsToBounds = true
    img.layer.cornerRadius = 50
    return img
  }()
  
  let userNameLabel: UILabel = {
    let label = UILabel()
    label.text = "Jae Won"
    label.font = .systemFont(ofSize: 16, weight: .medium)
    return label
  }()
  
  let followerLabel: UILabel = {
    let label = UILabel()
    label.text = "팔로워 100"
    label.font = .systemFont(ofSize: 12, weight: .medium)
    label.textColor = .black
    return label
  }()
  
  let followingLabel: UILabel = {
    let label = UILabel()
    label.text = "팔로잉 120"
    label.font = .systemFont(ofSize: 12, weight: .medium)
    label.textColor = .black
    return label
  }()
  
  let createProfileBtn: (String) -> UIButton = { title in
    let button = UIButton()
    button.setTitle(title, for: .normal)
    button.setTitleColor(.black, for: .normal)
    button.titleLabel?.font = .systemFont(ofSize: 9, weight: .medium)
    button.layer.borderWidth = 1
    button.layer.borderColor = UIColor.systemGray.cgColor
    button.layer.cornerRadius = 8
    return button
  }
  
  // 클래스나 구조체의 프로퍼티 초기화 단계에서, 초기화 순서 때문에 인스턴스 메서드나 프로퍼티를 직접 사용 불가.
  // init()에서 사용하거나 lazy를 통해 지연 초기화 해줘야 사용 가능.
  lazy var profileManageBtn = createProfileBtn("프로필 관리")
  
  lazy var profileShareBtn = createProfileBtn("프로필 공유")
}

private extension MyProfileView {
  func setUpConstraints() {
    setUpHeaderView()
    setUpProfileView()
  }
  
  func setUpHeaderView() {
    self.addSubview(headerView)
    headerView.addSubview(settingBtn)
    headerView.addSubview(cameraBtn)
    
    headerView.translatesAutoresizingMaskIntoConstraints = false
    settingBtn.translatesAutoresizingMaskIntoConstraints = false
    cameraBtn.translatesAutoresizingMaskIntoConstraints = false
    
    headerView.snp.makeConstraints {
      // SafeArea를 기준으로 작성
      $0.top.equalTo(safeAreaLayoutGuide.snp.top).offset(30)
      $0.leading.trailing.equalToSuperview()
      $0.width.equalToSuperview()
      $0.height.equalTo(25)
    }
    
    settingBtn.snp.makeConstraints {
      $0.leading.equalToSuperview().offset(32.5)
      $0.centerY.equalToSuperview()
      $0.height.width.equalTo(25)
    }
    
    cameraBtn.snp.makeConstraints {
      $0.trailing.equalToSuperview().offset(-32.5)
      $0.centerY.equalToSuperview()
      $0.height.width.equalTo(25)
    }
  }
  
  func setUpProfileView() {
    self.addSubview(profileView)
    profileView.addSubview(profileImage)
    profileView.addSubview(userNameLabel)
    profileView.addSubview(followerLabel)
    profileView.addSubview(followingLabel)
    self.addSubview(profileManageBtn)
    self.addSubview(profileShareBtn)
    
    profileView.translatesAutoresizingMaskIntoConstraints = false
    profileImage.translatesAutoresizingMaskIntoConstraints = false
    userNameLabel.translatesAutoresizingMaskIntoConstraints = false
    followerLabel.translatesAutoresizingMaskIntoConstraints = false
    followingLabel.translatesAutoresizingMaskIntoConstraints = false
    profileManageBtn.translatesAutoresizingMaskIntoConstraints = false
    profileShareBtn.translatesAutoresizingMaskIntoConstraints = false
    
    // UIView는 width와 height을 모도 설정해 주지 않으면 뷰가 렌더링되지 않음
    profileView.snp.makeConstraints {
      $0.top.equalTo(headerView.snp.bottom).offset(26)
      $0.leading.equalToSuperview().offset(32.5)
      $0.trailing.equalToSuperview().offset(-139.5)
      $0.height.equalTo(90)
      $0.width.equalTo(221)
    }
    
    profileImage.snp.makeConstraints {
      $0.trailing.equalToSuperview().inset(131)
      $0.centerY.equalToSuperview()
      $0.height.width.equalTo(90)
    }
    
    userNameLabel.snp.makeConstraints {
      $0.top.equalToSuperview().offset(21)
      $0.bottom.equalToSuperview().inset(46)
      $0.leading.equalTo(profileImage.snp.trailing).offset(16)
    }
    
    followerLabel.snp.makeConstraints {
      $0.top.equalTo(userNameLabel.snp.bottom).offset(6)
      $0.bottom.equalToSuperview().offset(-21)
      $0.leading.equalTo(profileImage.snp.trailing).offset(16)
    }
    
    followingLabel.snp.makeConstraints {
      $0.top.equalTo(userNameLabel.snp.bottom).offset(6)
      $0.bottom.equalToSuperview().offset(-21)
      $0.leading.equalTo(followerLabel.snp.trailing).offset(8)
    }
    
    profileManageBtn.snp.makeConstraints {
      $0.top.equalTo(profileView.snp.bottom).offset(26)
      $0.leading.equalToSuperview().offset(32.5)
//      $0.trailing.equalTo(profileShareBtn.snp.leading).offset(14)
      $0.height.equalTo(26)
      $0.width.equalTo(157)
    }
    
    profileShareBtn.snp.makeConstraints {
      $0.top.equalTo(profileView.snp.bottom).offset(26)
      $0.trailing.equalToSuperview().offset(-32.5)
      $0.leading.equalTo(profileManageBtn.snp.trailing).offset(14)
      $0.height.equalTo(26)
      $0.width.equalTo(157)
    }
  }
}
