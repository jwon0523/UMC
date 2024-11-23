//
//  ViewController.swift
//  Weak7
//
//  Created by jaewon Lee on 11/23/24.
//

import UIKit

class ViewController: UIViewController {
  private lazy var testView: APITestView = {
    let view = APITestView()
    view.searchButton.addTarget(
      self,
      action: #selector(searchText),
      for: .touchUpInside
    )
    return view
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.view = testView
  }
  
  /// 검색 버튼 클릭 시 호출되는 메서드
  @objc private func searchText() {
    // 앞뒤 공백 제거한 문자열 가져오기
    let query = testView.searchTextField.text?.trimmingCharacters(in: .whitespaces) ?? ""
    if query.isEmpty {
      print("검색어를 입력해주세요.")
      return
    }
    search(query: query)
  }
  
  /// 네트워크 요청을 통해 검색 결과를 가져오는 메서드
  private func search(query: String) {
    let url = APIEndpoint.baseURL + APIEndpoint.Search.web
    let parameters: [String: Any] = ["query": query]
    
    APIClient.shared.request(
      url,
      method: .get,
      parameters: parameters
    ) { [weak self] (result: Result<SearchModel, Error>) in
      // 클로저가 실행될 때 self가 유효(해제)한지 확인
      guard let self = self else { return }
      switch result {
      case .success(let response):
        self.updateView(response)
      case .failure(let error):
        self.handleError(error)
      }
    }
  }
  
  /// 검색 결과를 UI에 업데이트
  private func updateView(_ model: SearchModel) {
    guard let firstResult = model.documents.first else {
      testView.responseTitle.text = "검색 결과가 없습니다."
      testView.responseContentsTitle.text = ""
      return
    }
    testView.responseTitle.text = firstResult.titleText
    testView.responseContentsTitle.text = firstResult.contestText
  }
  
  /// 네트워크 오류 처리
  private func handleError(_ error: Error) {
    if let afError = error.asAFError {
      switch afError {
      case .responseValidationFailed(reason: let reason):
        print("응답 검증 실패: \(reason)")
      case .sessionTaskFailed(error: let underlyingError):
        print("네트워크 오류: \(underlyingError.localizedDescription)")
      case .responseSerializationFailed(reason: let reason):
        print("응답 직렬화 실패: \(reason)")
      default:
        print("알 수 없는 Alamofire 오류: \(afError.localizedDescription)")
      }
    } else {
      print("일반 오류: \(error.localizedDescription)")
    }
  }
}
