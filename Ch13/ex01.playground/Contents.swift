import UIKit

// 13-1 스위프트 라이브러리의 sorted(by:) 메서드 정의
// public func sorted(by areInIncreasingOrder: (Element, Element) -> Bool) -> [Element]



// 13-2 정렬에 사용될 이름 배열
let names: [String] = ["wizplan", "eric", "yagom", "jenny"]



// 13-3 정렬을 위한 함수 전달
func backwards(first: String, second: String) -> Bool {
    print("\(first) \(second) 비교중")
    return first > second
}

var reversed: [String] = names.sorted(by: backwards)
print(reversed) // ["yagom", "wizplan", "jenny", "eric"]



// 클로저의 통상 표현 형식
/*
 { (매개변수들) -> 반환 타입 in
    실행코드
 }
*/



// 13-4 sorted(by:) 메서드에 클로저 전달
// backwards(first:second:) 함수 대신에 sorted(by:) 메서드의 전달인자로 클로저를 직접 전달합니다.
reversed = names.sorted(by: { (first: String, second: String) -> Bool in
    return first > second
})
print(reversed) // ["yagom", "wizplan", "jenny", "eric"]
