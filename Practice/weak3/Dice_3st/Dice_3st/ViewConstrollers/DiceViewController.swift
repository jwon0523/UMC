//
//  ViewController.swift
//  Dice_3st
//
//  Created by jaewon Lee on 10/10/24.
//

import UIKit

class DiceViewController: UIViewController {

  var data = dummyDiceModel.diceDatas
  
  let sectionTtiles = ["Section1", "Section2", "Section3"]
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    self.view = diceView
  }
  
  private lazy var diceView: DiceView = {
    let view = DiceView()
    view.tableView.dataSource = self
    view.tableView.delegate = self
    return view
  }()
}

// UITableViewDataSource: 테이블 뷰에 표시될 데이터의 양과 종류를 결정하며 데이터를 적절한 셀에 할당하는 역할을 함
// UITableViewDelegate: 셀의 높이, 헤더와 푸터의 렌더링, 셀의 선택과 같은 사용자 인터랙션을 관리
extension DiceViewController: UITableViewDataSource, UITableViewDelegate {
  // 각 행의 수를 반환하는 메서드
  func tableView(
    _ tableView: UITableView,
    numberOfRowsInSection section: Int
  ) -> Int {
    data.count
  }
  
  // 커스텀 셀을 재사용 큐에 가져와 데이터를 설정하는 메서드
  func tableView(
    _ tableView: UITableView,
    cellForRowAt indexPath: IndexPath
  ) -> UITableViewCell {
    // UITableView는 셀 재사용 메커니즘을 사용하여 메모리 사용 최적화함.
    // dequeueReusableCell을 사용하여 화면에 보이는 셀만 메모리에 유지하고, 스크롤되어 화면 밖으로 사라진 셀은 재사용 큐에 추가해 필요할 때 다시 사용할 수 있도록 함.
    // witIdentifier와 일치하는 identifier을 찾아 해당하는 셀을 재사용하거나 새로 생성함.
    // register(forCellReuseIdentifier:)에서 forCellReuseIdentifier에 등록된 식별자를 기준으로 찾는듯
    guard let cell = tableView.dequeueReusableCell(
      withIdentifier: DiceCell.identifier,
      for: indexPath
    ) as? DiceCell else {
      return UITableViewCell()
    }
    
    // DiceCell에서 셀의 이미지와 텍스트는 비워둔 내용을 configure 함수 통해 생성.
    cell.configure(model: data[indexPath.row])
    
    return cell
  }
  
  // 사용자가 특정 행을 선택했을 때 호출되는 메서드. 선택 효과를 애니메이션과 함께 해제
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
  }
  
  // 하나의 TableView가 하나의 섹션인듯
  func tableView(
    _ tableView: UITableView,
    titleForHeaderInSection section: Int
  ) -> String? {
    return sectionTtiles[section]
  }
  
  func tableView(
    _ tableView: UITableView,
    heightForHeaderInSection section: Int
  ) -> CGFloat {
      return 70.0 // 적절한 높이 설정
  }
  
  func tableView(
    _ tableView: UITableView,
    titleForFooterInSection section: Int
  ) -> String? {
    return "푸터 \(sectionTtiles[section])"
  }
}

extension DiceViewController: UITableViewDataSourcePrefetching {
  // UITableView가 특정 셀들을 화면에 표시하기 전에 호출함.
  // 즉, 테이블 뷰가 곧 표시할 셀들의 위치(indexPath)를 알려줌.
  func tableView(
    _ tableView: UITableView,
    prefetchRowsAt indexPaths: [IndexPath]
  ) {
    // preloadDataForItem(at: indexPath.row)
  }
  
  // 이미지 데이터 로딩 로직. 비동기로 처리하여 이미지를 불러옴
//  func preloadDataForItem(at index: Int) {
//    let url = imageUrls[index]
//    // URLSession.shared.dataTask를 사용해 네트워크에 비동기 요청함.
//    let task = URLSession.shared.dataTask(with: url) { data, response, error in
//      guard let data = data, error == nil, let image = UIImage(data: data) else {
//        return
//      }
//      // 성공적으로 요청이 반환되면 DispatchQueue.main.async를 통해 메인 스레드로 돌아와 나머지 내용들을 처리
//      DispatchQueue.main.async {
//        self.images[index] = image
//        let indexPath = IndexPath(row: index, section: 0)
//        if self.tableView.indexPathsForVisibleRows?.contains(indexPath) ?? false {
//          self.tableView.reloadRows(at: [indexPath], with: .fade)
//        }
//      }
//    }
//    task.resume()
//  }
}
