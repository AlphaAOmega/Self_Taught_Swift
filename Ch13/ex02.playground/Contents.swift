import UIKit

let names: [String] = ["wizplan", "eric", "yagom", "jenny"]

// 13-5 후행 클로저 표현
// 후행 클로저의 사용
let reversed: [String] = names.sorted() { (first: String, second: String) -> Bool in
    return first > second
}

// sorted(by:) 메서드의 소괄호까지 생략 가능합니다.
let reversed0: [String] = names.sorted { (first: String, second: String) -> Bool in
    return first > second
}


func doSomething(do: (String) -> Void,
                 onSuccess: (Any) -> Void,
                 onFailure: (Error) -> Void) {
    // do Something...
}

// 다중 후행 클로저의 사용
doSomething{ (someString: String) in
    // do closure
} onSuccess: { (result: Any) in
    // success closure
} onFailure: { (error: Error) in
    // failure closure
}
