import UIKit

// 5-1 삼항 조건 연산자의 사용
var valueA: Int = 3
var valueB: Int = 5
var biggerValue: Int = valueA > valueB ? valueA : valueB    // 5

valueA = 0
valueB = -3
biggerValue = valueA > valueB ? valueA : valueB    // 0

var stringA: String = ""
var stringB: String = "String"
var resultValue: Double = stringA.isEmpty ? 1.0 : 0.0    // 1.0
resultValue = stringB.isEmpty ? 1.0 : 0.0   // 0.0



// 5-2 오버플로 연산자의 사용
var unsignedInteger: UInt8 = 0
// let errorUnderflowResult: UInt8 = unsignedInteger - 1   // 런타임 오류
let underflowValue: UInt8 = unsignedInteger &- 1

var Integer: Int8 = Int8.max
let overflowValue: Int8 = Integer &+ 1

