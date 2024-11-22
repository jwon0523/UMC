//
//  ProductDetailViewController.swift
//  KREAM
//
//  Created by jaewon Lee on 11/11/24.
//

import UIKit
import Then

class ItemDetailViewController:
  UIViewController,
  UIGestureRecognizerDelegate
  {
  let data = ItemDetailData.purchaseData
  var recievedData: JustDroppedCollectionModel? = nil
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.setupNavigationBar()
    self.setDefaultSelection()
    self.addTapGesture()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    self.updateViewWithData()
  }
  
  override func loadView() {
    self.view = itemDetailView
  }
  
  private lazy var itemDetailView = ItemDetailView().then {
    $0.itemCollectionView.delegate = self
    $0.itemCollectionView.dataSource = self
  }
  
  private func updateViewWithData() {
    if let recievedData = recievedData {
      itemDetailView.itemImageView.image = recievedData.image
      itemDetailView.priceTitleLabel.text = recievedData.priceStatus
      itemDetailView.price = recievedData.price
      itemDetailView.itemName.text = recievedData.title
      itemDetailView.itemDescription.text = recievedData.subTitle
    }
  }
  
  private func setupNavigationBar() {
    let item = UIBarButtonItem(
      image: UIImage(systemName: "arrow.left")?.withRenderingMode(.alwaysOriginal).withTintColor(.black),
      style: .plain,
      target: self,
      action: #selector(handleBackButton)
    )
    self.navigationItem.leftBarButtonItem = item
    navigationController?.interactivePopGestureRecognizer?.delegate = self
    navigationController?.interactivePopGestureRecognizer?.isEnabled = true
  }
  
  private func addTapGesture() {
    let tapGesture = UITapGestureRecognizer(
      target: self,
      action: #selector(buttonTapped)
    )
    itemDetailView.leftPurchaseBtn.addGestureRecognizer(tapGesture)
  }
  
  private func updateSelectedImage(for indexPath: IndexPath) {
    itemDetailView.itemImageView.image = UIImage(named: data[indexPath.item].imageView)
    itemDetailView.itemDescription.text = data[indexPath.item].productName
  }
  
  private func setDefaultSelection() {
    let firstIndexPath = IndexPath(item: 0, section: 0)
    updateSelectedImage(for: firstIndexPath)
  }
  
  @objc private func handleBackButton() {
    self.navigationController?.popViewController(animated: true)
  }
  
  @objc private func buttonTapped() {
    print("버튼 탭")
  }
  
}

extension ItemDetailViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
  func collectionView(
    _ collectionView: UICollectionView,
    numberOfItemsInSection section: Int
  ) -> Int {
    return data.count
  }
  
  func collectionView(
    _ collectionView: UICollectionView,
    cellForItemAt indexPath: IndexPath
  ) -> UICollectionViewCell {
    guard let cell = collectionView.dequeueReusableCell(
      withReuseIdentifier: ItemDetailCollectionViewCell.identifier,
      for: indexPath
    ) as? ItemDetailCollectionViewCell else { return UICollectionViewCell() }
    
    cell.configure(model: data[indexPath.row])
    
    return cell
  }
  
  func collectionView(
    _ collectionView: UICollectionView,
    layout collectionViewLayout: UICollectionViewLayout,
    insetForSectionAt section: Int
  ) -> UIEdgeInsets {
    return UIEdgeInsets(top: 15, left: 10, bottom: 15, right: 10)
  }
  
  func collectionView(
    _ collectionView: UICollectionView,
    didSelectItemAt indexPath: IndexPath
  ) {
    updateSelectedImage(for: indexPath)
  }
}
