//
//  BaseViewController.swift
//  week2
//
//  Created by jaewon Lee on 9/30/24.
//

import UIKit

class BaseViewController: UITabBarController {
  private let modalVC = ModalViewController()
  // NavigationViewController는 ViewController를 상속받고 있기 때문에 Navigation을 직접적인 사용 불가능
  // UINavigationController를 사용해야하므로 아래와 같이 rootViewController를 UIViewController를 상속받은 NavigationViewController 객체를 생성하면
  // Navigation 방식을 사용할 수 있음
  private let navigationVC = UINavigationController(rootViewController: NavigationViewController())
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    
    modalVC.tabBarItem = UITabBarItem(title: "modalVC", image: UIImage(systemName: "apple.terminal"), tag: 0)
    navigationVC.tabBarItem = UITabBarItem(title: "navigationVC", image: UIImage(systemName: "tray.full"), tag: 1)
    
    // UITabBarController를 상속받았으므로 UITabBarController가 BaseViewController 자신(self)임
    self.viewControllers = [modalVC, navigationVC]
  }
}
