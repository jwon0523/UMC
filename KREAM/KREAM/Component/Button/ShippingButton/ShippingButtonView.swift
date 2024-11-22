//
//  ShippingButton.swift
//  KREAM
//
//  Created by jaewon Lee on 11/22/24.
//

import UIKit
import SnapKit

class ShippingButtonView: UIView {
  let btnType: ShippingButtonType
  
  init(frame: CGRect, btnType: ShippingButtonType) {
    self.btnType = btnType
    super.init(frame: frame)
    
    setConfigure(type: btnType)
    setBackgroundColor(type: btnType)
    addStackView()
    addComponents()
    constraints()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  var priceLabel: UILabel = {
    let label = UILabel()
    label.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
    label.textColor = UIColor.white
    return label
  }()
  
  /// 커스텀 버튼에서 사용할 가격 밑에 보이는 텍스트, "빠른 배송", "일반 배송"
  var subLabel: UILabel = {
    let label = UILabel()
    label.font = UIFont.systemFont(ofSize: 10, weight: .regular)
    return label
  }()
  
  /// 버튼의 왼쪽에 구매 타입의 버튼인지, 판매 타입의 버튼인지 텍스트를 보일 라벨
  var priceInfoStack: UIStackView = {
    let stack = UIStackView()
    stack.axis = .vertical
    stack.spacing = 2
    stack.distribution = .equalSpacing
    stack.alignment = .center
    return stack
  }()
  
}

private extension ShippingButtonView {
  func setConfigure(type: ShippingButtonType) {
    self.clipsToBounds = true
    self.layer.cornerRadius = 10
    //    subLabel.textColor = setTextColor(type: type)
    //    subLabel.text = setSubText(type: type)
  }
  
  func setTextColor(type: ShippingButtonType) -> UIColor {
    switch type {
    case .quick:
      return UIColor(red: 1, green: 0.792, blue: 0.725, alpha: 1)
    case .standard:
      return UIColor(red: 0.886, green: 0.886, blue: 0.856, alpha: 1)
    }
  }
  
  func setBackgroundColor(type: ShippingButtonType) {
    switch type {
    case .quick:
      self.backgroundColor = UIColor(red: 0.937, green: 0.384, blue: 0.329, alpha: 1)
    case .standard:
      self.backgroundColor = UIColor(red: 0.133, green: 0.133, blue: 0.133, alpha: 1)
    }
  }
  
  func setSubText(type: ShippingButtonType) -> String {
    switch type {
    case .quick:
      return "빠른배송(1~2일 소요)"
    case .standard:
      return "정기배송(5~7일 소요)"
    }
  }
}

private extension ShippingButtonView {
  private func addStackView() {
    [priceLabel, subLabel].forEach{ self.priceInfoStack.addArrangedSubview($0) }
  }
  
  private func addComponents() {
    [priceInfoStack].forEach{ self.addSubview($0) }
  }
  
  private func constraints() {
    priceInfoStack.snp.makeConstraints {
      $0.top.equalToSuperview().offset(8)
      $0.centerX.equalToSuperview()
      $0.width.greaterThanOrEqualTo(53)
      $0.height.equalTo(30)
    }
    
    priceLabel.snp.makeConstraints {
      $0.width.greaterThanOrEqualTo(30)
    }
    
    subLabel.snp.makeConstraints {
      $0.width.greaterThanOrEqualTo(30)
    }
  }
}
