import UIKit

// 6-17 while 반복 구문의 사용

var names: [String] = ["Joker", "Jenny", "Nova", "yagom"]
while names.isEmpty == false {
    print("Goodbye \(names.removeFirst())")
}   // removeFirst는 요소를 삭제함과 동시에 반환한다.
// Goodbye Joker
// ...
// Goodbye yagom



// 6-18 repeat-while 반복 구문의 사용
names = ["Joker", "Jenny", "Nova", "yagom"]

repeat {
    print("Goodbye \(names.removeFirst())")
} while names.isEmpty == false
// 조건이 참이 아니더라도 최초 1회는 무조건 실행
// Goodbye Joker
// ...
// Goodbye yagom

