//
//  ViewController.swift
//  Weak4
//
//  Created by jaewon Lee on 10/28/24.
//

import UIKit

class TeenipingViewController: UIViewController {
  
  private let rootView = TeenipingView()

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    self.view = rootView
    
    setupAction()
    setupDelegate()
  }

  private func setupAction() {
    rootView.segmentedControl.addTarget(
      self,
      action: #selector(segmentedControlValueChanged(segment: )),
      for: .valueChanged
    )
  }
  
  private func setupDelegate() {
    rootView.teenipingCollectionView.dataSource = self
  }
  
  @objc
  private func segmentedControlValueChanged(segment: UISegmentedControl) {
    if segment.selectedSegmentIndex == 0 {
      rootView.teenipingCollectionView.isHidden = false
      rootView.emptyLabel.isHidden = true
    } else {
      rootView.teenipingCollectionView.isHidden = true
      rootView.emptyLabel.isHidden = false
    }
  }

}

extension TeenipingViewController: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return TeenipingModel.dummy().count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = collectionView.dequeueReusableCell(
      withReuseIdentifier: TeenipingCollectionViewCell.identifier,
      for: indexPath
    ) as? TeenipingCollectionViewCell else { return UICollectionViewCell() }
    
    let list = TeenipingModel.dummy()
            
    cell.imageView.image = list[indexPath.row].image
    cell.titleLabel.text = list[indexPath.row].name
    
    return cell
  }
}
