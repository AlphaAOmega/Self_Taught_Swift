import UIKit

// 25-1 와일드카드 패턴의 사용
let string: String = "ABC"

switch string {
// ABC -> 어떤 값이 와도 상관없기에 항상 실행합니다.
case _: print(string)
}

let optionalString:String? = "ABC"

switch optionalString {
// optionalString이 Optional("ANC")일 떄만 실행됩니다.
case "ABC"?: print(optionalString)
    
// optionalString이 Optional("ABC") 외의 값이 있을 때만 실행됩니다.
case _?: print("Has value, bu not ABC")
    
// 값이 없을 때 실행됩니다.
case nil: print("nil")
}   // Optional("ABC")

let yagom = ("yagom", 99, "Male")

switch yagom {
// 첫번째 요소가 "yagom" 일 때만 실행됩니다.
case ("yagom", _, _): print("Hello yagom!!!")
    
// 그 외에 언제든지 실행됩니다.
case (_, _, _): print("Who cares~")
}   // Hello yagom!!!

for _ in 0..<2 {
    print("Hello")
}

// Hello
// Hello
