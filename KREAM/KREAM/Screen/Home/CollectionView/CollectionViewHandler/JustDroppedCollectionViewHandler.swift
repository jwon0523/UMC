//
//  JustDroppedCollectionViewHandler.swift
//  KREAM
//
//  Created by jaewon Lee on 11/7/24.
//

import UIKit

class JustDroppedCollectionViewHandler: NSObject, UICollectionViewDataSource, UICollectionViewDelegate {
  weak var parentViewController: UIViewController?
  
  func collectionView(
    _ collectionView: UICollectionView,
    numberOfItemsInSection section: Int
  ) -> Int {
    return JustDroppedCollectionModel.justDroppedCollectionData().count
  }
  
  func collectionView(
    _ collectionView: UICollectionView,
    cellForItemAt indexPath: IndexPath
  ) -> UICollectionViewCell {
    guard let cell = collectionView.dequeueReusableCell(
      withReuseIdentifier: JustDroppedCollectionViewCell.identifier,
      for: indexPath
    ) as? JustDroppedCollectionViewCell else { return UICollectionViewCell() }
    
    let list = JustDroppedCollectionModel.justDroppedCollectionData()
    
    cell.imageView.image = list[indexPath.row].image
    cell.titleLabel.text = list[indexPath.row].title
    cell.subTitleLabel.text = list[indexPath.row].subTitle
    cell.priceLabel.text = list[indexPath.row].price
    cell.priceStatusLabel.text = list[indexPath.row].priceStatus
    
    return cell
  }
  
  func collectionView(
    _ collectionView: UICollectionView,
    didSelectItemAt indexPath: IndexPath
  ) {
    let itemDetailVC = ItemDetailViewController()
    let list = JustDroppedCollectionModel.justDroppedCollectionData()
    let selectedItem = list[indexPath.row]
    itemDetailVC.image = selectedItem.image
    
    if let navigationController = parentViewController?.navigationController {
      navigationController.pushViewController(itemDetailVC, animated: true)
    } else {
      let navController = UINavigationController(rootViewController: itemDetailVC)
      parentViewController?.present(navController, animated: true)
    }
  }
}
