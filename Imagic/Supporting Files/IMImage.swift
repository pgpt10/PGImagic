//
//  IMImage.swift
//  Imagic
//
//  Created by Payal Gupta on 7/29/17.
//  Copyright © 2017 pdiosdev. All rights reserved.
//

import UIKit
import CoreImage

extension UIImage
{
    static func filter(image: UIImage?, type: FilterType) -> UIImage?
    {
        if let image = image
        {
            let ciContext = CIContext()
            let ciImage = CIImage(image: image)
            let filter = CIFilter(name: type.ciFilterName)
            filter?.setValue(ciImage, forKey: kCIInputImageKey)
            if let filteredCIImage = filter?.outputImage, let filteredImageRef = ciContext.createCGImage(filteredCIImage, from: filteredCIImage.extent)

            {
                return UIImage.init(cgImage: filteredImageRef, scale: image.scale, orientation: image.imageOrientation)
            }
        }
        return image
    }
}
