//
//  TabBarMainViewController.swift
//  KREAM
//
//  Created by jaewon Lee on 10/2/24.
//

import UIKit

class TabBarMainViewController: UITabBarController {
  private let homeView = HomeView()
  private let styleView = StyleView()
  private let searchView = SearchView()
  private let saveView = SaveView()
  private let myProfileView = MyProfileView()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    self.navigationItem.hidesBackButton = true
    tabBarSetup()
    self.viewControllers = [homeView, styleView, searchView, saveView, myProfileView]
  }
}

extension TabBarMainViewController {
  func tabBarSetup() {
    homeView.tabBarItem = UITabBarItem(
      title: "Home",
      image: UIImage(named: "HomeIcon")?.withTintColor(.black),
      tag: 0
    )
    
    styleView.tabBarItem = UITabBarItem(
      title: "Style",
      image: UIImage(named: "StyleIcon")?.withTintColor(.black),
      tag: 1
    )
    
    searchView.tabBarItem = UITabBarItem(
      title: "Search",
      image: UIImage(named: "SearchIcon")?.withTintColor(.black),
      tag: 2
    )
    
    saveView.tabBarItem = UITabBarItem(
      title: "Save",
      image: UIImage(named: "SaveIcon")?.withTintColor(.black),
      tag: 3
    )
    
    myProfileView.tabBarItem = UITabBarItem(
      title: "My",
      image: UIImage(named: "ProfileIcon")?.withTintColor(.black),
      tag: 5
    )
  }
}
