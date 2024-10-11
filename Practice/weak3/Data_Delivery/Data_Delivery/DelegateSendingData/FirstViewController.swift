//
//  SecondViewController.swift
//  Data_Delivery
//
//  Created by jaewon Lee on 10/10/24.
//

import UIKit

// delegate 프로토콜 정의
// 프로토콜로 정의한 이유는 모든 함수에 대한 접근은 막아 캡슐화 하고, 특정 함수는 반드시 사용해야 하기 때문.
// 딜리게이트 패턴에서는 프로토콜을 통해 필요한 메서드를 정의하고, 이를 채택한 클래스(위임자)가 반드시 구현해야 한다는 일종의 계약임.
protocol DataSendingDelegate: AnyObject {
  func sendData(_ data: String)
}

// DataSendingDelegate 채택(위임자 지정)
// sendData는 딜리게이트 채택한 클래스에서 구현.
// sendData의 사용은 호출 클래스가 사용
// 즉, FirstDelegateViewController에 sendData의 구현을 위임한 것.
// 딜리게이트 패턴에서 중요한 것은 실제 작업을 대신 처리하는 메서드를 구현하는 클래스가 있고, 그 작업을 필요할 때 요청하는 클래스가 있다는 것임
class FirstDelegateViewController: UIViewController, DataSendingDelegate {
  
  // UI 요소들 선언
  private lazy var label: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.text = "전달된 데이터 없음"
    return label
  }()
  
  private lazy var button: UIButton = {
    let button = UIButton(type: .system)
    button.setTitle("두 번째 화면으로", for: .normal)
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    setupViews()
  }
  
  func setupViews() {
    view.addSubview(label)
    view.addSubview(button)
    
    NSLayoutConstraint.activate([
      label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      label.centerYAnchor.constraint(equalTo: view.centerYAnchor),
      
      button.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 20),
      button.centerXAnchor.constraint(equalTo: view.centerXAnchor)
    ])
    
    // 버튼 클릭 시 두 번째 화면으로 전환
    button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
  }
  
  @objc func didTapButton() {
    let secondVC = SecondDelegateViewController()
    // secondVC가 현재 클래스로(self)부터 딜리게이트 호출
    secondVC.delegate = self
    navigationController?.pushViewController(secondVC, animated: true)
  }
  
  // 프로토콜 메서드 구현 - 데이터를 받을 준비
  func sendData(_ data: String) {
    label.text = data
  }
}
