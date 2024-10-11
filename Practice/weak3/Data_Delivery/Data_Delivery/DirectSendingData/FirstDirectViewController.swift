//
//  ViewController.swift
//  Data_Delivery
//
//  Created by jaewon Lee on 10/10/24.
//

import UIKit

class FirstDirectViewController: UIViewController {
  
  private lazy var textField: UITextField = {
    let textField = UITextField()
    textField.borderStyle = .roundedRect
    textField.placeholder = "텍스트를 입력해주세요"
    textField.translatesAutoresizingMaskIntoConstraints = false
    return textField
  }()
  
  private lazy var button: UIButton = {
    let btn = UIButton(type: .system)
    btn.setTitle("두 번째 화면으로 넘어가기", for: .normal)
    btn.translatesAutoresizingMaskIntoConstraints = false
    return btn
  }()
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    setupView()
  }
  
  func setupView() {
    self.view.addSubview(textField)
    self.view.addSubview(button)
    
    NSLayoutConstraint.activate([
      textField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      textField.centerYAnchor.constraint(equalTo: view.centerYAnchor),
      
      button.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 20),
      button.centerXAnchor.constraint(equalTo: view.centerXAnchor)
    ])
    
    button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
  }
  
  @objc func didTapButton() {
    // SecondViewController 인스턴스를 생성
    let secondVC = SecondDirectViewController()
    
    // 사용자가 입력한 텍스트를 SecondViewController의 변수에 전달
    secondVC.receivedData = textField.text
    
    // 화면 전환
    navigationController?.pushViewController(secondVC, animated: true)
  }
}
