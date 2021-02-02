import UIKit

// 3-1 Int와 UInt

var integer: Int = -100
let unsignedInteger: UInt = 50
print("integer 값: \(integer), unsignedInteger 값 : \(unsignedInteger)")
print("Int 최댓값: \(Int.max), Int 최솟값: \(Int.min)")
print("UInt 최댓값: \(UInt.max), UInt 최솟값: \(UInt.min)")
let largeInteger: Int64 = Int64.max
let smallUnsignedInteger: UInt8 = UInt8.max
print("Int64 최댓값: \(largeInteger), UInt8 최댓값: \(smallUnsignedInteger)")

/*
let tooLarge: Int = Int.max + 1 - 최댓값을 초과할 수 없습니다.
let cannotBeNegetive: UInt = -5 - UInt에는 음수가 올 수 없습니다.

integer = unsignedInteger - Swift에서 UInt 와 Int는 다른 타입입니다.
 */

integer = Int(unsignedInteger)




// 3-2 진수별 정수 표현
let decimalInteger: Int = 28
let binaryInteger: Int = 0b11100
let octalInteger: Int = 0o34
let hexadecimalInteger: Int = 0x1C

