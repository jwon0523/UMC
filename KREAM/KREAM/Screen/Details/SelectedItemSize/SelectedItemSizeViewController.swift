//
//  SelectedItemSizeViewController.swift
//  KREAM
//
//  Created by jaewon Lee on 11/22/24.
//

import UIKit

struct ReceiveSelectedItemSizeData {
  let image: UIImage
  let productName: String
  let prodcutDescription: String
}

class SelectedItemSizeViewController: UIViewController {
  
  let data = SizeData.sizeData
  var receiveData: ReceiveSelectedItemSizeData?
  
  // MARK: - Init
  override func viewDidLoad() {
    super.viewDidLoad()
    setNavigation()
    changeValue()
  }
  
  /// viewDidLoad()와 분리하여, 네비게이션을 부르는게 아닌 네비게이션 영역을 제외한 뷰를 부른다. 커스텀한 뷰를 부르드록 overrride 적용
  override func loadView() {
    self.view = purchaseSelectSizeView
  }
  
  // MARK: - Property
  
  /// MARK: - 커스텀한 사이즈 선택 뷰
  private lazy var purchaseSelectSizeView: SelectedItemSizeView = {
    let view = SelectedItemSizeView()
    view.collectionView.delegate = self
    view.collectionView.dataSource = self
    return view
  }()
  
  /// 구매 뷰에서 원하는 점퍼의 색상을 선택 후, 구매버튼을 클릭하여 사이즈 선택 뷰 컨트롤러로 넘어오면서 전달받은 값이 적용되어 보이도록 처리
  private func changeValue() {
    if let data = receiveData {
      purchaseSelectSizeView.changeValue(data: data)
    }
  }
  
  // MARK: - Function
  
  /// 커스텀 네비게이션 타이틀 뷰 및 우측 닫기 버튼 생서
  private func setNavigation() {
    self.navigationItem.titleView = CustomNavigationTitleView(
      frame: .zero,
      titleText: "구매하기",
      subTitleText: "(가격 단위:원)"
    )
    
    let closeButton = UIBarButtonItem(image: UIImage(systemName: "xmark"),
                                      style: .plain,
                                      target: self,
                                      action: #selector(closeButtonTapped))
    closeButton.tintColor = UIColor.black
    self.navigationItem.rightBarButtonItem = closeButton
  }
  
  /// 우측 네비게이션 아이템 클릭 시 닫기 액션
  @objc private func closeButtonTapped() {
    dismiss(animated: true, completion: nil)
  }
}

// MARK: - Extension
extension SelectedItemSizeViewController:
  UICollectionViewDelegateFlowLayout,
  UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    data.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SizeCell.identifier, for: indexPath) as? SizeCell else { return UICollectionViewCell() }
    
    cell.configure(model: data[indexPath.row])
    
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: 110, height: 47)
  }
  
  /// 셀 내부 여백 처리
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
    return UIEdgeInsets(top: 5, left: 0, bottom: 5, right: 0)
  }
  
  /// 셀 아이템 선택 시 처리
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    if let cell = collectionView.cellForItem(at: indexPath) as? SizeCell {
      cell.changeOption(isSelected: true)
    }
  }
  /// 셀 아이템 선택 해제 시 처리
  func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
    if let cell = collectionView.cellForItem(at: indexPath) as? SizeCell {
      cell.changeOption(isSelected: false)
    }
  }
  
}
