//
//  ExplorationCollectionViewHandler.swift
//  KREAM
//
//  Created by jaewon Lee on 11/7/24.
//

import UIKit

class ExplorationCollectionViewHandler: NSObject ,UICollectionViewDataSource {
  func collectionView(
    _ collectionView: UICollectionView,
    numberOfItemsInSection section: Int
  ) -> Int {
    return HomeModel.explorationCollectionData().count
  }
  
  func collectionView(
    _ collectionView: UICollectionView,
    cellForItemAt indexPath: IndexPath
  ) -> UICollectionViewCell {
    guard let cell = collectionView.dequeueReusableCell(
      withReuseIdentifier: HomeCollectionViewCell.identifier,
      for: indexPath
    ) as? HomeCollectionViewCell else { return UICollectionViewCell() }
    
    let list = HomeModel.explorationCollectionData()
    
    cell.imageView.image = list[indexPath.row].image
    cell.titleLabel.text = list[indexPath.row].title
    
    return cell
  }
}
