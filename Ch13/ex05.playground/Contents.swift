import UIKit

func makeIncrementer(forIncrement amount: Int) -> (() -> Int) {
    var runningTotal = 0
    func incrementer() -> Int {
        runningTotal += amount
        return runningTotal
    }
    return incrementer
}


// 13-15 참조 타입인 클로저
let incrementByTwo: (() -> Int) = makeIncrementer(forIncrement: 2)
let sameWithIncrementByTwo: (() -> Int) = incrementByTwo

let first: Int = incrementByTwo()   // 2
let second: Int = sameWithIncrementByTwo()  // 4
// 둘은 같은 클로저를 참조하기 떄문에 동일한 클로저의 변수를 가져옴
