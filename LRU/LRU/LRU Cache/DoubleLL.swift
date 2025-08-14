//
//  DoubleLL.swift
//  LRU
//
//  Created by Sawan Rana on 14/08/25.
//

import Foundation
struct DoubleLL<P: Payload> {
    
    private var head: Node<P>?
    private var tail: Node<P>?
    
    var isEmpty: Bool {
        return head == nil
    }
    
    mutating func addToHead(node: Node<P>) {
        let newNode = node
        
        guard !isEmpty else {
            head = newNode
            tail = head
            return
        }
        head?.prev = newNode
        newNode.next = head
        head = newNode
    }
    
    mutating func moveToFront(node: Node<P>) {
        //If key is exist at head then no need to update anything
        if node.key == head?.key {
            return
        }
        
        if node.key == tail?.key {
            removeFromLast()
            addToHead(node: node)
            return
        }
        
        let prevToNode = node.prev
        let nextToNode = node.next
        prevToNode?.next = nextToNode
        nextToNode?.prev = prevToNode
        
        addToHead(node: node)
    }
    
    @discardableResult
    mutating func removeFromLast() -> Node<P>? {
        let deletedNode = tail
        tail = tail?.prev
        tail?.next = nil
        
        return deletedNode
    }
    
    func description() {
        print("Double LL")
        print(String(describing: head))
    }
}
