//
//  ShoppingCollectionViewCell.swift
//  KREAM
//
//  Created by jaewon Lee on 11/1/24.
//

import UIKit

class SnapshotCollectionViewCell: UICollectionViewCell {
  static let identifier: String = "ShoppingCollectionViewCell"
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    self.setupViews()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  lazy var imageView = UIImageView().then {
    $0.image = UIImage(named: "Shoose")
    $0.contentMode = .scaleAspectFill
    $0.layer.cornerRadius = 12
    $0.clipsToBounds = true
  }
  
  lazy var labelStackView = UIStackView().then {
    let shoppingTitleLabel = titleLabel("MLB", 12)
    let shoppingSubTitleLabel = subTitleLabel("청키라이너 뉴욕양키스", 12)
    
    let priceTitle = titleLabel("139,000원", 13)
    let priceSubTitle = subTitleLabel("즉시 구매가", 10)
    
    $0.axis = .vertical
    $0.spacing = 3
    $0.alignment = .leading
    
    $0.addArrangedSubview(shoppingTitleLabel)
    $0.addArrangedSubview(shoppingSubTitleLabel)
    $0.addArrangedSubview(priceTitle)
    $0.addArrangedSubview(priceSubTitle)
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

private extension SnapshotCollectionViewCell {
  func setupViews() {
    [imageView, labelStackView].forEach { self.addSubview($0) }
    
    imageView.snp.makeConstraints {
      $0.top.equalToSuperview()
      $0.leading.trailing.equalToSuperview()
      $0.height.equalTo(237)
      $0.width.equalTo(142)
    }
    
    labelStackView.snp.makeConstraints {
      $0.top.equalTo(imageView.snp.bottom).offset(8)
      $0.leading.equalToSuperview().offset(4)
      $0.trailing.equalToSuperview().offset(-14)
    }
  }
}
