//
//  TabBarMainViewController.swift
//  KREAM
//
//  Created by jaewon Lee on 10/2/24.
//

import UIKit

class TabBarMainViewController: UITabBarController {
  private let homeViewController = HomeViewController()
  private let styleViewController = StyleViewController()
  private let searchViewController = SearchViewController()
  private let saveViewController = SaveViewController()
  // 모달 전환은 네비게이션 스택을 포함하지 않기 때문에 UINavigationController로 감싸줘야 함.
  private let myProfileViewController = UINavigationController(
    rootViewController: MyProfileViewController())
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    self.navigationItem.hidesBackButton = true
    tabBarSetup()
    self.viewControllers = [
      homeViewController,
      styleViewController,
      searchViewController,
      saveViewController,
      myProfileViewController
    ]
  }
}

extension TabBarMainViewController {
  func tabBarSetup() {
    homeViewController.tabBarItem = UITabBarItem(
      title: "Home",
      image: UIImage(named: "HomeIcon")?.withTintColor(.black),
      tag: 0
    )
    
    styleViewController.tabBarItem = UITabBarItem(
      title: "Style",
      image: UIImage(named: "StyleIcon")?.withTintColor(.black),
      tag: 1
    )
    
    searchViewController.tabBarItem = UITabBarItem(
      title: "Search",
      image: UIImage(named: "SearchIcon")?.withTintColor(.black),
      tag: 2
    )
    
    saveViewController.tabBarItem = UITabBarItem(
      title: "Save",
      image: UIImage(named: "SaveIcon")?.withTintColor(.black),
      tag: 3
    )
    
    myProfileViewController.tabBarItem = UITabBarItem(
      title: "My",
      image: UIImage(named: "ProfileIcon")?.withTintColor(.black),
      tag: 5
    )
  }
}
