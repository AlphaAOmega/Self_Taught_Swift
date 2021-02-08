import UIKit

// 13-11 makeIncrementer(forIncrement:) 함수
func makeIncrementer(forIncrement amount: Int) -> (() -> Int) {
    var runningTotal = 0
    func incrementer() -> Int {
        runningTotal += amount
        return runningTotal
    }
    return incrementer
}

// makeIncrementer 함수의 반환 타입은 () -> Int 이는 함수객체를 반환한다는 의미



// 13-13 incrementByTwo 상수에 함수 할당
let incrementByTwo: (() -> Int) = makeIncrementer(forIncrement: 2)

let first: Int = incrementByTwo()   // 2
let second: Int = incrementByTwo()  // 4
let third: Int = incrementByTwo()   // 6



// 13-14 각각의 incrementer의 동작
let incrementByTwo2: (() -> Int) = makeIncrementer(forIncrement: 2)
let incrementByTen: (() -> Int) = makeIncrementer(forIncrement: 10)

let first1: Int = incrementByTwo()    // 8
let second1: Int = incrementByTwo()   // 10
let third1: Int = incrementByTwo()    // 12

let first2: Int = incrementByTwo2()   // 2
let second2: Int = incrementByTwo2()  // 4
let thrid2: Int = incrementByTwo2()   // 6

let ten: Int = incrementByTen()       // 10
let twenty: Int = incrementByTen()    // 20
let thirty: Int = incrementByTen()    // 30

// 각각의 함수는 자신만의 변수를 갖고 카운트하게 됨(다른 함수의 영향을 받지 않음)
// runningTotal 의 참조를 미리 획득했기 때문에



