//
//  SecondViewController.swift
//  Data_Delivery
//
//  Created by jaewon Lee on 10/10/24.
//

import UIKit

/*
 <직접 할당을 통한 데이터 전달>
 장점으로는 코드가 매우 직관적이며, 최소한의 코드로 쉽게 데이터 전달 가능.
 단점은 단방향으로만 데이터 전달이 가능하며, 다수의 화면 간에 해야 할 경우 복잡해짐. 또한 화면 간에 강하게 결합되어 있기 때문에 뷰 컨트롤의 의존성이 높아지고, 이는 코드의 재사용성을 떨어뜨릴 수 있음.
 */

class SecondDirectViewController: UIViewController {
  
  // 데이터를 받을 public 변수 선언
  public var receivedData: String?
  
  // UI 요소 생성
  private lazy var label: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    setupLabel()
    
    // 전달받은 데이터를 레이블에 표시
    if let data = receivedData {
      label.text = data
    }
  }
  
  func setupLabel() {
    view.addSubview(label)
    NSLayoutConstraint.activate([
      label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      label.centerYAnchor.constraint(equalTo: view.centerYAnchor)
    ])
  }}
