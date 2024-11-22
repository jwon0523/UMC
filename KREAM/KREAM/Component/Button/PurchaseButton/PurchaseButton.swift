//
//  PurchaseButton.swift
//  KREAM
//
//  Created by jaewon Lee on 11/15/24.
//

import UIKit
import Then

class PurchaseButton: UIView, PurchaseButtonProtocol {
  
  let btnType: PurchaseButtonType
  
  init(frame: CGRect, btnType: PurchaseButtonType) {
    self.btnType = btnType
    super.init(frame: frame)
    
    setConfigure(type: btnType)
    setBackgroundColor(type: btnType)
    setupStackView()
    addComponents()
    setupConstraints()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  var priceLabel =  UILabel().then {
    $0.textColor = .white
    $0.font = .systemFont(ofSize: 13, weight: .semibold)
  }
  
  var subLabel = UILabel().then {
    $0.font = .systemFont(ofSize: 10, weight: .medium)
  }
  
  var buttonLeftLabel = UILabel().then {
    $0.textColor = .white
    $0.font = .systemFont(ofSize: 16, weight: .bold)
  }
  
  var priceInfoStack = UIStackView().then {
    $0.axis = .vertical
    $0.spacing = 2
    $0.distribution = .equalSpacing
    $0.alignment = .leading
  }
}

private extension PurchaseButton {
  func setConfigure(type: PurchaseButtonType) {
    self.clipsToBounds = true
    self.layer.cornerRadius = 10
    
    buttonLeftLabel.text = buttonLeftText(type: type)
    subLabel.text = buttonLeftText(type: type)
  }
  
  func setTextColor(type: PurchaseButtonType) -> UIColor {
    switch type {
    case .purchase:
      return UIColor(red: 0.639, green: 0.216, blue: 0.137, alpha: 1)
    case .sales:
      return UIColor(red: 0.122, green: 0.467, blue: 0.271, alpha: 1)
    }
  }
  
  func setBackgroundColor(type: PurchaseButtonType) {
    switch type {
    case .purchase:
      self.backgroundColor = UIColor(red: 0.937, green: 0.384, blue: 0.329, alpha: 1)
    case .sales:
      self.backgroundColor = UIColor(red: 0.255, green: 0.725, blue: 0.478, alpha: 1)
    }
  }
  
  func buttonLeftText(type: PurchaseButtonType) -> String {
    switch type {
    case .purchase:
      return "구매"
    case .sales:
      return "판매"
    }
  }
}

private extension PurchaseButton {
  func setupStackView() {
    [priceLabel, subLabel].forEach { self.priceInfoStack.addArrangedSubview($0) }
  }
  
  func addComponents() {
    [buttonLeftLabel, priceInfoStack].forEach { self.addSubview($0) }
  }
  
  func setupConstraints() {
    buttonLeftLabel.snp.makeConstraints {
      $0.top.equalToSuperview().offset(15)
      $0.bottom.equalToSuperview().offset(-15)
      $0.left.equalToSuperview().offset(10)
      $0.width.equalTo(28)
    }
    
    priceInfoStack.snp.makeConstraints {
      $0.top.equalToSuperview().offset(8)
      $0.left.equalTo(buttonLeftLabel.snp.right).offset(21)
      $0.width.greaterThanOrEqualTo(53)
      $0.height.equalTo(30)
    }
    
    priceLabel.snp.makeConstraints {
      // 최소 너비 30 이상
      $0.width.greaterThanOrEqualTo(30)
      $0.height.equalTo(16)
    }
    
    subLabel.snp.makeConstraints {
      $0.width.greaterThanOrEqualTo(30)
      $0.height.equalTo(12)
    }
  }
}
