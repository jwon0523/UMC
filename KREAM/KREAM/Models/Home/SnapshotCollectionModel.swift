//
//  SnapshotCollectionModel.swift
//  KREAM
//
//  Created by jaewon Lee on 11/8/24.
//

import Foundation
import UIKit

struct SnapshotCollectionModel {
  let image: UIImage
  let hashTag: String
}

extension SnapshotCollectionModel {
  static func snapshotCollectionData() -> [SnapshotCollectionModel] {
    return [
      SnapshotCollectionModel(image: .snapshot1, hashTag: "@katarinabluu"),
      SnapshotCollectionModel(image: .snapshot2, hashTag: "@imwinter"),
      SnapshotCollectionModel(image: .snapshot3, hashTag: "@thousand_wooo"),
      SnapshotCollectionModel(image: .snapshot1, hashTag: "@katarinabluu"),
    ]
  }
}
