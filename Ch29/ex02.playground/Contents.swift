import UIKit

// 29-3 입출력 매개변수에서의 메모리 접근 충돌
var step: Int = 1

func increment(_ number: inout Int) {
    number += step
}

// increment(&step)    // 오류 발생!
// step 변수는 입출력 매개변수로 전달되었는데, 함수 내부에서 읽기 접근을 시도해서 동시에 접근 - 충돌 발생



// 29-4 입출력 매개변수에서의 메모리 접근 충독 해결
var copyOfStep: Int = 1

func increment(num: inout Int) {
    num += copyOfStep
}

increment(num: &step)



// 29-5 복수의 입출력 매개변수로 하나의 변수를 전달하여 메모리 접근 충돌
func balance(_ x: inout Int, _ y: inout Int) {
    let sum = x + y
    x = sum / 2
    y = sum - x
}
var playerOneScore: Int = 42
var playerTwoScore: Int = 30
balance(&playerOneScore, &playerTwoScore)    // 문제 없음
//balance(&playerOneScore, &playerOneScore)    // 오류 발생!
