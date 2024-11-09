//
//  JustDroppedCollectionViewHandler.swift
//  KREAM
//
//  Created by jaewon Lee on 11/7/24.
//

import UIKit

class SnapshotCollectionViewHandler: NSObject, UICollectionViewDataSource {
  func collectionView(
    _ collectionView: UICollectionView,
    numberOfItemsInSection section: Int
  ) -> Int {
    return SnapshotCollectionModel.snapshotCollectionData().count
  }
  
  func collectionView(
    _ collectionView: UICollectionView,
    cellForItemAt indexPath: IndexPath
  ) -> UICollectionViewCell {
    // TODO: - justDroppedCollectionCell로 수정
    guard let cell = collectionView.dequeueReusableCell(
      withReuseIdentifier: SnapshotCollectionViewCell.identifier,
      for: indexPath
    ) as? SnapshotCollectionViewCell else { return UICollectionViewCell() }
    
    let list = SnapshotCollectionModel.snapshotCollectionData()
    
    cell.imageView.image = list[indexPath.row].image
    cell.hashTagLabel.text = list[indexPath.row].hashTag
    
    return cell
  }
}
