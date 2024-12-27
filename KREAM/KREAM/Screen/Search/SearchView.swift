//
//  SearchView.swift
//  KREAM
//
//  Created by jaewon Lee on 12/24/24.
//

import UIKit

class SearchView: UIView {
  
  var onSearchButtonClicked: ((String) -> Void)?
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    self.backgroundColor = .white
    self.changeCancelKorean()
    addComponents()
    constraints()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  public lazy var searchBar: UISearchBar = {
    let searchBar = UISearchBar()
    searchBar.placeholder = "브랜드, 상품, 프뢸, 태그 등"
    searchBar.showsCancelButton = true
    return searchBar
  }()
  
  private func changeCancelKorean() {
    if let cancelButton = searchBar.value(forKey: "cancelButton") as? UIButton {
        cancelButton.setTitle("취소", for: .normal)
    }
  }
  
  private lazy var recentSearchLabel: UILabel = {
    let label = UILabel()
    label.text = "추천 검색어"
    label.font = UIFont.systemFont(ofSize: 15, weight: .bold)
    label.textColor = .black
    return label
  }()
  
  private lazy var recentSearchStack: UIStackView = {
    let stackView = UIStackView()
    stackView.axis = .vertical
    stackView.spacing = 10
    stackView.alignment = .fill
    return stackView
  }()
  
  /// 스택뷰에 한 행에 대한 스택뷰를 넣어서 최근 검색어를 관리
  public func updateRecentSearchButton(_ searches: [String]) {
    recentSearchStack.arrangedSubviews.forEach { $0.removeFromSuperview() }
    
    let maxButtonsPerRow = 5
    var currentRowStack: UIStackView?
    
    for (index, keyword) in searches.enumerated() {
      if index % maxButtonsPerRow == 0 {
        currentRowStack = UIStackView()
        currentRowStack?.axis = .horizontal
        currentRowStack?.spacing = 3
        currentRowStack?.alignment = .center
        currentRowStack?.distribution = .fillEqually
        if let rowStack = currentRowStack {
          recentSearchStack.addArrangedSubview(rowStack)
        }
      }
      let button = UIButton()
      
      var configuration = UIButton.Configuration.plain()
      configuration.contentInsets = NSDirectionalEdgeInsets(
        top: 8,
        leading: 11,
        bottom: 8,
        trailing: 11
      )
      button.configuration = configuration
      
      button.setTitle(keyword, for: .normal)
      button.titleLabel?.font = .systemFont(ofSize: 14, weight: .medium)
      button.setTitleColor(UIColor.black, for: .normal)
      
      button.backgroundColor = .systemGray5
      
      button.addAction(
        UIAction { [weak self] _ in
          // 옵서널 클로저 호출
          self?.onSearchButtonClicked?(keyword)
        },
        for: .touchUpInside
      )
      
      button.layer.masksToBounds = true
      button.layer.cornerRadius = 20
      
      currentRowStack?.addArrangedSubview(button)
    }
  }
  
  private func addComponents() {
    [recentSearchLabel, recentSearchStack].forEach { self.addSubview($0)}
  }
  
  private func constraints() {
    recentSearchLabel.snp.makeConstraints {
      $0.top.equalTo(self.safeAreaLayoutGuide.snp.top).offset(30)
      $0.left.equalToSuperview().offset(16)
      $0.width.equalTo(69)
      $0.height.equalTo(18)
    }
    
    recentSearchStack.snp.makeConstraints {
      $0.top.equalTo(recentSearchLabel.snp.bottom).offset(15)
      $0.left.equalToSuperview().offset(16)
      $0.width.greaterThanOrEqualTo(100)
      $0.height.greaterThanOrEqualTo(20)
    }
  }
}
