//
//  HomeCollectionViewCell.swift
//  KREAM
//
//  Created by jaewon Lee on 10/29/24.
//

import UIKit
import Then
import SnapKit

class HomeCollectionViewCell: UICollectionViewCell {
  static let identifier: String = "HomeCollectionViewCell"
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    self.setupView()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  let imageView = UIImageView().then {
    $0.contentMode = .scaleAspectFill
    $0.layer.cornerRadius = 8
    $0.clipsToBounds = true
  }
  
  let titleLabel = UILabel().then {
    $0.font = .systemFont(ofSize: 11.5)
    $0.textColor = .black
    $0.text = "Title"
  }
  
  private func setupView() {
    [imageView, titleLabel].forEach { addSubview($0) }
    
    imageView.snp.makeConstraints {
      $0.top.leading.trailing.equalToSuperview()
      $0.height.width.equalTo(61)
    }
    
    titleLabel.snp.makeConstraints {
      $0.bottom.equalToSuperview()
      $0.leading.equalToSuperview().offset(4)
    }
  }
}
