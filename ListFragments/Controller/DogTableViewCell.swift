//
//  DogTableViewCell.swift
//  ListFragments
//
//  Created by alok singh  on 14/05/20.
//  Copyright © 2020 alok singh . All rights reserved.
//

import UIKit

class DogTableViewCell: UITableViewCell {
    @IBOutlet weak var dogImage: UIImageView!
    
    @IBOutlet weak var dogName: UILabel!
    @IBOutlet weak var dogLifeSpan: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    

}
