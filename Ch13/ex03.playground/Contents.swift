import UIKit

let names: [String] = ["wizplan", "eric", "yagom", "jenny"]

// 13-6 클로저의 타입 유추
// 클로처의 매개변수 타입과 반환 타입을 생략하여 표현할 수 있습니다.
let reversed: [String] = names.sorted{ (first, second) in
    return first > second
}



// 13-7 단축 인자 이름 사용
// 단축 인자 이름을 사용한 표현
let reversed0: [String] = names.sorted {
    return $0 > $1
}



// 13-8 암시적 반환 표현 사용
// 암시적 반환 표현의 사용 - 내부 실행문이 단 한줄이라면 return 생략 가능
let reversed1: [String] = names.sorted { $0 > $1 }


print(reversed)
print(reversed0)
print(reversed1)



// 13-9 > 연산자 정의
// public func ><T : Comparable>(lhs: T, rhs: T) -> Bool



// 13-10 클로저로서의 연산자 함수 사용
// 연산자 함수를 클로저의 역할로 사용
let reversed2: [String] = names.sorted(by: >)

