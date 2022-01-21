//
//  Helper.swift
//  faceDetection
//
//  Created by David Isermann on 21.01.22.
//

import UIKit

extension UIViewController {
    
    public func convertUnitToPoint (originalImageRect: CGRect, targetRect: CGRect) -> CGRect {
        
        var pointRect = targetRect
        
        pointRect.origin.x = originalImageRect.origin.x + (targetRect.origin.x * originalImageRect.size.width)
        pointRect.origin.y = originalImageRect.origin.y + (1 - targetRect.origin.y - targetRect.height)
        pointRect.size.width *= originalImageRect.size.width
        pointRect.size.height *= originalImageRect.size.height
        
        return pointRect
    }
    
    public func determineScale (cgImage: CGImage, imageViewFrame: CGRect) -> CGRect {
        let originalWidth = CGFloat(cgImage.width)
        let originalHeigth = CGFloat(cgImage.height)
        
        let imageFrame = imageViewFrame
        let widthRatio = originalWidth / imageFrame.width
        let heigthRatio = originalHeigth / imageFrame.height
        
        let scaleRatio = max(widthRatio, heigthRatio)
        
        let scaledImageWidth = originalWidth / scaleRatio
        let scaledImageHeigth = originalHeigth / scaleRatio
        
        let scaledImageX = (imageFrame.width - scaledImageWidth) / 2
        let scaledImageY = (imageFrame.height - scaledImageHeigth) / 2
        
        return CGRect(x: scaledImageX, y: scaledImageY, width: scaledImageWidth, height: scaledImageHeigth)
    }
    
}

extension CGImagePropertyOrientation {
    
    init(_ orientation: UIImage.Orientation) {
        
        switch orientation {
        case .up: self = .up
        case .upMirrored: self = .upMirrored
        case .down: self = .down
        case .downMirrored: self = .downMirrored
        case .right: self = .right
        case .rightMirrored: self = .rightMirrored
        default: self = .up
        }
    }
}
