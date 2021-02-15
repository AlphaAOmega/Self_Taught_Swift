import UIKit

// 16-1 addThree 함수
func addThree(_ num: Int) -> Int {
    return num + 3
}



// 16-2 일반 값을 연산할 수 있는 addThree 함수
addThree(2) // 5

// 16-3 옵셔널을 연산할 수 없는 addThree 함수
//addThree(Optional(2))
// 순수한 값이 아닌 컨텍스트로 둘러싸여서 전달되었기 때문에 오류 발생

// 16-4 맵 메서드를 사용하여 옵셔널을 연산할 수 있는 addThree(_:) 함수
Optional(2).map(addThree)   // Optional(5)

// 16-5 옵셔널에 맵 메서드와 클로저의 사용
var value: Int? = 2
value.map{ $0 + 3 } // Optional(5)
value = nil
value.map{ $0 + 3 } // nil

// 16-6 옵셔널의 map 메서드 구현
extension Optional {
    func map<U>(f: (Wrapped) -> U) -> U? {
        switch self {
        case .some(let x): return f(x)
        case .none: return .none
        }
    }
}
