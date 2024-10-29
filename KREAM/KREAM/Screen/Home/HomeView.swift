//
//  HomeView.swift
//  KREAM
//
//  Created by jaewon Lee on 10/28/24.
//

import UIKit
import Then
import SnapKit

class HomeView: UIView {

  override init(frame: CGRect) {
    super.init(frame: frame)
    self.setupView()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  let searchBar = UISearchBar().then {
    $0.placeholder = "브랜드, 상품, 프로필, 태그 등"
    $0.searchBarStyle = .minimal
  }
  
  let categorySegmentedControl = UISegmentedControl(
    items: ["추천", "랭킹", "발매정보", "럭셔리", "남성", "여성"]
  ).then {
    let image = UIImage()
    $0.setBackgroundImage(image, for: .normal, barMetrics: .default)
    $0.setBackgroundImage(image, for: .selected, barMetrics: .default)
    $0.setBackgroundImage(image, for: .highlighted, barMetrics: .default)
    $0.setDividerImage(
      image,
      forLeftSegmentState: .selected,
      rightSegmentState: .normal,
      barMetrics: .default
    )
    $0.selectedSegmentIndex = 0
    // 글자 크기에 맞춰서 간격 조절
    $0.apportionsSegmentWidthsByContent = true
    
    $0.setTitleTextAttributes(
      [
        NSAttributedString.Key.foregroundColor: UIColor.black,
//        .backgroundColor: UIColor.clear,
        .font: UIFont.systemFont(ofSize: 16, weight: .light),
        .paragraphStyle: {
          let paragraphStyle = NSMutableParagraphStyle()
          paragraphStyle.alignment = .center
          return paragraphStyle
        }()
      ],
      for: .normal
    )
    $0.setTitleTextAttributes(
      [
        NSAttributedString.Key.foregroundColor: UIColor.black,
//        .backgroundColor: UIColor.clear,
        .font: UIFont.systemFont(ofSize: 16, weight: .bold),
        .paragraphStyle: {
          let paragraphStyle = NSMutableParagraphStyle()
          paragraphStyle.alignment = .center
          return paragraphStyle
        }()
      ],
      for: .selected
    )
  }
  
  let featuredBanner = UIImageView().then {
    $0.image = UIImage(named: "Banner")
    $0.contentMode = .scaleToFill
  }
  
  let subCategoryCollectionView = UICollectionView(
    frame: .zero,
    collectionViewLayout: UICollectionViewFlowLayout().then {
      $0.estimatedItemSize = .init(width: 61, height: 81)
      $0.minimumLineSpacing = 9
    }
  ).then {
    $0.backgroundColor = .clear
    $0.register(
      HomeCollectionViewCell.self,
      forCellWithReuseIdentifier: HomeCollectionViewCell.identifier
    )
  }
}

private extension HomeView {
  func setupView() {
    [
     searchBar,
     categorySegmentedControl,
     featuredBanner,
     subCategoryCollectionView
    ].forEach { addSubview($0) }
    
    searchBarSection()
    categorySegment()
    featuredBannerSection()
    subCategorySection()
  }
  
  func searchBarSection() {
    searchBar.snp.makeConstraints {
      $0.top.equalTo(safeAreaLayoutGuide).offset(6)
      $0.leading.equalToSuperview().offset(16)
      $0.trailing.equalToSuperview().offset(-15)
      $0.height.equalTo(40)
      $0.width.equalTo(303)
    }
  }
  
  func categorySegment() {
    categorySegmentedControl.snp.makeConstraints {
      $0.top.equalTo(searchBar.snp.bottom).offset(16)
      $0.centerX.equalToSuperview()
      $0.leading.equalToSuperview().offset(24)
      $0.trailing.equalToSuperview().offset(-25)
      $0.height.equalTo(27)
    }
  }
  
  func featuredBannerSection() {
    featuredBanner.snp.makeConstraints {
      $0.top.equalTo(categorySegmentedControl.snp.bottom)
      $0.horizontalEdges.equalToSuperview()
      $0.height.equalTo(336)
    }
  }
  
  func subCategorySection() {
    subCategoryCollectionView.snp.makeConstraints {
      $0.top.equalTo(featuredBanner.snp.bottom).offset(20)
      $0.horizontalEdges.equalToSuperview().inset(16)
      $0.centerX.equalToSuperview()
      $0.height.equalTo(182)
    }
  }
  
}
