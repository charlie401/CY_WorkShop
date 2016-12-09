//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
//floor(1.2)
//ceil(1.2)

//let num = 1
//let temp = num << 30//~num &+ 100
//debugPrint(temp)
func resolveValueWithDivisor(divisor:Double,dividend:Double = 10000) -> (remainder:Double,mulriple:Int64) {
    var remainder = divisor
    var times = 0
    while remainder > dividend {
        remainder /= dividend
        times += 1
    }
    let mulriple = Int64(pow(Double(dividend), Double(times)))
    return (remainder,mulriple)
}
resolveValueWithDivisor(1234)