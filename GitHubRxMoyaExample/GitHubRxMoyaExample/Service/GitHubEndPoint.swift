//
//  GitHubEndPoint.swift
//  GitHubRxMoyaExample
//
//  Created by Alexey Danilov on 22.04.2018.
//  Copyright © 2018 danilovdev. All rights reserved.
//
    

import Foundation
import Moya

extension String {
    var URLEncodedString: String {
        return self.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlHostAllowed)!
    }
}

enum GitHubEndPoint {
    
    case userProfile(username: String)
    
    case repos(username: String)
    
    case repo(fullName: String)
    
    case issues(repositoryFullName: String)
}

extension GitHubEndPoint: TargetType {
    
    var baseURL: URL {
        let urlString = "https://api.github.com"
        let url = URL(string: urlString)!
        return url
    }
    
    var path: String {
        switch self {
        case .userProfile(let username):
            return "/users/\(username.URLEncodedString)"
        case .repos(let username):
            return "/users/\(username.URLEncodedString)/repos"
        case .repo(let fullName):
            return "/repos/\(fullName)"
        case .issues(let repositoryFullName):
            return "/repos/\(repositoryFullName)/issues"
        }
    }
    
    var method: Moya.Method {
        return .get
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        return .requestPlain
    }
    
    var headers: [String : String]? {
        return nil
    }
    
    
}
