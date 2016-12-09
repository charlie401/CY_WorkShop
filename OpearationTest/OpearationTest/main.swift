//
//  main.swift
//  OpearationTest
//
//  Created by chongyang on 16/11/25.
//  Copyright © 2016年 Chongyang. All rights reserved.
//

import Foundation

/* NSBlockOperation中的ExecutionBlocks并没有执行顺序，其内部是并发的。
 NSOperationQueue可以将maxConcurrentOperationCount设置为1来控制其串行
 行执，其执行顺序就是opearations的顺序。虽然NSOperationQueue类设计用
 于并发执行Operations,你也可以强制单个queue一次只能执行一个Operation。
 setMaxConcurrentOperationCount:方法可以配置queue的最大并发操作数量。
 设为1就表示queue每次只能执行一个操作。不过operation执行的顺序仍然依赖于
 其它因素,比如operation是否准备好和operation的优先级等。
 因此串行化的operation queue并不等同于GCD中的串行dispatch queue
 */
func testOpearationAsyncFunc(){

    let queue = NSOperationQueue()
    
    queue.maxConcurrentOperationCount = 1
    for j in 0...5 {
        
//        let lock = NSConditionLock(condition: 0)
//        lock.
        let opearation = NSBlockOperation()
//        opearation.start()
        for i in 6...9{
            
            opearation.addExecutionBlock({
                
                NSLog("第%ld个opearation 第%ld次 - %@", j, i,  NSThread.currentThread())
                
            })
//            opearation.asynchronous
//            opearation.
        }
        queue.addOperation(opearation)
    }
    
    queue.waitUntilAllOperationsAreFinished()
}

testOpearationAsyncFunc()
//print("Hello, World!")

