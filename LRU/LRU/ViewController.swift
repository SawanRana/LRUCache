//
//  ViewController.swift
//  LRU
//
//  Created by Sawan Rana on 06/08/25.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let myPayload1 = MyPayload(key: "1", value: 1)
        let myPayload2 = MyPayload(key: "2", value: 2)
        let myPayload3 = MyPayload(key: "3", value: 3)
        let myPayload4 = MyPayload(key: "4", value: 4)
        
//        let node1 = Node(payload: myPayload1, prev: nil)
//        let node2 = Node(payload: myPayload2, prev: node1)
//        let node3 = Node(payload: myPayload3, prev: node2)
//        let node4 = Node(payload: myPayload4, prev: node3)
//        node1.next = node2
//        node2.next = node3
//        node3.next = node4
//        print(node1)
        
//        var dll = DoubleLL<MyPayload>()
//        dll.addToHead(payload: MyPayload(key: "one", value: 1))
//        dll.addToHead(payload: MyPayload(key: "two", value: 2))
//        dll.description()
        
        let lruCache = LRUCache<MyPayload>(capacity: 4)
        lruCache.put(payload: myPayload1)
        lruCache.put(payload: myPayload2)
        lruCache.put(payload: myPayload3)
        lruCache.put(payload: myPayload1)
        lruCache.put(payload: myPayload3)
        lruCache.put(payload: myPayload4)
        lruCache.put(payload: MyPayload(key: "5", value: 5))
        lruCache.put(payload: myPayload1)
        
        let key = "7"
        if let value = lruCache.get(key) {
            print("For key: \(key) value is \(value)")
        } else {
            print("Cache miss")
        }
    }
}



