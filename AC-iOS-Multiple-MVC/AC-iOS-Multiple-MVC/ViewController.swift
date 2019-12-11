//
//  ViewController.swift
//  AC-iOS-Multiple-MVC
//
//  Created by Tom Seymour on 11/2/17.
//  Copyright © 2017 AC-iOS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableVIew: UITableView!
    
    var zooAnimals = [[ZooAnimal]]() {
        didSet {
            tableVIew.reloadData()
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tableVIew.reloadData()
        tableVIew.dataSource = self
        zooAnimals = ZooAnimal.getClassifications()
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let animalDC = segue.destination as? DetailedViewController,
            let indexPath = tableVIew.indexPathForSelectedRow else {
                fatalError("Detailed VC failed to be configured")
        }
        animalDC.zooAnimal = zooAnimals[indexPath.section][indexPath.row]
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension ViewController: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return zooAnimals[section].count
    }
    
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return zooAnimals.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return zooAnimals[section].first?.classification
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "animalCell", for: indexPath) as? AnimalCell else{
            fatalError("unable to dequeue cell")
        }
        let zooAnimal = zooAnimals[indexPath.section][indexPath.row]
        cell.configureCell(for: zooAnimal)
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
}
