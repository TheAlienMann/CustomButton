//
//  File.swift
//  
//
//  Created by Mohamad Rahmani on 15.06.22.
//

import UIKit

public func makeImage() -> UIImage {
  UIImage.make(withColor: .blue)
}

public extension UIImage {
  static func make(withColor color: UIColor) -> UIImage {
    let rect = CGRect(x: 0, y: 0, width: 1, height: 1)
    UIGraphicsBeginImageContext(rect.size)
    let context = UIGraphicsGetCurrentContext()!
    context.setFillColor(color.cgColor)
    context.fill(rect)
    let image = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    return image!
  }
}
