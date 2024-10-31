//
//  HomeView.swift
//  KREAM
//
//  Created by jaewon Lee on 10/2/24.
//

import UIKit
import Then

class HomeViewController: UIViewController {
  private let homeView = HomeView()
  
  override func viewWillAppear(_ animated: Bool) {
      super.viewWillAppear(animated)
      self.navigationController?.setNavigationBarHidden(true, animated: animated)
  }

  override func viewWillDisappear(_ animated: Bool) {
      super.viewWillDisappear(animated)
      self.navigationController?.setNavigationBarHidden(false, animated: animated)
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.view.backgroundColor = .white
    self.view = homeView
    
    setupAction()
    setupDelegates()
  }
  
  private func setupDelegates() {
    homeView.subCategoryCollectionView.dataSource = self
    homeView.searchBar.delegate = self
  }
  
  private func setupAction() {
    homeView.categorySegmentedControl.addTarget(
      self,
      action: #selector(segmentedControlValueChanged(sender: )),
      for: .valueChanged
    )
  }
}

private extension HomeViewController {
  @objc func segmentedControlValueChanged(sender: UISegmentedControl) {
    switch sender.selectedSegmentIndex {
    case 0:
      homeView.featuredBanner.isHidden = false
      homeView.subCategoryCollectionView.isHidden = false
    default:
      homeView.featuredBanner.isHidden = true
      homeView.subCategoryCollectionView.isHidden = true
      homeView.emptyLabel.isHidden = false
      break
    }
  }
}

extension HomeViewController: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return HomeModel.dummy().count
  }
  
  func collectionView(
    _ collectionView: UICollectionView,
    cellForItemAt indexPath: IndexPath
  ) -> UICollectionViewCell {
    guard let cell = collectionView.dequeueReusableCell(
      withReuseIdentifier: HomeCollectionViewCell.identifier,
      for: indexPath
    ) as? HomeCollectionViewCell else { return UICollectionViewCell() }
    
    let list = HomeModel.dummy()
    
    cell.imageView.image = list[indexPath.row].image
    cell.titleLabel.text = list[indexPath.row].title
    
    return cell
  }
}

extension HomeViewController: UISearchBarDelegate {
  // 검색어가 변경되었을 때 호출되는 메서드
  func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
    print("Search text changed: \(searchText)")
  }
  
  // 검색 버튼이 클릭되었을 때 호출되는 메서드
  func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
    searchBar.resignFirstResponder() // 키보드 내림
    let vc = UIViewController().then {
      $0.view.backgroundColor = .green
    }
    navigationController?.pushViewController(vc, animated: true)
  }
}
