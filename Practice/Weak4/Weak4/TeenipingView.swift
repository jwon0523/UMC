//
//  TeenipingView.swift
//  Weak4
//
//  Created by jaewon Lee on 10/28/24.
//

import UIKit
import Then
import SnapKit

class TeenipingView: UIView {
  let segmentedControl = UISegmentedControl(items: ["티니핑", "not 티니핑"]).then {
    $0.setBackgroundImage(UIImage(), for: .normal, barMetrics: .default)
    $0.setBackgroundImage(UIImage(), for: .selected, barMetrics: .default)
    $0.setBackgroundImage(UIImage(), for: .highlighted, barMetrics: .default)
    $0.setDividerImage(UIImage(), forLeftSegmentState: .selected, rightSegmentState: .normal, barMetrics: .default)
    $0.selectedSegmentIndex = 0
    
    $0.setTitleTextAttributes(
      [
        NSAttributedString.Key.foregroundColor: UIColor.black,
        .backgroundColor: UIColor.clear,
        .font: UIFont.systemFont(ofSize: 16, weight: .light)
      ],
      for: .normal
    )
    $0.setTitleTextAttributes(
      [
        NSAttributedString.Key.foregroundColor: UIColor.black,
        .backgroundColor: UIColor.clear,
        .font: UIFont.systemFont(ofSize: 16, weight: .bold)
      ],
      for: .selected
    )
  }
  
  let teenipingCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout().then {
//    $0.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
    $0.estimatedItemSize = .init(width: 162, height: 144) // 각 셀의 사이즈 지정
    $0.minimumInteritemSpacing = 12
  }).then {
    $0.backgroundColor = .clear
    $0.isScrollEnabled = false
    $0.register(
      TeenipingCollectionViewCell.self,
      forCellWithReuseIdentifier: TeenipingCollectionViewCell.identifier
    )
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    backgroundColor = .white
    self.setupView()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private let divideLine = UIView().then {
    $0.backgroundColor = .black
  }
  
  private let emptyLabel = UILabel().then {
    $0.font = .systemFont(ofSize: 24, weight: .medium)
    $0.textColor = .black
    $0.text = "횅~"
  }
  
  private func setupView() {
    [
      segmentedControl,
      teenipingCollectionView,
      divideLine,
      emptyLabel
    ].forEach {
      addSubview($0)
    }
    
    // offset은 기준이 되는 뷰에서 멀어지는 방향으로 간격을 조정함. 즉, 뷰의 특정 부분에서 거리를 설정하는 방식으로 단일 방향 제약(ex. top, leading)에서 사용
    // inset은 제약을 거는 객체 자체를 기준으로 밀어내는 방식. 이러한 특성 때문에 양쪽 가장자리에서 동시에 간격 설정 가능(ex. horizontalEdges, verticalEdges)
    segmentedControl.snp.makeConstraints {
      $0.top.equalTo(safeAreaLayoutGuide).offset(20)
//      $0.horizontalEdges.equalToSuperview().inset(92)
      $0.centerX.equalToSuperview()
      $0.height.equalTo(65)
    }
    
    divideLine.snp.makeConstraints {
      $0.top.equalTo(segmentedControl.snp.bottom).offset(20)
      $0.horizontalEdges.equalToSuperview()
      $0.height.equalTo(1)
    }
    
    teenipingCollectionView.snp.makeConstraints {
      $0.top.equalTo(divideLine.snp.bottom).offset(20)
      $0.horizontalEdges.equalToSuperview().inset(19)
      $0.bottom.equalToSuperview().inset(74)
    }
    
    emptyLabel.snp.makeConstraints {
      $0.top.equalTo(divideLine.snp.bottom).offset(301)
      $0.centerX.equalToSuperview()
    }
  }

}
