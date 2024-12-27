//
//  ProductDetailView.swift
//  KREAM
//
//  Created by jaewon Lee on 11/11/24.
//

import UIKit
import SnapKit
import Then

class ItemDetailView: UIView {
  var price: String? {
    didSet {
      priceLabel.text = price
      leftPurchaseBtn.priceLabel.text = price
      rightSalesBtn.priceLabel.text = price
    }
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    self.backgroundColor = .white
    self.setupView()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  public lazy var itemImageView = UIImageView().then {
    $0.contentMode = .scaleAspectFill
  }
  
  public lazy var itemCollectionView: UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    layout.scrollDirection = .horizontal
    layout.itemSize = CGSize(width: 53, height: 53)
    layout.minimumInteritemSpacing = 8
    
    let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
    collection.register(
      ItemDetailCollectionViewCell.self,
      forCellWithReuseIdentifier: ItemDetailCollectionViewCell.identifier
    )
    
    collection.backgroundColor = .white
    return collection
  }()
  
  lazy var priceTitleLabel: UILabel = makeLabel(
    "즉시 구매가",
    UIFont.systemFont(ofSize: 12, weight: .light),
    color: .black
  )
  
  lazy var priceLabel: UILabel = makeLabel(
    "",
    UIFont.systemFont(ofSize: 20, weight: .semibold),
    color: .black
  )
  
  public lazy var itemName: UILabel = makeLabel(
    "Matin Kim Logo Coating Jumprt",
    UIFont.systemFont(ofSize: 16, weight: .regular),
    color: UIColor.black
  )
  public lazy var itemDescription: UILabel = makeLabel(
    "마뗑킴 로고 코팅 점퍼 블랙",
    UIFont.systemFont(ofSize: 12, weight: .regular),
    color: UIColor(red: 0.612, green: 0.612, blue: 0.612, alpha: 1)
  )
  
  private lazy var tagBtn: UIButton = {
    let btn = UIButton()
    var config = UIButton.Configuration.plain()
    config.image = UIImage(named: "unBookmark")
    config.imagePlacement = .top
    config.imagePadding = 1
    
    config.contentInsets = NSDirectionalEdgeInsets(
      top: 2, leading: 2,bottom: 2, trailing: 2
    )
    config.attributedTitle = AttributedString(
      "2,122",
      attributes: AttributeContainer([
        .foregroundColor: UIColor.black,
        .font: UIFont.systemFont(ofSize: 12, weight: .regular)
      ])
    )
    
    btn.configuration = config
    return btn
  }()
  
  public lazy var leftPurchaseBtn: PurchaseButton = makeBottomBtn(
    sub: "즉시 구매가",
    type: .purchase
  )
  public lazy var rightSalesBtn: PurchaseButton = makeBottomBtn(
    sub: "즉시 판매가",
    type: .sales
  )
  private lazy var dividedLine: DividedLineView = DividedLineView()
  
  private lazy var priceStack: UIStackView = makeStack(spacing: 4, axis: .vertical)
  private lazy var productStack: UIStackView = makeStack(spacing: 6, axis: .vertical)
  private lazy var bottomButtonStack: UIStackView = makeStack(spacing: 6, axis: .horizontal)
}

private extension ItemDetailView {
  func makeBottomBtn(
    price: String = "228,000",
    sub: String,
    type: PurchaseButtonType
  ) -> PurchaseButton {
    let btn = PurchaseButton(frame: .zero, btnType: type)
    btn.priceLabel.text = price
    btn.subLabel.text = sub
    btn.isUserInteractionEnabled = true
    return btn
  }
  
  func makeLabel(
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
  
  func makeStack(
    spacing: CGFloat,
    axis: NSLayoutConstraint.Axis
  ) -> UIStackView {
    let stack = UIStackView()
    stack.spacing = spacing
    stack.axis = axis
    stack.distribution = .equalSpacing
    stack.alignment = .leading
    return stack
  }
}

private extension ItemDetailView {
  func setupView() {
    setupStackView()
    addComponents()
    setupContstraints()
  }
  
  func setupStackView() {
    [priceTitleLabel, priceLabel].forEach { self.priceStack.addArrangedSubview($0) }
    [itemName, itemDescription].forEach{ self.productStack.addArrangedSubview($0) }
    [leftPurchaseBtn, rightSalesBtn].forEach{
      self.bottomButtonStack.addArrangedSubview($0)
    }
  }
  
  func addComponents() {
    [itemImageView, itemCollectionView].forEach{ self.addSubview($0) }
    [priceStack, productStack, dividedLine].forEach{ self.addSubview($0) }
    [tagBtn, bottomButtonStack].forEach{ self.dividedLine.addSubview($0) }
  }
  
  func setupContstraints() {
    itemImageView.snp.makeConstraints {
      $0.top.equalTo(self.safeAreaLayoutGuide.snp.top).offset(5)
      $0.left.right.equalToSuperview()
      $0.height.equalTo(373)
    }
    
    itemCollectionView.snp.makeConstraints {
      $0.top.equalTo(itemImageView.snp.bottom).offset(20)
      $0.left.right.equalToSuperview()
      $0.height.equalTo(60)
    }
    
    priceStack.snp.makeConstraints {
      $0.top.equalTo(itemCollectionView.snp.bottom).offset(23)
      $0.left.equalToSuperview().offset(16)
      $0.width.greaterThanOrEqualTo(50)
      $0.height.equalTo(42)
    }
    
    productStack.snp.makeConstraints {
      $0.top.equalTo(priceStack.snp.bottom).offset(18)
      $0.left.equalToSuperview().offset(16)
      $0.width.greaterThanOrEqualTo(80)
      $0.height.equalTo(40)
    }
    
    dividedLine.snp.makeConstraints {
      $0.bottom.left.right.equalToSuperview()
      $0.height.equalTo(95)
    }
    
    tagBtn.snp.makeConstraints {
      $0.left.equalToSuperview().offset(19)
      $0.top.equalToSuperview().offset(12)
      $0.height.greaterThanOrEqualTo(30)
      $0.width.greaterThanOrEqualTo(20)
    }
    
    bottomButtonStack.snp.makeConstraints {
      $0.top.equalToSuperview().offset(8)
      $0.left.equalTo(tagBtn.snp.right).offset(19)
      $0.width.equalTo(300)
      $0.height.equalTo(49)
    }
    
    leftPurchaseBtn.snp.makeConstraints {
      $0.width.equalTo(147)
      $0.height.equalTo(49)
    }
    
    rightSalesBtn.snp.makeConstraints {
      $0.width.equalTo(147)
      $0.height.equalTo(49)
    }
  }
}
