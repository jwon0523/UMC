//
//  JustDroppedCollectionViewCell.swift
//  KREAM
//
//  Created by jaewon Lee on 11/6/24.
//

import UIKit
import Then
import SnapKit

class JustDroppedCollectionViewCell: UICollectionViewCell {
  static let identifier: String = "JustDroppedCollectionViewCell"
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    self.setupViews()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private lazy var stackView = UIStackView().then {
    $0.axis = .vertical
    $0.spacing = 3
    $0.alignment = .leading
    $0.backgroundColor = .brown
  }
  
  lazy var imageView = UIImageView().then {
    $0.image = UIImage(named: "justDropped1 1")
    $0.contentMode = .scaleAspectFill
    $0.layer.cornerRadius = 12
    $0.clipsToBounds = true
    $0.backgroundColor = .black
  }
  
  lazy var titleLabel: (String, Double) -> UILabel = { title, size in
      return UILabel().then {
        $0.font = .systemFont(ofSize: size, weight: .bold)
        $0.text = title
      }
  }
  
  lazy var subTitleLabel: (String, Double) -> UILabel = { subTitle, size in
    return UILabel().then {
      $0.font = .systemFont(ofSize: size, weight: .medium)
      $0.textColor = .lightGray
      $0.text = subTitle
    }
  }
}

private extension JustDroppedCollectionViewCell {
  func setupViews() {
    self.addSubview(stackView)
  }
  
  func setupStackView() {
    let collectionTitle = titleLabel("MLB", 12)
    let collectionSubTitle = subTitleLabel("청키라이너 뉴욕양키스", 12)
    
    let collectionPrice = titleLabel("139,000원", 13)
    let collectionPriceStatus = subTitleLabel("즉시 구매가", 10)
    
    [
     imageView,
     collectionTitle,
     collectionSubTitle,
     collectionPrice,
     collectionPriceStatus
    ].forEach {
      stackView.addArrangedSubview($0)
    }
    
    stackView.snp.makeConstraints {
      $0.top.horizontalEdges.equalToSuperview()
      $0.width.equalTo(142)
      $0.height.equalTo(237)
    }
    
    imageView.snp.makeConstraints {
      $0.top.horizontalEdges.equalToSuperview()
      $0.height.width.equalTo(142)
    }
  }
}
