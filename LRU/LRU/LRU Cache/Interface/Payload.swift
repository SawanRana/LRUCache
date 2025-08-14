//
//  Payload.swift
//  LRU
//
//  Created by Sawan Rana on 14/08/25.
//

import Foundation

protocol Payload {
    associatedtype Key: Hashable
    associatedtype Value
    
    var key: Key { get }
    var value: Value { get }
}

struct MyPayload: Payload {
    typealias Key = String
    typealias Value = Int
    let key: String
    let value: Int
}
