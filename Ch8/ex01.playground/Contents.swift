import UIKit


// 8-1 오류가 발생하는 nil 할당

/*
 var myName: String = "yagom"
myName = nil
*/

// 옵셔널 선언이 되지 않아서 nil 사용 불가



// 8-2 옵셔널 변수의 선언 및 nil 할당
var myName: String? = "yagom"
print(myName)   // yagom
/*
 옵셔널 타입의 값을 print 함수를 통해 출력하면 Optional("yagom")이라고 출력되는 것이 정상입니다.
 다만, 차후의 주석표현의 편의를 위하여 Optional()은 생략하고 값만 표기하도록 하겠습니다.
 또, 옵셔널 타입의 값을 print 함수의 매개변수로 전달하면 컴파일러 경고가 발생할 수 있습니다.
 정상이므로 놀라지 않아도 됩니다.
 */

myName = nil
print(myName)   // nil



// 8-4 switch를 통한 옵셔널 값의 확인
func checkOptionalValue(value optionalValue: Any?) {
    switch optionalValue {
    case .none:
        print("This Optional variable is nil")
    case .some(let value):
        print("Value is \(value)")
    }
}

myName = "yagom"
checkOptionalValue(value: myName)   // Value is yagom

myName = nil
checkOptionalValue(value: myName)   // This Optional variable is nil



// 8-5 switch를 통한 옵셔널 값의 확인
let numbers: [Int?] = [2, nil, -4, nil, 100]

for number in numbers {
    switch number {
    case .some(let value) where value < 0:
        print("Negative value!! \(value)")
    case .some(let value) where value > 10:
        print("Large value!! \(value)")
    case .some(let value):
        print("Value \(value)")
    case .none:
        print("nil")
    }
}

// Value 2
// nil
// Negative value!! -4
// nil
// Large value!! 100

