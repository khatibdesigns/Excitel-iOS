//
//  UITableViewCell.swift
//  MyExcitel
//
//  Created by Nader Alkatib on 13.02.23.
//

import Foundation
import UIKit

func resizeImage(image: UIImage, targetSize: CGSize) -> UIImage {
    let scale = min(targetSize.width / image.size.width,
                    targetSize.height / image.size.height)
    
    let size = CGSize(width: image.size.width * scale,
                      height: image.size.height * scale)
    
    UIGraphicsBeginImageContextWithOptions(size, false, 0)
    image.draw(in: CGRect(origin: .zero, size: size))
    let scaledImage = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    
    return scaledImage!
}
