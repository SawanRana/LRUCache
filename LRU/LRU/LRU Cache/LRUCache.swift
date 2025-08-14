//
//  LRUCache.swift
//  LRU
//
//  Created by Sawan Rana on 14/08/25.
//

import Foundation
class LRUCache<P: Payload> {
  
    private let capacity: Int
    private var doubleLL = DoubleLL<P>()
    
    private var cacheDictionary: [P.Key: Node<P>] = [:]
    
    init(capacity: Int) {
        self.capacity = capacity
    }
    
    func put(payload: P) {
        if cacheDictionary.count == capacity {
            //make capacity, remove least recently used
            if let node = doubleLL.removeFromLast() {
                cacheDictionary.removeValue(forKey: node.key)
            }
        }
        
        //We have capacity to put new payload
        if let node = cacheDictionary[payload.key] {
            //If node exist move it to front
            doubleLL.moveToFront(node: node)
        } else {
            let node = Node(payload: payload)
            cacheDictionary[payload.key] = node
            doubleLL.addToHead(node: node)
        }
        
        print(doubleLL.description())
    }
    
    func get(_ key: P.Key) -> P.Value? {
        if let nodeExist = cacheDictionary[key] {
            //If node exist move it to front
            doubleLL.moveToFront(node: nodeExist)
            print("Get \(key) exist, marking it as 'recently used'")
            print(doubleLL.description())
            return nodeExist.value
        }
        return nil
    }
}
