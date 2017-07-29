//
//  IMImagePickerViewController.swift
//  Imagic
//
//  Created by Payal Gupta on 7/29/17.
//  Copyright © 2017 pdiosdev. All rights reserved.
//

import UIKit

class IMImagePickerViewController: UIViewController
{
    //MARK: Outlets
    
    //MARK: Private Properties
    fileprivate var imagePickerController: UIImagePickerController?

    //MARK: View Lifecycle Methods
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.customizePickerView()
    }
    
    //MARK: Private Methods
    private func customizePickerView()
    {
        self.imagePickerController = UIImagePickerController()
        self.imagePickerController?.sourceType = .photoLibrary
        self.imagePickerController?.navigationBar.tintColor = UIColor.darkGray
        self.imagePickerController?.delegate = self
        
        self.view.addSubview(self.imagePickerController!.view)
        self.addChildViewController(self.imagePickerController!)
        self.imagePickerController?.didMove(toParentViewController: self)
    }
}

extension IMImagePickerViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate
{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any])
    {
        if let selectedImage = info[UIImagePickerControllerOriginalImage] as? UIImage
        {
            let processorController = self.storyboard?.instantiateViewController(withIdentifier: "IMProcessingViewController") as! IMProcessingViewController
            processorController.originalImage = selectedImage
            self.imagePickerController?.pushViewController(processorController, animated: true)
        }
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController)
    {
        //TODO:
    }
}
