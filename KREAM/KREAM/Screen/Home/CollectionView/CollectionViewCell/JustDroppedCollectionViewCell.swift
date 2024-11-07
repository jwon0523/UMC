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
  }
  
  lazy var imageView = UIImageView().then {
    $0.contentMode = .scaleAspectFill
    $0.layer.cornerRadius = 12
    $0.clipsToBounds = true
  }
  
  lazy var titleLabel: UILabel = {
      let label = UILabel()
      label.font = .systemFont(ofSize: 12, weight: .bold)
      label.textColor = .black
      return label
  }()

  lazy var subTitleLabel: UILabel = {
      let label = UILabel()
      label.font = .systemFont(ofSize: 12, weight: .medium)
      label.textColor = .lightGray
      return label
  }()

  lazy var priceLabel: UILabel = {
      let label = UILabel()
      label.font = .systemFont(ofSize: 13, weight: .bold)
      label.textColor = .black
      return label
  }()

  lazy var priceStatusLabel: UILabel = {
      let label = UILabel()
      label.font = .systemFont(ofSize: 10, weight: .medium)
      label.textColor = .lightGray
      return label
  }()
}

private extension JustDroppedCollectionViewCell {
  func setupViews() {
    self.addSubview(stackView)
    self.setupStackView()
  }
  
  func setupStackView() {
    [
     imageView,
     titleLabel,
     subTitleLabel,
     priceLabel,
     priceStatusLabel
    ].forEach {
      stackView.addArrangedSubview($0)
    }
    
    stackView.snp.makeConstraints {
      $0.top.horizontalEdges.equalToSuperview()
    }
    
    imageView.snp.makeConstraints {
      $0.height.width.equalTo(142)
    }
    
    // UIStackView에 뷰 간의 커스텀 간격 설성.
    stackView.setCustomSpacing(26, after: subTitleLabel)
  }
}
