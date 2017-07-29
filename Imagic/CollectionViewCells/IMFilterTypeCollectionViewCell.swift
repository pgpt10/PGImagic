//
//  IMFilterTypeCollectionViewCell.swift
//  Imagic
//
//  Created by Payal Gupta on 7/29/17.
//  Copyright © 2017 pdiosdev. All rights reserved.
//

import UIKit

class IMFilterTypeCollectionViewCell: UICollectionViewCell
{
    //MARK: Outlets
    @IBOutlet weak var filterTypeImageView: UIImageView!
    @IBOutlet weak var filterTypeLabel: UILabel!
    @IBOutlet weak var tickImageView: UIImageView!
    
    //MARK: View Lifecycle Methods
    override func awakeFromNib()
    {
        super.awakeFromNib()
        self.layer.cornerRadius = 4.0
        self.tickImageView.layer.cornerRadius = 10.0
        self.filterTypeImageView.image = nil
        self.filterTypeLabel.text = nil
    }
    
    override var isSelected: Bool{
        didSet{
            UIView.animate(withDuration: 0.3, delay: 0.0, options: .curveEaseOut, animations: {
                self.transform = self.isSelected ? CGAffineTransform(scaleX: 1.1, y: 1.1) : CGAffineTransform.identity
                self.tickImageView.isHidden = self.isSelected ? false : true
                self.filterTypeLabel.backgroundColor = self.isSelected ? UIColor(hexString: "555555", alpha: 0.74) : UIColor(hexString: "999999", alpha: 0.74)
            }, completion: nil)
            
        }
    }
    
    override func prepareForReuse()
    {
        super.prepareForReuse()
        self.filterTypeImageView.image = nil
        self.filterTypeLabel.text = nil
    }
}
