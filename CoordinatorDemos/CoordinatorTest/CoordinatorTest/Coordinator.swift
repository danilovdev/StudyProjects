//
//  Coordinator.swift
//  CoordinatorTest
//
//  Created by Alexey Danilov on 22.06.2018.
//  Copyright © 2018 danilovdev. All rights reserved.
//

import UIKit

protocol Coordinator {
    
    var childCoordinators: [Coordinator] { get set }
    
    var navigationController: UINavigationController { get set }
    
    func start()
}
