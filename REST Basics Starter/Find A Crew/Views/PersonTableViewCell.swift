//
//  PersonTableViewCell.swift
//  Unit 2 - REST Basics
//
//  Created by Spencer Curtis on 5/15/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class PersonTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var eyeColorLabel: UILabel!
    
    var person: Person? {
        didSet{
            updateViews()
        }
    }
    
    func updateViews(){
        guard let person = person else{return}
        
        nameLabel.text = person.name
        heightLabel.text = "\(person.height) cm"
        eyeColorLabel.text = "\(person.eyeColor) eyes"
    }
    
}
