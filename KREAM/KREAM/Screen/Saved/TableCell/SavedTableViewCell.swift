//
//  SavedTableViewCell.swift
//  KREAM
//
//  Created by jaewon Lee on 10/11/24.
//

import UIKit
import SnapKit

class SavedTableViewCell: UITableViewCell {
  static let identifier: String = "SavedTableViewCell"
  
  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    
    // Configure the view for the selected state
  }
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    setStackConstraints()
    setConstraints()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private lazy var itemImageView: UIImageView = {
    let imageView = UIImageView()
    imageView.contentMode = .scaleAspectFit
    return imageView
  }()
  
  private lazy var titleLabel: UILabel = {
    let label = UILabel()
    label.font = .systemFont(ofSize: 12, weight: .medium)
    label.textColor = .black
    label.numberOfLines = 1
    return label
  }()
  
  private lazy var descriptionLabel: UILabel = {
    let label = UILabel()
    label.font = .systemFont(ofSize: 9, weight: .regular)
    label.textColor = .lightGray
    label.numberOfLines = 2
    return label
  }()
  
  private lazy var priceLabel: UILabel = {
    let label = UILabel()
    label.font = .systemFont(ofSize: 14, weight: .medium)
    label.textColor = .black
    return label
  }()
  
  private lazy var saveBtn: UIButton = {
    let button = UIButton()
    button.setImage(UIImage(named: "Save"), for: .normal)
    return button
  }()
  
  private lazy var titleStackView: UIStackView = {
    // arrangedSubviews: 스택 뷰가 실제로 정렬하는 하위 뷰만 포함
    // removeArrangedSubview()를 통해 제거해야 완전히 제거됨
//    let stackView = UIStackView(arrangedSubviews: [titleLabel, descriptionLabel])
    let stackView = UIStackView()
    stackView.axis = .vertical
    return stackView
  }()
  
  public func configure(with savedModel: SavedModel) {
    itemImageView.image = UIImage(named: savedModel.itemImage)
    titleLabel.text = savedModel.title
    descriptionLabel.text = savedModel.description
    priceLabel.text = savedModel.price
  }
  
  private func setConstraints() {
    [itemImageView, titleStackView, priceLabel, saveBtn].forEach {
      self.addSubview($0)
      $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    itemImageView.snp.makeConstraints {
      $0.top.leading.equalToSuperview().offset(13)
      $0.bottom.equalToSuperview().offset(-13)
      $0.width.height.equalTo(72)
    }
    
    titleStackView.snp.makeConstraints {
      $0.top.equalTo(itemImageView.snp.top)
      $0.leading.equalTo(itemImageView.snp.trailing).offset(13)
      $0.bottom.equalToSuperview().offset(-32)
      $0.width.equalTo(153)
      $0.height.equalTo(54)
    }
    
    saveBtn.snp.makeConstraints {
      $0.top.equalToSuperview().offset(18)
      $0.trailing.equalToSuperview().offset(-17)
      $0.leading.equalTo(titleStackView.snp.trailing).offset(111)
    }
    
    priceLabel.snp.makeConstraints {
      $0.top.equalToSuperview().offset(67)
      $0.trailing.equalTo(saveBtn.snp.trailing)
      $0.bottom.equalToSuperview().offset(-16)
    }
  }
  
  private func setStackConstraints() {
    [titleLabel, descriptionLabel].forEach {
      titleStackView.addArrangedSubview($0)
      $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    titleLabel.snp.makeConstraints {
      $0.top.leading.trailing.equalToSuperview()
    }
    
    descriptionLabel.snp.makeConstraints {
      $0.top.equalTo(titleLabel.snp.bottom)
      $0.leading.trailing.equalToSuperview()
      $0.height.equalTo(33)
    }
  }
}
