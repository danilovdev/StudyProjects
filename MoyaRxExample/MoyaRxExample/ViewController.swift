//
//  ViewController.swift
//  MoyaRxExample
//
//  Created by Alexey Danilov on 22.04.2018.
//  Copyright © 2018 danilovdev. All rights reserved.
//

import UIKit
import Moya
import RxSwift

class ViewController: UIViewController {
    
    let postProvider = MoyaProvider<PostService>()
    
    let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        getPostsRx()
    }
    
    func getPosts() {
        postProvider.request(.getPosts) { result in
            switch result {
            case .success(let response):
                do {
                    let posts = try JSONDecoder().decode([Post].self, from: response.data)
                    print(posts)
                } catch let error as NSError {
                    print(error)
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func getPostsRx() {
        postProvider.rx
            .request(.getPosts)
            .filterSuccessfulStatusCodes()
            .map([Post].self)
            .observeOn(MainScheduler.instance)
            .subscribe { event in
                switch event {
                case .success(let response):
                    print(response.count)
                case .error(let error):
                    print(error)
                }
            }
            .disposed(by: disposeBag)
    }


}

