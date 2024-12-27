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
  
  let homeStackView = UIStackView().then {
    $0.axis = .vertical
    $0.spacing = 10
  }
  
  let scrollView = UIScrollView().then {
    $0.showsHorizontalScrollIndicator = false
  }
  
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
  
  let explorationCollectionView = UICollectionView(
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
    $0.isScrollEnabled = false // 스크롤 비활성화
  }
  
  lazy var emptyLabel = UILabel().then {
    $0.text = "No data"
    $0.textColor = .lightGray
    $0.font = .systemFont(ofSize: 16, weight: .light)
    $0.isHidden = true
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
  
  lazy var justDroppedCollectionView = UICollectionView(
    frame: .zero,
    collectionViewLayout: UICollectionViewFlowLayout().then {
      // 컬렉션 뷰의 크기 지정(동적 계산)
      $0.itemSize = .init(width: 142, height: 237)
      // 가로 간격
      $0.minimumInteritemSpacing = 8
      $0.scrollDirection = .horizontal
    }
  ).then {
    $0.backgroundColor = .clear
    $0.register(
      JustDroppedCollectionViewCell.self,
      forCellWithReuseIdentifier: JustDroppedCollectionViewCell.identifier
    )
    $0.showsHorizontalScrollIndicator = false
  }
  
  lazy var snapshotCollectionView = UICollectionView(
    frame: .zero,
    collectionViewLayout: UICollectionViewFlowLayout().then {
      // 컬렉션 뷰의 크기 지정
      $0.itemSize = .init(width: 124, height: 165)
      // 가로 간격
      $0.minimumInteritemSpacing = 8
      $0.scrollDirection = .horizontal
    }
  ).then {
    $0.backgroundColor = .clear
    $0.register(
      SnapshotCollectionViewCell.self,
      forCellWithReuseIdentifier: SnapshotCollectionViewCell.identifier
    )
    $0.isPagingEnabled = true // 스크롤 부드럽게
    $0.showsHorizontalScrollIndicator = false
  }
}

private extension HomeView {
  func setupViews() {
    [
      headerSectionView,
      categorySegmentedControl,
      scrollView,
      emptyLabel
    ].forEach {
      self.addSubview($0)
    }
    
    headerSectionView.snp.makeConstraints {
      $0.top.equalTo(safeAreaLayoutGuide).offset(6)
      $0.horizontalEdges.equalToSuperview().inset(16)
      $0.height.equalTo(40)
    }
    
    headerSectionView.addArrangedSubview(searchBar)
    headerSectionView.addArrangedSubview(alertBellView)
    
    alertBellView.snp.makeConstraints {
      $0.height.width.equalTo(24)
      $0.verticalEdges.equalToSuperview().inset(8)
    }
    
    categorySegmentedControl.snp.makeConstraints {
      $0.top.equalTo(headerSectionView.snp.bottom).offset(16)
      $0.horizontalEdges.equalToSuperview().inset(24)
      $0.height.equalTo(27)
    }
    
    scrollView.snp.makeConstraints {
      $0.top.equalTo(categorySegmentedControl.snp.bottom)
      $0.horizontalEdges.bottom.equalToSuperview()
    }
    
    scrollView.addSubview(homeStackView)
    homeStackView.snp.makeConstraints {
      // edges: 가장자리(top, leading, trailing, bottom)을 한번에 설정
      // scrollView의 모든 가장자리에 위치 지정
      $0.edges.equalTo(scrollView.contentLayoutGuide) // 스크롤 컨텐츠 영역에 맞게 설정
      $0.width.equalTo(scrollView.frameLayoutGuide) // 스크롤 뷰의 프레임과 동일한 너비
    }
    
    emptyLabel.snp.makeConstraints {
      $0.center.equalToSuperview()
    }
    
    setupStackView()
  }
  
  func setupStackView() {
    [
      featuredBanner,
      explorationCollectionView
    ].forEach {
      homeStackView.addArrangedSubview($0)
    }
    
    featuredBanner.snp.makeConstraints {
      $0.horizontalEdges.equalToSuperview()
      $0.height.equalTo(336)
    }
    
    explorationCollectionView.snp.makeConstraints {
      $0.horizontalEdges.equalToSuperview().inset(16)
      // 컨텐츠의 크기와 컬렉션 뷰의 크기를 맞춤으로써 스크롤 기능x
      // 컬렉션 뷰는 UIScrollView를 상속 받기 때문에 지정된 크기보다 초과될 경우 스크롤 됨.
      $0.height.equalTo(182)
    }
    
    justDroppedSection()
    snapshotSection()
  }
  
  func justDroppedSection() {
    let justDroppedSectionTitle = titleLabel("Just Dropped")
    let justDroppedSectionSubTitle = subTitleLabel("발매 상품")
    
    [
      justDroppedSectionTitle,
      justDroppedSectionSubTitle,
      justDroppedCollectionView
    ].forEach {
      homeStackView.addArrangedSubview($0)
    }
    
    justDroppedSectionTitle.snp.makeConstraints {
      $0.horizontalEdges.equalToSuperview().inset(16)
    }
    
    justDroppedSectionSubTitle.snp.makeConstraints {
      $0.horizontalEdges.equalToSuperview().inset(16)
    }
    
    justDroppedCollectionView.snp.makeConstraints {
      $0.horizontalEdges.equalToSuperview()
      $0.height.equalTo(237)
    }
  }
  
  func snapshotSection() {
    let snapshotSectionTitle = titleLabel("본격 한파대비! 연말 필수템 모음")
    let snapshotSectionSubTitle = subTitleLabel("#해피홀리룩챌린지")
    
    [
      snapshotSectionTitle,
      snapshotSectionSubTitle,
      snapshotCollectionView
    ].forEach {
      homeStackView.addArrangedSubview($0)
    }
    
    snapshotSectionTitle.snp.makeConstraints {
      $0.horizontalEdges.equalToSuperview().inset(16)
    }
    
    snapshotSectionSubTitle.snp.makeConstraints {
      $0.horizontalEdges.equalToSuperview().inset(16)
    }
    
    snapshotCollectionView.snp.makeConstraints {
      $0.horizontalEdges.equalToSuperview()
      $0.height.equalTo(165)
    }
  }
}
