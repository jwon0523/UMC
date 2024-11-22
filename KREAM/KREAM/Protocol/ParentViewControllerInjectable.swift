//
//  ParentViewControllerInjection.swift
//  KREAM
//
//  Created by jaewon Lee on 11/16/24.
//

import Foundation
import UIKit

// AnyObject로 선언하여 참조 타입에서만 프로토콜 채택 가능하도록 함.
// struct와 enum에서는 채택 불가능
protocol ParentViewControllerInjectable: AnyObject {
  var parentViewController: UIViewController? { get set }
}
