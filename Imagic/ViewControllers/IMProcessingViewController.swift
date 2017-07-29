//
//  IMProcessingViewController.swift
//  Imagic
//
//  Created by Payal Gupta on 7/29/17.
//  Copyright © 2017 pdiosdev. All rights reserved.
//

import UIKit

class IMProcessingViewController: UIViewController
{
    //MARK: Outlets
    @IBOutlet weak var contentCollectionView: UICollectionView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var toggleButton: UIButton!
    
    //MARK: Private Properties
    fileprivate let kInterItemSpacing: CGFloat = 10.0
    fileprivate var filteredImage: UIImage?{
        didSet{
            self.imageView.image = self.filteredImage ?? self.originalImage
        }
    }
    
    //MARK: Internal Properties
    var originalImage: UIImage?
    
    //MARK: View Lifecycle Methods
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.contentCollectionView.register(UINib.init(nibName: "IMFilterTypeCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "IMFilterTypeCollectionViewCell")
        self.title = nil
        
        let shareButton = UIBarButtonItem(image: UIImage(named: "share"), style: .plain, target: self, action: #selector(self.shareImage))
        self.navigationItem.rightBarButtonItem = shareButton
        self.navigationController?.navigationBar.tintColor = UIColor.darkGray
        self.imageView.image = self.originalImage
        self.contentCollectionView.selectItem(at: IndexPath.init(row: 0, section: 0), animated: true, scrollPosition: .left)

        //TODO:
//        self.contentCollectionView.layer.shadowColor = UIColor.blue.cgColor
//        self.contentCollectionView.layer.shadowOffset = CGSize(width: 1, height: 1)
//        self.contentCollectionView.layer.shadowRadius = 1.0
//        self.contentCollectionView.layer.masksToBounds = false
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.makeTransparent()
    }
    
    override func viewWillDisappear(_ animated: Bool)
    {
        super.viewWillDisappear(animated)
        self.navigationController?.navigationBar.makeDefault()
    }
    
    //MARK: Button Action Methods
    @IBAction func toggleImages(_ sender: UIButton)
    {
        if self.filteredImage != nil
        {
            sender.isSelected = !sender.isSelected
            self.imageView.image = sender.isSelected ? self.originalImage : self.filteredImage
            self.title = sender.isSelected ? "Original" : nil
        }
    }
    
    @objc private func shareImage()
    {
        if let filteredImage = self.imageView.image
        {
            let activityViewController = UIActivityViewController(activityItems: [filteredImage], applicationActivities: nil)
            self.present(activityViewController, animated: true, completion: nil)
        }
    }
}

// MARK: - UICollectionViewDataSource, UICollectionViewDelegate Methods
extension IMProcessingViewController: UICollectionViewDataSource, UICollectionViewDelegate
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        return filters.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let filter = filters[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "IMFilterTypeCollectionViewCell", for: indexPath) as! IMFilterTypeCollectionViewCell
        cell.filterTypeImageView.image = UIImage(named: filter.displayImageName)
        cell.filterTypeLabel.text = filter.displayName
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
    {
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        self.toggleButton.isSelected = false
        self.title = "Original"
        self.title = nil
        let filter = filters[indexPath.row]
        if filter == .none
        {
            self.filteredImage = nil
        }
        else
        {
            self.filteredImage = UIImage.filter(image: self.originalImage?.copy() as? UIImage, type: filter)
        }
    }
}

// MARK: - UICollectionViewDelegateFlowLayout Methods
extension IMProcessingViewController: UICollectionViewDelegateFlowLayout
{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        return CGSize(width: collectionView.bounds.height, height: collectionView.bounds.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets
    {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat
    {
        return self.kInterItemSpacing
    }
}
