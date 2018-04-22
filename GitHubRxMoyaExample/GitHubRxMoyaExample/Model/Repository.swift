//
//  Repository.swift
//  GitHubRxMoyaExample
//
//  Created by Alexey Danilov on 22.04.2018.
//  Copyright © 2018 danilovdev. All rights reserved.
//

import Foundation

struct Repository: Decodable {
    
    let identifier: Int
    
    let language: String
    
    let name: String
    
    let fullName: String
    
    private enum CodingKeys: String, CodingKey {
        
        case identifier = "id"
        
        case language = "language"
        
        case name = "name"
        
        case fullName = "full_name"
        
    }
    
}
