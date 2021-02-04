import UIKit

// 5-10 사용자 정의 후위 연산자 정의와 함수 구현

postfix operator **

postfix func ** (value: Int) -> Int {
    return value + 10
}

let five: Int = 5
let fivePlusTen: Int = five**

print(fivePlusTen)



// 5-11 전위 연산자와 후위 연산자 동시 사용

prefix operator **

prefix func ** (value: Int) -> Int {
    return value * value
}

let sqrtFivePlusTen = **five**

print(sqrtFivePlusTen)  // (5 + 10) * (5 + 10) == 225
// 사용자 정의 연산자를 전위, 후위 동시 사용 시 후위 연산자부터 연산

