//
//  Post.swift
//  MoyaRxExample
//
//  Created by Alexey Danilov on 22.04.2018.
//  Copyright © 2018 danilovdev. All rights reserved.
//

import Foundation

struct Post: Decodable {
    
    let userId: Int
    
    let id: Int
    
    let title: String
    
    let body: String
}
