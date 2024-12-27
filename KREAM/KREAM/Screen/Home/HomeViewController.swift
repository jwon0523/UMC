//
//  HomeView.swift
//  KREAM
//
//  Created by jaewon Lee on 10/2/24.
//

import UIKit
import Then

class HomeViewController:
  UIViewController,
  ItemDataSendingDelegate,
  UISearchBarDelegate {
  private let explorationCollectionViewHandler = ExplorationCollectionViewHandler()
  private let justDroppedCollectionViewHandler = JustDroppedCollectionViewHandler()
  private let snapshotCollectionViewHandler = SnapshotCollectionViewHandler()
  private var itemDetailViewController: ItemDetailViewControllerProtocol?
  private let factory = DefaultViewControllerFactory { ItemDetailViewController() }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    self.navigationController?.setNavigationBarHidden(
      true,
      animated: animated
    )
  }
  
  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    self.navigationController?.setNavigationBarHidden(
      false,
      animated: animated
    )
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.view.backgroundColor = .white
    self.view = homeView
    self.setupAction()
    self.setupDelegates()
    self.homeView.searchBar.delegate = self
  }
  
  private lazy var homeView: HomeView = {
    let view = HomeView()
    view.backgroundColor = .white
    return view
  }()
  
  private func navigateToSearchViewController() {
    let searchViewController = SearchViewController()
    navigationController?.pushViewController(
      searchViewController,
      animated: true
    )
  }
  
  func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
    navigateToSearchViewController()
  }
  
  func sendItemData(_ data: Displayable) {
    let itemDetailVC = factory.createViewController()
    itemDetailVC.setData(data)
    itemDetailVC.hidesBottomBarWhenPushed = true
    self.navigationController?.pushViewController(itemDetailVC, animated: true)
  }
  
  private func setupDelegates() {
    homeView.explorationCollectionView.dataSource = explorationCollectionViewHandler
    homeView.justDroppedCollectionView.dataSource = justDroppedCollectionViewHandler
    homeView.snapshotCollectionView.dataSource = snapshotCollectionViewHandler
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
