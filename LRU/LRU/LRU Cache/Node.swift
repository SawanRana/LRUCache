//
//  Node.swift
//  LRU
//
//  Created by Sawan Rana on 14/08/25.
//

import Foundation
class Node<P: Payload> {
    var key: P.Key
    var value: P.Value
    var prev: Node?
    var next: Node?
    
    init(payload: P, prev: Node? = nil, next: Node? = nil) {
        self.key = payload.key
        self.value = payload.value
        self.prev = prev
        self.next = next
    }
}

extension Node: CustomStringConvertible {
    var description: String {
        guard let next = next else {
            return "\(value)"
        }
        return "\(value) -> \(next.description)"
    }
}
