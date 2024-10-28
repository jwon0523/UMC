//
//  TeenipingCollectionViewCell.swift
//  Weak4
//
//  Created by jaewon Lee on 10/28/24.
//

import UIKit

class TeenipingCollectionViewCell: UICollectionViewCell {
  static let identifier = "TeenipingCollectionViewCell"
  
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
    $0.font = .systemFont(ofSize: 10, weight: .semibold)
    $0.textColor = .black
    $0.text = "티니핑"
  }
  
  private func setupView() {
    [imageView, titleLabel].forEach { addSubview($0) }
    
    imageView.snp.makeConstraints {
      $0.top.horizontalEdges.equalToSuperview()
      $0.height.equalTo(120)
    }
    
    titleLabel.snp.makeConstraints {
      $0.bottom.equalToSuperview()
      $0.leading.equalToSuperview().offset(4)
    }
  }
}
