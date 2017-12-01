//
//  PhotoInfoViewController.swift
//  Photorama
//
//  Created by Adminaccount on 11/28/17.
//  Copyright © 2017 Adminaccount. All rights reserved.
//

import UIKit

class PhotoInfoViewController: UIViewController {
    
    @IBOutlet var imageView: UIImageView!
    
    @IBOutlet weak var imageViewCounter: UITextField!
    
    var photo: Photo! {
        didSet {
            navigationItem.title = photo.title
        }
    }
    
    var store: PhotoStore!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        store.fetchImage(for: photo) { (result) -> Void in
            switch result {
            case let .success(image):
                self.imageView.image = image
                // Core Data: Silver Challenge
                self.photo.photoViewCounter += 1
                let counter = self.photo.photoViewCounter
                self.imageViewCounter.text = counter > 1 ? "👓 \(counter) times" : "👓 \(counter) time"
                // Core Data: Silver Challenge
            case let .failure(error):
                print("Error fetching image for photo: \(error)")
            }
        }
    }
    
}
