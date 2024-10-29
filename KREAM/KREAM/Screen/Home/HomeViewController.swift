//
//  HomeView.swift
//  KREAM
//
//  Created by jaewon Lee on 10/2/24.
//

import UIKit
import Then

class HomeViewController: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.view.backgroundColor = .white
    self.view = homeView
    
    setupDelegates()
  }
  
  let homeView = HomeView()
  
  private func setupDelegates() {
    homeView.subCategorySection.dataSource = self
  }
  
}

extension HomeViewController: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 4
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = collectionView.dequeueReusableCell(
      withReuseIdentifier: HomeCollectionViewCell.identifier,
      for: indexPath) as? HomeCollectionViewCell else { return UICollectionViewCell() }
    
    return cell
  }
  
  
}
