//
//  APITestView.swift
//  Weak7
//
//  Created by jaewon Lee on 11/23/24.
//

import UIKit
import SnapKit

class APITestView: UIView {
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    self.backgroundColor = .white
    addStack()
    addComponents()
    constraints()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private lazy var placeholderContainer: [NSAttributedString.Key: Any] = {
    var value = [NSAttributedString.Key: Any]()
    value[.foregroundColor] = UIColor.gray
    value[.font] = UIFont.systemFont(ofSize: 12)
    return value
  }()
  
  public lazy var searchTextField: UITextField = {
    let textfield = UITextField()
    textfield.attributedPlaceholder = NSAttributedString(
      string: "검색하고 싶은 것을 넣으세요!",
      attributes: placeholderContainer
    )
    textfield.leftViewMode = .always
    textfield.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 14, height: 1))
    textfield.textColor = UIColor.black
    
    textfield.clipsToBounds = true
    textfield.layer.cornerRadius = 10
    textfield.layer.borderWidth = 2
    textfield.layer.borderColor = UIColor.black.cgColor
    return textfield
  }()
  
  public lazy var searchButton: UIButton = {
    let btn = UIButton()
    btn.setTitle("검색", for: .normal)
    btn.titleLabel?.font = UIFont.systemFont(ofSize: 12, weight: .regular)
    btn.backgroundColor = UIColor.lightGray
    btn.clipsToBounds = true
    btn.layer.cornerRadius = 8
    return btn
  }()
  
  private lazy var title: UILabel = makeTitleLabel(
    "타이틀",
    font: UIFont.systemFont(ofSize: 20, weight: .bold)
  )
  private lazy var contentsTitle: UILabel = makeTitleLabel(
    "컨텐츠",
    font: UIFont.systemFont(ofSize: 20, weight: .bold)
  )
  
  public lazy var responseTitle: UILabel = makeTitleLabel(
    "이 부분에 title 값이 들어오도록 해주세요!",
    font: UIFont.systemFont(ofSize: 20, weight: .light)
  )
  public lazy var responseContentsTitle: UILabel = makeTitleLabel(
    "이 부분에 Contents 값이 들어오도록 해주세요!", font: UIFont.systemFont(ofSize: 20, weight: .light)
  )
  
  /// 상단 텍스트 필드와 버튼 묶음 스택
  private lazy var inputTextStack: UIStackView = makeStack(axis: .horizontal, spacing: 21)
  
  /// Response title 스택
  private lazy var titleLabelStack: UIStackView = makeStack(axis: .vertical, spacing: 14)
  
  /// Response contents 스택
  private lazy var contentsLabelStack: UIStackView = makeStack(axis: .vertical, spacing: 14)
  
  private func makeTitleLabel(
    _ text: String,
    font: UIFont
  ) -> UILabel {
    let label = UILabel()
    label.textAlignment = .center
    label.textColor = UIColor.black
    label.numberOfLines = 0
    return label
  }
  
  private func makeStack(
    axis: NSLayoutConstraint.Axis,
    spacing: CGFloat
  ) -> UIStackView {
    let stack = UIStackView()
    stack.axis = axis
    stack.spacing = spacing
    stack.distribution = .fill
    return stack
  }
  
  private func addStack() {
    [searchTextField, searchButton].forEach{ inputTextStack.addArrangedSubview($0) }
    [title, responseTitle].forEach{ titleLabelStack.addArrangedSubview($0) }
    [contentsTitle, responseContentsTitle].forEach{ contentsLabelStack.addArrangedSubview($0) }
  }
  
  private func addComponents() {
    [inputTextStack, titleLabelStack, contentsLabelStack].forEach{ self.addSubview($0) }
  }
  
  private func constraints() {
    inputTextStack.snp.makeConstraints {
      $0.top.equalToSuperview().offset(94)
      $0.left.equalToSuperview().offset(26)
      $0.right.equalToSuperview().offset(-26)
      $0.height.equalTo(43)
    }
    
    searchTextField.snp.makeConstraints {
      $0.width.equalTo(262)
    }
    
    
    titleLabelStack.snp.makeConstraints {
      $0.top.equalTo(inputTextStack.snp.bottom).offset(91)
      $0.left.equalToSuperview().offset(18.5)
      $0.right.equalToSuperview().offset(-18.5)
      $0.height.lessThanOrEqualTo(110)
    }
    
    contentsLabelStack.snp.makeConstraints {
      $0.top.equalTo(titleLabelStack.snp.bottom).offset(91)
      $0.left.equalToSuperview().offset(18.5)
      $0.right.equalToSuperview().offset(-18.5)
      $0.height.greaterThanOrEqualTo(10)
    }
  }
}
