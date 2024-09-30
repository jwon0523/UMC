//
//  ModalViewController.swift
//  week2
//
//  Created by jaewon Lee on 9/30/24.
//

import UIKit
import SnapKit

class ModalViewController: UIViewController {
  private let label = UILabel()
  private let button = UIButton()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    button.addTarget(self, action: #selector(buttonDidTap), for: .touchUpInside)
    
    label.text = "버튼을 누르면 모달 방식의 화면 전환이 일어나요."
    label.textColor = .cyan
    
    button.setTitle("버튼을 눌러주세요", for: .normal)
    button.backgroundColor = .systemBlue
    
    view.addSubview(label)
    view.addSubview(button)
    
    label.snp.makeConstraints {
      $0.top.equalToSuperview().offset(80)
      $0.centerX.equalToSuperview()
    }
    
    button.snp.makeConstraints { make in
      make.top.equalTo(label.snp.bottom).offset(20)
      make.centerX.equalToSuperview()
      make.height.equalTo(55)
      make.width.equalTo(255)
    }
  }
  
  @objc private func buttonDidTap() {
    let viewController = UIViewController()
    
    viewController.view.backgroundColor = .brown
    viewController.modalPresentationStyle = .automatic
    
    present(viewController, animated: true)
  }
  
}
