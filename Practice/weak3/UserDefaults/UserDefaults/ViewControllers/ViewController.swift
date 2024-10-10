//
//  ViewController.swift
//  UserDefaults
//
//  Created by jaewon Lee on 10/8/24.
//

import UIKit

class ViewController: UIViewController {
  
  private let userDefaultsModel = UserDefaultsModel()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.view = userDefaultsView
    loadTextValue()
  }
  
  private lazy var userDefaultsView: UserDefaultsView = {
    let view = UserDefaultsView()
    view.saveButton.addTarget(
      self,
      action: #selector(saveButtonClicked),
      for: .touchUpInside
    )
    return view
  }()
  
  @objc func saveButtonClicked() {
    guard let text = userDefaultsView.inputTextField.text,
            !text.isEmpty else { return }
    // 모델을 통해 텍스트 저장
    userDefaultsModel.saveUserText(text)
    // 저장된 텍스트 라벨에 직접 할당
    userDefaultsView.showTextValue.text = text
  }
  
  // 저장된 텍스트 값이 있을 경우 가져오기
  private func loadTextValue() {
    if let savedText = userDefaultsModel.loadUserText() {
      userDefaultsView.showTextValue.text = savedText
    }
  }
}
