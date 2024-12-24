//
//  SearchResultView.swift
//  KREAM
//
//  Created by jaewon Lee on 12/24/24.
//

import UIKit

class SearchResultView: UIView {
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    self.backgroundColor = .white
    
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private lazy var stackView: UIStackView = {
    let stackView = UIStackView()
    stackView.axis = .vertical
    stackView.spacing = 10
    stackView.alignment = .fill
    return stackView
  }()
  
  private lazy var scrollView: UIScrollView = {
    let scrollView = UIScrollView()
    scrollView.showsVerticalScrollIndicator = true
    scrollView.showsHorizontalScrollIndicator = false
    scrollView.bounces = true
    return scrollView
  }()
  
  func updateResult(_ results: [String]) {
    stackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
    
    for result in results {
      let label = createResultLabel(result)
      stackView.addArrangedSubview(label)
    }
  }
  
  private func createResultLabel(_ text: String) -> UILabel {
    let label = UILabel()
    label.text = text
    label.textColor = .black
    label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
    label.numberOfLines = 0
    return label
  }
  
  private func constraints() {
    scrollView.snp.makeConstraints {
      $0.top.bottom.equalTo(self.safeAreaLayoutGuide)
      $0.left.right.equalTo(self.safeAreaLayoutGuide).inset(20)
    }
    
    stackView.snp.makeConstraints {
      $0.top.bottom.equalToSuperview() // 스크롤뷰의 위, 아래에 맞게 확장
      $0.leading.trailing.equalToSuperview() // 좌우 여백 없음
      $0.width.equalToSuperview() // 스크롤뷰의 폭에 맞춤
    }
  }
}
