//
//  UIImage+Extensions.swift
//  KREAM
//
//  Created by jaewon Lee on 12/27/24.
//

import UIKit
import ImageIO

extension UIImage {
  /// 이미지 사이즈 조절, 데이터 타입으로 변환 후 리사징하기 떄문애 메모리 절약 효율적!!
  /// 특히 큰 이미지를 다룰 때 앱의 안정성과 성능을 향상시킴
  /// - Parameter scale: 이미지 자체 이미지를 1이라 정하고, 얼마큼 줄일것인지 스케일을 입력!!
  /// - Returns: 스케일을 통해 리사이징된 이미지 반환
  func downSample(scale: CGFloat) -> UIImage {
    _ = [kCGImageSourceShouldCache: false] as CFDictionary
    // png 형식으로 변환 후, CFData로 타입을 변환하여 Core Grapics에서 사용할 수 있도록 처리
    let data = self.pngData()! as CFData
    // 이미지 생성
    let imageSource = CGImageSourceCreateWithData(data, nil)!
    let maxPixel = max(self.size.width, self.size.height) * scale
    // Core Graphics에서 이미지를 리사이징하기 위한 설정
    let downSampleOptions = [
      // 항상 원본 이미지에서 리사이즈된 이미지 생성
      kCGImageSourceCreateThumbnailFromImageAlways: true,
      // 이미지를 즉시 캐싱하여 이미지 성능을 향상시킴
      kCGImageSourceShouldCacheImmediately: true,
      // 이미지의 회전 및 방향 정보를 고려하여 리사이징 된 이미지를 생성
      kCGImageSourceCreateThumbnailWithTransform: true,
      // 리사이징 될 이미지의 최대 픽셀 크기를 설정.
      kCGImageSourceThumbnailMaxPixelSize: maxPixel
    ] as CFDictionary
    
    // 설정한 옵션에 따라 이미지를 리사이징
    let downSampledImage = CGImageSourceCreateThumbnailAtIndex(
      imageSource,
      0, // 첫 번째 이미지를 대상으로 수행
      downSampleOptions
    )!
    
    let newImage = UIImage(cgImage: downSampledImage)
    return newImage
  }
}
