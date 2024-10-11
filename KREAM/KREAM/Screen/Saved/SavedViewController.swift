//
//  SaveView.swift
//  KREAM
//
//  Created by jaewon Lee on 10/2/24.
//

import UIKit

class SavedViewController: UIViewController {
  
  var data = dummySavedModel.sample
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.view.backgroundColor = .white
    self.view = savedView
  }
  
  private lazy var savedView: SavedView = {
    let view = SavedView()
    view.savedTableView.dataSource = self
    view.savedTableView.delegate = self
    return view
  }()
}

extension SavedViewController: UITableViewDataSource, UITableViewDelegate {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    data.count
  }
  
  func tableView(
    _ tableView: UITableView,
    cellForRowAt indexPath: IndexPath
  ) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(
      withIdentifier: SavedTableViewCell.identifier,
      for: indexPath
    ) as? SavedTableViewCell else { return UITableViewCell() }
    
    cell.configure(with: data[indexPath.row])
    
    return cell
  }
  
  func tableView(
      _ tableView: UITableView,
      titleForHeaderInSection section: Int
    ) -> String? {
      return "전체 \(data.count)개"
    }
}
