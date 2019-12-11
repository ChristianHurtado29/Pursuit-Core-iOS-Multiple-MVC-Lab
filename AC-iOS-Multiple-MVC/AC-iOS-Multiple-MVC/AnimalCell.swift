//
//  CountryCell.swift
//  AC-iOS-Multiple-MVC
//
//  Created by Christian Hurtado on 11/18/19.
//  Copyright © 2019 AC-iOS. All rights reserved.
//

import UIKit

class AnimalCell: UITableViewCell {

    @IBOutlet weak var animalView:UIImageView!
    @IBOutlet weak var animalNameLabel:UILabel!
    @IBOutlet weak var animalOriginLabel:UILabel!
    
    
    
    func configureCell(for zooAnimal: ZooAnimal){
        animalView.image = UIImage(named: zooAnimal.imageNumber.description)
        animalNameLabel.text = zooAnimal.name
        animalOriginLabel.text = zooAnimal.origin
    }
    


}
