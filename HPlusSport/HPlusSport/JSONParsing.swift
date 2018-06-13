//
//  JSONParsing.swift
//  HPlusSport
//
//  Created by Alexey Danilov on 12.05.2018.
//  Copyright © 2018 danilovdev. All rights reserved.
//

import Foundation

protocol MyJSONDecodable {
    
    init(_ decoder: MyJSONDecoder) throws 
}

typealias JSONObject = [String: Any]

class MyJSONDecoder {
    
    let jsonObject: JSONObject
    
    init(_ jsonObject: JSONObject) {
        self.jsonObject = jsonObject
    }
}

func parse<T>(_ data: Data) throws -> [T]  where T: MyJSONDecodable {
    let jsonObjects: [JSONObject] =  try deserialize(data)
    return try jsonObjects.map(decode)
}

func deserialize(_ data: Data) throws -> [JSONObject] {
    let json = try JSONSerialization.jsonObject(with: data, options: [])
    guard let objects = json as? [JSONObject] else { return [] }
    return objects
}

func decode<T>(_ jsonObject: JSONObject) throws -> T where T: MyJSONDecodable {
    return try T.init(MyJSONDecoder(jsonObject))
}
