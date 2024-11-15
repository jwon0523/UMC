//
//  DividedLineView.swift
//  KREAM
//
//  Created by jaewon Lee on 11/15/24.
//

import UIKit

class DividedLineView: UIView {
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    self.backgroundColor = .white
    self.addSubview(topLine)
    self.setupConstraints()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private lazy var topLine: UIView = {
    let view = UIView()
    view.backgroundColor = .systemGray5
    return view
  }()
  
  private func setupConstraints() {
    topLine.snp.makeConstraints {
      $0.top.left.equalToSuperview()
      $0.width.equalToSuperview()
      $0.height.equalTo(1)
    }
  }
  
}
