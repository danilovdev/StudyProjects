//
//  AppDelegate.swift
//  RxGithub
//
//  Created by Alexey Danilov on 06.06.2018.
//  Copyright © 2018 danilovdev. All rights reserved.
//

import UIKit
import Firebase
import Swinject
import SwinjectStoryboard

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    var container: Container!

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        container = Container() { container in
            container.storyboardInitCompleted(UINavigationController.self) { (_, _) in }
            container.storyboardInitCompleted(SearchViewController.self) { (_, _) in }
            container.storyboardInitCompleted(ProfileViewController.self) { (_, _) in }
            container.storyboardInitCompleted(CommentsViewController.self) { (_, _) in }
        }
        
//        FirebaseApp.configure()
        
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.backgroundColor = .white
        window.makeKeyAndVisible()
        self.window = window
        
        
        
        return true
    }

}

