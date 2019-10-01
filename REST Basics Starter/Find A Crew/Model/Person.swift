//
//  Person.swift
//  Find A Crew
//
//  Created by Austin Potts on 10/1/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation



//When working with JSON, you can(and often should) make a struct or class for every level of the JSON that you care about.

struct PersonSearch: Codable {
    let results: [Person]
}

struct Person: Codable {
    
    let name: String
    let height: String
    let eyeColor: String
    
    //Codingkeys allows codable to map properties that dont have matching names to the JSON. Matters greatly in an interview to follow this standard.
    enum CodingKeys: String, CodingKey {
        case name
        case height
        case eyeColor = "eye_color"
        
    }
    
}
