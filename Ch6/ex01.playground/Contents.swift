import UIKit

// 6-1 if 구문 기본 구현
let first: Int = 5
let second: Int = 7

if first > second {
    print("first > second")
} else if first < second {
    print("first < second")
} else {
    print("first == second")
}
// first < second



// 6-2-1 if 구문의 다양한 구현(소괄호가 없는 코드)
let third: Int = 5
let fourth: Int = 5
var biggerValue: Int = 0

if third > fourth {         // 조건 수식을 소괄호로 묶어주는 것은 선택사항 입니다.
    biggerValue = third
} else if third == fourth {
    biggerValue = third
} else if third < fourth {
    biggerValue = fourth
} else if first == 5 {
    // 조건을 충족하더라도 위에서 조건이 충족하였기 때문에 실행되지 않습니다.
    biggerValue = 100
}
// 마지막 else는 생략 가능, 물론 else if도 생략 가능
// 즉 else나 else if 없이 if만 단독으로 사용할 수도 있음

print(biggerValue)



// 6-2-2 if 구문의 다양한 구현(소괄호가 있는 코드)

if (third > fourth) {         // 조건 수식을 소괄호로 묶어주는 것은 선택사항 입니다.
     biggerValue = third
 } else if (third == fourth) {
     biggerValue = third
 } else if (third < fourth) {
     biggerValue = fourth
 } else if (first == 5) {
     // 조건을 충족하더라도 위에서 조건이 충족하였기 때문에 실행되지 않습니다.
     biggerValue = 100
 }
