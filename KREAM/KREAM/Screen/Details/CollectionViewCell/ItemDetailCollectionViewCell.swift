//
//  ItemDetailCollectionViewCell.swift
//  KREAM
//
//  Created by jaewon Lee on 11/15/24.
//

import UIKit

class ItemDetailCollectionViewCell: UICollectionViewCell {
  static let identifier: String = "ItemDetailCollectionViewCell"
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    self.setupConstraints()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func prepareForReuse() {
    self.imageView.image = nil
  }
  
  private lazy var imageView = UIImageView()
}

extension ItemDetailCollectionViewCell {
 private func setupConstraints() {
    self.addSubview(imageView)
    
    imageView.snp.makeConstraints {
      $0.edges.equalToSuperview()
    }
  }
  
  public func configure(model: any RequiredCellProtocol) {
    guard let itemDetailData = model as? ItemDetailModel else { return }
    self.imageView.image = UIImage(named: itemDetailData.imageView)
  }
}
