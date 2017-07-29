
//
//  IMNavigationBar.swift
//  Imagic
//
//  Created by Payal Gupta on 7/29/17.
//  Copyright © 2017 pdiosdev. All rights reserved.
//

import UIKit

extension UINavigationBar
{
    func makeTransparent()
    {
        self.isTranslucent = true
        self.setBackgroundImage(UIImage(), for: .default)
        self.backgroundColor = UIColor.clear
        self.shadowImage = UIImage()
    }
    
    func makeDefault()
    {
        self.isTranslucent = true
        self.setBackgroundImage(nil, for: .default)
        self.backgroundColor = nil
        self.shadowImage = nil
    }
}
