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
    self.setupViews()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  let searchBar = UISearchBar().then {
    $0.placeholder = "브랜드, 상품, 프로필, 태그 등"
    $0.searchBarStyle = .minimal
  }
  
  let alertBellView = UIImageView().then {
    $0.image = UIImage(named: "alertBell")
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
  
  lazy var emptyLabel = UILabel().then {
    $0.text = "No data"
    $0.textColor = .lightGray
    $0.font = .systemFont(ofSize: 16, weight: .light)
    $0.isHidden = true
  }
  
  lazy var sectionStackView = UIStackView().then {
    $0.axis = .vertical
    $0.spacing = 14
  }
  
  lazy var titleLabel: (String) -> UILabel = { title in
      return UILabel().then {
        $0.font = .systemFont(ofSize: 16, weight: .bold)
        $0.text = title
      }
  }
  
  lazy var subTitleLabel: (String) -> UILabel = { subTitle in
    return UILabel().then {
      $0.font = .systemFont(ofSize: 13, weight: .medium)
      $0.textColor = .lightGray
      $0.text = subTitle
    }
  }
  
  lazy var shoppingCollectionView = UICollectionView(
    frame: .zero,
    collectionViewLayout: UICollectionViewFlowLayout()
  ).then {
    $0.backgroundColor = .clear
    $0.register(
      ShoppingCollectionViewCell.self,
      forCellWithReuseIdentifier: ShoppingCollectionViewCell.identifier
    )
    $0.backgroundColor = .green
  }
}

private extension HomeView {
  
  func setupViews() {
    [
     searchBar,
     alertBellView,
     categorySegmentedControl,
     featuredBanner,
     subCategoryCollectionView,
     emptyLabel,
     sectionStackView,
     shoppingCollectionView
    ].forEach {
      self.addSubview($0)
    }
    
    searchBarSection()
    categorySegment()
    subCategorySection()
    ShoppingSection()
  }
  
  func searchBarSection() {
    //오토레이아웃의 제약조건과 너비가 충돌하면 width 제약이 무시될 수 있음.
    searchBar.snp.makeConstraints {
      $0.top.equalTo(safeAreaLayoutGuide).offset(6)
      $0.leading.equalToSuperview().offset(16)
      $0.bottom.equalTo(categorySegmentedControl.snp.top).offset(-16)
      $0.height.equalTo(40)
      $0.width.equalTo(303)
    }
    
    alertBellView.snp.makeConstraints {
      $0.top.equalTo(safeAreaLayoutGuide).offset(14)
      $0.leading.equalTo(searchBar.snp.trailing).offset(15)
      $0.trailing.equalToSuperview().offset(-16)
      $0.width.height.equalTo(24)
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
  
  func subCategorySection() {
    emptyLabel.snp.makeConstraints {
      $0.centerX.centerY.equalToSuperview()
    }
    
    subCategoryCollectionView.snp.makeConstraints {
      $0.top.equalTo(featuredBanner.snp.bottom).offset(20)
      $0.horizontalEdges.equalToSuperview().inset(16)
      $0.centerX.equalToSuperview()
      $0.height.equalTo(182)
    }
    
    featuredBanner.snp.makeConstraints {
      $0.top.equalTo(categorySegmentedControl.snp.bottom)
      $0.horizontalEdges.equalToSuperview()
      $0.height.equalTo(336)
    }
  }
  
  func ShoppingSection() {
    let shoppingSectionTitle = titleLabel("Just Dropped")
    let shoppingSectionSubTitle = subTitleLabel("발매 상품")
    
    sectionStackView.addArrangedSubview(shoppingSectionTitle)
    sectionStackView.addArrangedSubview(shoppingSectionSubTitle)
    sectionStackView.addArrangedSubview(shoppingCollectionView)
    
    sectionStackView.snp.makeConstraints {
      $0.top.equalTo(subCategoryCollectionView.snp.bottom).offset(30)
      $0.leading.trailing.equalToSuperview()
      $0.bottom.equalToSuperview()
    }
    
    shoppingCollectionView.snp.makeConstraints {
      $0.top.equalTo(shoppingSectionSubTitle.snp.bottom).offset(14)
      $0.horizontalEdges.equalToSuperview().inset(16)
    }
  }
}
