//
//  IssueTrackerViewModel.swift
//  GitHubRxMoyaExample
//
//  Created by Alexey Danilov on 22.04.2018.
//  Copyright © 2018 danilovdev. All rights reserved.
//

import Foundation
import Moya
import RxSwift
import RxOptional

struct IssueTrackerViewModel {
    
    let provider: MoyaProvider<GitHubEndPoint>
    
    let reposytoryName: Observable<String>
    
    func findIssues(repository: Repository) -> Observable<[Issue]?> {
        return provider.rx
            .request(.issues(repositoryFullName: repository.fullName))
            .debug()
            .map([Issue]?.self)
            .asObservable()
    }
    
    func findRepository(name: String) -> Observable<Repository?> {
        return provider.rx
            .request(.repo(fullName: name))
            .debug()
            .map(Repository?.self)
            .asObservable()
    }
    
    func trackIssues() -> Observable<[Issue]> {
        return reposytoryName
            .observeOn(MainScheduler.instance)
            .flatMapLatest { name -> Observable<Repository?> in
                return self.findRepository(name: name)
            }
            .flatMapLatest { repository -> Observable<[Issue]?> in
                guard let repository = repository else { return Observable.just(nil) }
                
                return self.findIssues(repository: repository)
            }
            .replaceNilWith([])
    }
    
    
}
