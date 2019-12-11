//
//  DetailedViewController.swift
//  AC-iOS-Multiple-MVC
//
//  Created by Christian Hurtado on 11/18/19.
//  Copyright © 2019 AC-iOS. All rights reserved.
//

import UIKit

class DetailedViewController: UIViewController {

    @IBOutlet weak var DetailedAnimalView:UIImageView!
    
    @IBOutlet weak var DetailedAnimalLabel:UILabel!
    
    @IBOutlet weak var DetailedDescriptionLabel:UILabel!
    
    
    var zooAnimal: ZooAnimal?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        
    }
    func updateUI() {
    guard let theZooAnimal = zooAnimal else {
        fatalError("Couldn't get a value for zoo animal, verify prepare(for segue)")
    }
        title = zooAnimal?.name
        DetailedAnimalView.image = UIImage(named: theZooAnimal.imageNumber.description)
        DetailedDescriptionLabel.text = theZooAnimal.info
        DetailedAnimalLabel.text = theZooAnimal.name
}
}
