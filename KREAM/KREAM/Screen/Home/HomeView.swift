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
    self.addComponents()
    self.constraints()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  public lazy var homeCollectionView: UICollectionView = {
    let layout = HomeCollectionLayout.createCompositionalLayout()
    let collectionView = UICollectionView(
      frame: self.bounds,
      collectionViewLayout: layout
    )
    
    collectionView.register(
      AdBannerCell.self,
      forCellWithReuseIdentifier: AdBannerCell.identifier
    )
    collectionView.register(
      AdBannerCell.self,
      forCellWithReuseIdentifier: AdBannerCell.identifier
    )
    collectionView.register(
      RecommendationCell.self,
      forCellWithReuseIdentifier: RecommendationCell.identifier
    )
    collectionView.register(
      ProductGridCell.self,
      forCellWithReuseIdentifier: ProductGridCell.identifier
    )
    collectionView.register(
      UserStoryCell.self,
      forCellWithReuseIdentifier: UserStoryCell.identifier
    )
    collectionView.register(
      SectionSeparatorFooter.self,
      forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter,
      withReuseIdentifier: SectionSeparatorFooter.identifier
    )
    /*
     어느 섹션에 대해서는 헤더를 들고 있고, 공통적인 컴포넌트를 가지고 있습니다. 그래서 하나의 헤더만 등록하고 원하는 섹션에서 헤더를 사용할 수 있도록 지정합니다.
     */
    collectionView.register(
      BaseCellHeader.self,
      forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
      withReuseIdentifier: BaseCellHeader.identifier
    )
    
    collectionView.backgroundColor = .white
    // TODO: refreshControl
    
    return collectionView
  }()
  
  /// 상단 헤더 뷰
//  public lazy var homeHeaderView: HomeHeaderView = HomeHeaderView()
  
  let headerSectionView = UIStackView().then {
    $0.axis = .horizontal
    $0.spacing = 15
  }
  
  public lazy var searchBar: UISearchBar = {
    let searchBar = UISearchBar()
    searchBar.placeholder = "브랜드, 상품, 프로필, 태그 등"
    searchBar.barTintColor = .white
    searchBar.backgroundColor = .clear
    searchBar.clipsToBounds = true
    searchBar.layer.cornerRadius = 12
    searchBar.backgroundImage = UIImage()
    
    return searchBar
  }()
  
  let alertBellView = UIImageView().then {
    $0.image = UIImage(named: "alertBell")
  }
  
  public lazy var segmentControl: HomeSegmentControl = {
    let items = ["추천", "랭킹", "발매정보", "럭셔리", "남성", "여성"]
    let segmentControl = HomeSegmentControl(items: items)
    segmentControl.selectedSegmentIndex = 0
    return segmentControl
  }()
  
  /// 컬렉션 뷰 상단에서 잡아당길 때 리프레시 버튼 생성
  private lazy var refreshControl: UIRefreshControl = {
    let refreshControl = UIRefreshControl()
    refreshControl.addTarget(self, action: #selector(pullRefresh), for: .valueChanged)
    return refreshControl
  }()
  
  // MARK: - Function
  
  /// 1.0초 동안 리프레시 버튼 재생
  @objc private func pullRefresh() {
    DispatchQueue.main.asyncAfter(deadline: .now() + 1.0, execute: {
      self.refreshControl.endRefreshing()
    })
  }
  
  // MARK: - Constaints & Add Function
  
  /// 컴포넌트 생성
  private func addComponents() {
    [
      headerSectionView,
      segmentControl,
      homeCollectionView
    ].forEach{ self.addSubview($0) }
  }
  
  /// 제약 조건 설정
  private func constraints() {
    
    headerSectionView.snp.makeConstraints {
      $0.top.equalTo(safeAreaLayoutGuide).offset(6)
      $0.horizontalEdges.equalToSuperview().inset(16)
      $0.height.equalTo(40)
    }
    
    headerSectionView.addArrangedSubview(searchBar)
    headerSectionView.addArrangedSubview(alertBellView)
    
    segmentControl.snp.makeConstraints {
      $0.top.equalTo(headerSectionView.snp.bottom).offset(16)
      $0.horizontalEdges.equalToSuperview().inset(24)
      $0.height.equalTo(27)
    }
    
    homeCollectionView.snp.makeConstraints {
      $0.top.equalTo(segmentControl.snp.bottom).offset(0)
      $0.left.right.bottom.equalToSuperview()
    }
  }
}
