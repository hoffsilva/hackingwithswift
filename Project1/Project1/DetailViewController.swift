//
//  DetailViewController.swift
//  Project1
//
//  Created by Cast Group on 18/02/19.
//  Copyright © 2019 Hoff Henry Pereira da Silva. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet var imageView: UIImageView!
    var selectedImage: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "View Picture"
        guard let secureImageName = selectedImage else {
            return
        }
        imageView.image = UIImage(named: secureImageName)
        title = secureImageName
        navigationItem.largeTitleDisplayMode = .never
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = false
    }

}
