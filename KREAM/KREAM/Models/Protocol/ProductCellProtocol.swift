//
//  ProductCellProtocol.swift
//  KREAM
//
//  Created by jaewon Lee on 12/27/24.
//

import UIKit

protocol ProductCellProtocol {
  var imageView: UIImageView { get }
  var titleText: UILabel { get }
  var priceLabel: UILabel { get }
  
  func configure(model: RequiredCellProtocol)
}
