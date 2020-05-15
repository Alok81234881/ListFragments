//
//  DetailViewController.swift
//  ListFragments
//
//  Created by alok singh  on 15/05/20.
//  Copyright © 2020 alok singh . All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    
    @IBOutlet weak var imageOfDog: UIImageView!
    @IBOutlet weak var lifeSpan: UILabel!
    
    @IBOutlet weak var temperament: UILabel!
    @IBOutlet weak var dogBreed: UILabel!
    @IBOutlet weak var dogName: UILabel!
    
    
    var name = ""
    var breed = ""
    var temp = ""
    var lfspn = ""
    var image = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dogName.text = name
        lifeSpan.text = lfspn
        dogBreed.text = breed
        temperament.text = temp
        imageOfDog.image = image
        

        // Do any additional setup after loading the view.
    }
    

  

}
