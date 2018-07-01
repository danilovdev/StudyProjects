//
//  Storyboarded.swift
//  CoordinatorTest
//
//  Created by Alexey Danilov on 22.06.2018.
//  Copyright © 2018 danilovdev. All rights reserved.
//

import UIKit

protocol Storyboarded {
    
    static func instantiate() -> Self
}

extension Storyboarded where Self: UIViewController {
    
    static func instantiate() -> Self {
        let fullName = NSStringFromClass(self)
        let className = fullName.components(separatedBy: ".")[1]
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        return storyboard.instantiateViewController(withIdentifier: className) as! Self
    }
}
