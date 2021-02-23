import UIKit

// 29-1 코드를 통해 메모리에 접근하는 유형
// one이 저장될 메모리 위치에 쓰기 접근
var one: Int = 1

// one이 저장된 메모리 위치에 읽기 접근
print("숫자 출력: \(one)")



// 29-2 순차적, 순간적 메모리 접근
func oneMore(than number: Int) -> Int {
    return number + 1
}

var myNumber: Int = 1
myNumber = oneMore(than: myNumber)
print(myNumber) // 2

