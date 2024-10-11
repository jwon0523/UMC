//
//  SavedView.swift
//  KREAM
//
//  Created by jaewon Lee on 10/11/24.
//

import UIKit

class SavedView: UIView {
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    self.backgroundColor = .white
    self.setConstraints()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  let titleLabel: UILabel = {
    let label = UILabel()
    label.text = "Saved"
    label.font = .systemFont(ofSize: 28, weight: .bold)
    label.textColor = .black
    return label
  }()
  
  lazy var savedTableView: UITableView = {
    let tableView = UITableView()
    tableView.register(
      SavedTableViewCell.self,
      forCellReuseIdentifier: SavedTableViewCell.identifier
    )
    tableView.separatorStyle = .singleLine
    return tableView
  }()
  
  private func setConstraints() {
    [titleLabel, savedTableView].forEach {
      self.addSubview($0)
      $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    titleLabel.snp.makeConstraints {
      $0.top.equalTo(safeAreaLayoutGuide.snp.top).offset(16)
      $0.leading.equalToSuperview().offset(10)
      $0.trailing.equalToSuperview().offset(-302)
    }
    savedTableView.snp.makeConstraints {
      $0.top.equalTo(titleLabel.snp.bottom).offset(16)
      $0.leading.trailing.bottom.equalToSuperview()
    }
  }
}
