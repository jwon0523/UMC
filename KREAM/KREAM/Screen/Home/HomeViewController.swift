//
//  HomeView.swift
//  KREAM
//
//  Created by jaewon Lee on 10/2/24.
//

import UIKit
import Then

class HomeViewController: UIViewController, ItemDataSendingDelegate {
  private let homeView = HomeView()
  private let explorationCollectionViewHandler = ExplorationCollectionViewHandler()
  private let justDroppedCollectionViewHandler = JustDroppedCollectionViewHandler()
  private let snapshotCollectionViewHandler = SnapshotCollectionViewHandler()
  private var itemDetailViewController: ItemDetailViewControllerProtocol?
  
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
  
  func sendItemData(_ data: Displayable) {
    let itemDetailVC = ItemDetailViewController()
    itemDetailVC.setData(data)
    itemDetailVC.hidesBottomBarWhenPushed = true
    self.navigationController?.pushViewController(itemDetailVC, animated: true)
  }
  
  private func setupDelegates() {
    homeView.explorationCollectionView.dataSource = explorationCollectionViewHandler
    homeView.justDroppedCollectionView.dataSource = justDroppedCollectionViewHandler
    homeView.snapshotCollectionView.dataSource = snapshotCollectionViewHandler
    
    homeView.searchBarView.delegate = self
    homeView.justDroppedCollectionView.delegate = justDroppedCollectionViewHandler
    justDroppedCollectionViewHandler.itemDataSendingDelegate = self
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
      homeView.scrollView.isHidden = false
      homeView.emptyLabel.isHidden = true
    default:
      homeView.scrollView.isHidden = true
      homeView.emptyLabel.isHidden = false
      break
    }
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
    searchBar.text = ""
    navigationController?.pushViewController(vc, animated: true)
  }
}
