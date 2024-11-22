//
//  SelectedItemSizeView.swift
//  KREAM
//
//  Created by jaewon Lee on 11/22/24.
//

import UIKit
import SnapKit

class SelectedItemSizeView: UIView {
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    self.backgroundColor = .white
    self.addStackView()
    self.addComponents()
    self.constraints()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private lazy var productImageView: UIImageView = {
    let imageView = UIImageView()
    imageView.clipsToBounds = true
    imageView.layer.cornerRadius = 8
    return imageView
  }()
  
  /// 구매 상품 이름 라벨
  private lazy var productNameLabel: UILabel = makeLabel("aaaaaa", UIFont.systemFont(ofSize: 14, weight: .regular), color: .black)
  
  /// 구매 상품 설명 라벨
  private lazy var productDescription: UILabel = makeLabel("bbbbb", UIFont.systemFont(ofSize: 12, weight: .regular), color: .lightGray)
  
  /// 상품 사이즈 버튼 컬렉션 뷰 -> 사이즈를 컬렉션 뷰로 처리하여 간편하게 생성
  public lazy var collectionView: UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
    collectionView.register(
      SizeCell.self,
      forCellWithReuseIdentifier: SizeCell.identifier
    )
    
    return collectionView
  }()
  
  /// 커스텀한 왼쪽 빠른 배송 버튼
  public lazy var leftSpeedBtn: ShippingButtonView = makeBottomBtn(price: "345,000", type: .quick)
  
  /// 커스텀한 우측 일반 배송 버튼
  public lazy var rightNormalBtn: ShippingButtonView = makeBottomBtn(price: "407,000", type: .standard)
  
  /// 빠른 배송 및 일반 배송 버튼을 담고 있는 하단 백그라운드 뷰
  private lazy var bottomBackgroundView: DividedLineView = DividedLineView()
  
  /// 상품 이름과 상품 설명을 담는 스택
  private lazy var productInfoStack: UIStackView = makeStackView(spacing: 4, axis: .vertical)
  
  /// 하단 빠른 배송 및 일반 배송 버튼을 담은 스택뷰
  private lazy var bottomButtonStack: UIStackView = makeStackView(spacing: 6, axis: .horizontal)
  
}

extension SelectedItemSizeView {
  private func makeLabel(
    _ text: String,
    _ font: UIFont,
    color: UIColor
  ) -> UILabel {
    let label = UILabel()
    label.text = text
    label.font = font
    label.textColor = color
    return label
  }
  
  private func makeBottomBtn(
    price: String,
    type: ShippingButtonType
  ) -> ShippingButtonView {
    let btn = ShippingButtonView(frame: .zero, btnType: type)
    btn.priceLabel.text = price
    btn.isUserInteractionEnabled = true
    return btn
  }
  
  private func makeStackView(
    spacing: CGFloat,
    axis: NSLayoutConstraint.Axis
  ) -> UIStackView {
    let stack = UIStackView()
    stack.axis = axis
    stack.spacing = spacing
    stack.distribution = .equalSpacing
    return stack
  }
  
  public func changeValue(data: ReceiveSelectedItemSizeData) {
    self.productImageView.image = data.image
    self.productNameLabel.text = data.productName
    self.productDescription.text = data.prodcutDescription
  }
}

private extension SelectedItemSizeView {
  func addStackView() {
    [productNameLabel, productDescription].forEach{ self.productInfoStack.addArrangedSubview($0) }
    [leftSpeedBtn, rightNormalBtn].forEach{ self.bottomButtonStack.addArrangedSubview($0) }
  }
  
  func addComponents() {
    [productImageView, productInfoStack, collectionView, bottomBackgroundView].forEach{ self.addSubview($0) }
    [bottomButtonStack].forEach{ self.bottomBackgroundView.addSubview($0) }
  }
  func constraints() {
    productImageView.snp.makeConstraints {
      $0.top.equalTo(self.safeAreaLayoutGuide).offset(5)
      $0.left.equalToSuperview().offset(16)
      $0.width.height.equalTo(91)
    }
    
    productInfoStack.snp.makeConstraints {
      $0.centerY.equalTo(productImageView.snp.centerY)
      $0.left.equalTo(productImageView.snp.right).offset(15)
      $0.right.equalToSuperview().offset(-20)
      $0.height.equalTo(35)
    }
    
    collectionView.snp.makeConstraints {
      $0.top.equalTo(productImageView.snp.bottom).offset(35)
      $0.left.equalToSuperview().offset(15)
      $0.right.equalToSuperview().offset(-15)
      $0.height.greaterThanOrEqualTo(115)
    }
    
    bottomBackgroundView.snp.makeConstraints {
      $0.bottom.left.right.equalToSuperview()
      $0.height.equalTo(95)
    }
    
    bottomButtonStack.snp.makeConstraints {
      $0.top.equalToSuperview().offset(8)
      $0.centerX.equalToSuperview()
      $0.width.equalTo(342)
      $0.height.equalTo(52)
    }
    
    leftSpeedBtn.snp.makeConstraints {
      $0.width.equalTo(168)
      $0.height.equalTo(52)
    }
    
    rightNormalBtn.snp.makeConstraints {
      $0.width.equalTo(168)
      $0.height.equalTo(52)
    }
  }
}
