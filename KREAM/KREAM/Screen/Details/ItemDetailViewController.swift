//
//  ProductDetailViewController.swift
//  KREAM
//
//  Created by jaewon Lee on 11/11/24.
//

import UIKit

class ItemDetailViewController: UIViewController {
  
  let data = ItemDetailData.purchaseData
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.view = ItemDetailView()
  }
  
}
