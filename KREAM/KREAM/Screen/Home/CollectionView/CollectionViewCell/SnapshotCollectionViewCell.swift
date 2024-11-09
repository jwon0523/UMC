//
//  ShoppingCollectionViewCell.swift
//  KREAM
//
//  Created by jaewon Lee on 11/1/24.
//

import UIKit

class SnapshotCollectionViewCell: UICollectionViewCell {
  static let identifier: String = "SnapshotCollectionViewCell"
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    self.setupView()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  lazy var imageView = UIImageView().then {
    $0.contentMode = .scaleAspectFill
    $0.layer.cornerRadius = 12
    $0.clipsToBounds = true
  }
  
  lazy var hashTagLabel = UILabel().then {
    $0.textColor = .white
    $0.font = .systemFont(ofSize: 12, weight: .medium)
  }

}

private extension SnapshotCollectionViewCell {
  func setupView() {
    [imageView, hashTagLabel].forEach { self.addSubview($0) }
    
    imageView.snp.makeConstraints {
      $0.top.horizontalEdges.equalToSuperview()
      $0.height.equalTo(165)
      $0.width.equalTo(124)
    }
    
    hashTagLabel.snp.makeConstraints {
      $0.bottom.equalTo(imageView.snp.bottom).inset(11)
      $0.leading.equalTo(imageView.snp.leading).offset(10)
      $0.trailing.equalTo(imageView.snp.trailing).offset(-37)
      $0.width.equalTo(imageView.snp.width)
    }
  }
}
