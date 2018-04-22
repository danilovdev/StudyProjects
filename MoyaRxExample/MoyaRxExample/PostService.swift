//
//  PostService.swift
//  MoyaRxExample
//
//  Created by Alexey Danilov on 22.04.2018.
//  Copyright © 2018 danilovdev. All rights reserved.
//

import Foundation
import Moya

enum PostService {
    
    case getPosts
    case addPost(userId: Int, title: String, body: String)
}

extension PostService: TargetType {
    
    var baseURL: URL {
        let urlString = "https://jsonplaceholder.typicode.com"
        let url = URL(string: urlString)!
        return url
    }
    
    var path: String {
        switch self {
        case .getPosts, .addPost:
            return "/posts"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getPosts:
            return .get
        case .addPost:
            return .post
        }
    }
    
    var sampleData: Data {
        switch self {
        case .getPosts:
            return Data()
        case .addPost(let userId, let title, let body):
            return "{'userId': '\(userId)', 'title': '\(title)', 'body': '\(body)'}".data(using: .utf8)!
        }
    }
    
    var task: Task {
        switch self {
        case .getPosts:
            return .requestPlain
        case .addPost(let userId, let title, let body):
            return .requestParameters(parameters:
                ["userId": userId,
                 "title": title,
                 "body": body], encoding: JSONEncoding.default)
        }
    }
    
    var headers: [String : String]? {
        return ["Content-Type": "application/json"]
    }
    
}
