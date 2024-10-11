//
//  SecondViewController.swift
//  Data_Delivery
//
//  Created by jaewon Lee on 10/10/24.
//

import UIKit

class SecondDelegateViewController: UIViewController {
  // 델리게이트를 위한 weak 변수 선언 (메모리 누수 방지)
  weak var delegate: DataSendingDelegate?
  
  // UI 요소들 선언
  private lazy var textField: UITextField = {
    let textField = UITextField()
    textField.borderStyle = .roundedRect
    textField.placeholder = "데이터를 입력해주세요"
    textField.translatesAutoresizingMaskIntoConstraints = false
    return textField
  }()
  
  private lazy var button: UIButton = {
    let button = UIButton(type: .system)
    button.setTitle("데이터 보내기", for: .normal)
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    setupViews()
  }
  
  func setupViews() {
    view.addSubview(textField)
    view.addSubview(button)
    
    NSLayoutConstraint.activate([
      textField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      textField.centerYAnchor.constraint(equalTo: view.centerYAnchor),
      
      button.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 20),
      button.centerXAnchor.constraint(equalTo: view.centerXAnchor)
    ])
    
    // 버튼 클릭 시 데이터를 전달
    button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
  }
  
  @objc func didTapButton() {
    // 델리게이트를 통해 데이터 전달 후 이전 화면으로 돌아감
    if let data = textField.text {
      delegate?.sendData(data)
      navigationController?.popViewController(animated: true)
    }
  }}
