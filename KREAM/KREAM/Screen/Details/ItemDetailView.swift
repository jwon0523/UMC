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
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    self.backgroundColor = .white
    self.setupView()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  lazy var itemDetailStackView = UIStackView().then {
    $0.axis = .vertical
  }
  
  lazy var itemImgView = UIImageView().then {
    $0.image = UIImage(named: "Clothes")
    $0.contentMode = .scaleToFill
    $0.clipsToBounds = true
  }
  
  // TODO: - UICollectionView로 변경
  lazy var clothesColorCollectionView = UIView().then {
    $0.backgroundColor = .blue
  }
  
  lazy var itemInfoStackview = UIStackView().then {
    $0.axis = .vertical
    $0.spacing = 5
  }
  
  lazy var itemStatusLabel = UILabel().then {
    $0.font = .systemFont(ofSize: 12, weight: .light)
    $0.text = "즉시 구매가"
  }
  
  lazy var itemPriceLabel = UILabel().then {
    $0.text = "228,000원"
    $0.font = .systemFont(ofSize: 20, weight: .semibold)
  }
  
  lazy var itemNameLabel = UILabel().then {
    $0.font = .systemFont(ofSize: 16, weight: .medium)
    $0.text = "Matin Kim Logo Coating Jumper"
  }
  
  lazy var itemSecondNameLabel = UILabel().then {
    $0.font = .systemFont(ofSize: 12, weight: .light)
    $0.text = "마뗑킴 로고 코팅 점퍼 블랙"
  }
  
  // TODO: - 바텀 액션 바 만들기
}

private extension ItemDetailView {
  func setupView() {
    self.addSubview(itemDetailStackView)
    
    itemDetailStackView.snp.makeConstraints {
      $0.top.equalTo(safeAreaLayoutGuide)
      $0.horizontalEdges.equalToSuperview()
    }
    
    self.setupItemDetailStackView()
  }
  
  func setupItemDetailStackView() {
    [
      itemImgView,
      clothesColorCollectionView,
      itemInfoStackview
    ].forEach {
      itemDetailStackView.addArrangedSubview($0)
    }
    
    itemImgView.snp.makeConstraints {
      $0.horizontalEdges.equalToSuperview()
      $0.width.equalTo(374)
      $0.height.equalTo(373)
    }
    
    clothesColorCollectionView.snp.makeConstraints {
      $0.horizontalEdges.equalToSuperview()
      $0.width.equalTo(419)
      $0.height.equalTo(53)
    }
    
    itemDetailStackView.setCustomSpacing(20, after: itemImgView)
    
    itemInfoStackview.snp.makeConstraints {
      $0.horizontalEdges.equalToSuperview().inset(16)
    }
    
    itemDetailStackView.setCustomSpacing(23, after: clothesColorCollectionView)
    
    self.setupItemInfoStackView()
  }
  
  func setupItemInfoStackView() {
    [
      itemStatusLabel,
      itemPriceLabel,
      itemNameLabel,
      itemSecondNameLabel
    ].forEach {
      itemInfoStackview.addArrangedSubview($0)
    }
    
    itemStatusLabel.snp.makeConstraints {
      $0.leading.equalToSuperview()
    }
    
    itemPriceLabel.snp.makeConstraints {
      $0.leading.equalToSuperview()
    }
    
    itemInfoStackview.setCustomSpacing(18, after: itemPriceLabel)
    
    itemNameLabel.snp.makeConstraints {
      $0.leading.equalToSuperview()
    }
    
    itemSecondNameLabel.snp.makeConstraints {
      $0.leading.equalToSuperview()
    }
  }
}
