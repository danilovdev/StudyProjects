//
//  ViewController.swift
//  CoordinatorTest
//
//  Created by Alexey Danilov on 22.06.2018.
//  Copyright © 2018 danilovdev. All rights reserved.
//

import UIKit

class ViewController: UIViewController, Storyboarded {
    
    weak var coordinator: MainCoordinator?
    
    @IBAction func buyButtonTapped(_ sender: Any) {
        coordinator?.buySubscription()
    }
    
    @IBAction func createAccountButtonTapped(_ sender: Any) {
        coordinator?.createAccount()
    }
    
}

