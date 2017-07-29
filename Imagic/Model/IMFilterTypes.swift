//
//  IMFilterTypes.swift
//  Imagic
//
//  Created by Payal Gupta on 7/29/17.
//  Copyright © 2017 pdiosdev. All rights reserved.
//

import Foundation

let filters: [FilterType] = [.none, .process, .fade, .instant, .mono, .noir, .chrome, .sepia, .tonal, .transfer, .falseColor]

enum FilterType: String
{
    case falseColor
    case sepia
    case transfer
    case tonal
    case process
    case noir
    case instant
    case fade
    case chrome
    case mono
    case none
    
    var ciFilterName: String{
        switch self
        {
        case .falseColor:
            return "CIFalseColor"
        case .sepia:
            return "CISepiaTone"
        case .transfer:
            return "CIPhotoEffectTransfer"
        case .tonal:
            return "CIPhotoEffectTonal"
        case .process:
            return "CIPhotoEffectProcess"
        case .noir:
            return "CIPhotoEffectNoir"
        case .instant:
            return "CIPhotoEffectInstant"
        case .fade:
            return "CIPhotoEffectFade"
        case .chrome:
            return "CIPhotoEffectChrome"
        case .mono:
            return "CIPhotoEffectMono"
        case .none:
            return ""
        }
    }
    
    var displayImageName: String{
        return String(describing: self)
    }
    
    var displayName: String{
        return String(describing: self).capitalized
    }
}
