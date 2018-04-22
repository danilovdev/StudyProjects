//
//  Issue.swift
//  GitHubRxMoyaExample
//
//  Created by Alexey Danilov on 22.04.2018.
//  Copyright © 2018 danilovdev. All rights reserved.
//

import Foundation

struct Issue: Decodable {
    
    let identifier: Int
    
    let number: Int
    
    let title: String
    
    let body: String
    
    private enum CodingKeys: String, CodingKey {
        
        case identifier = "id"
        
        case number = "number"
        
        case title = "title"
        
        case body = "body"
    }
}
