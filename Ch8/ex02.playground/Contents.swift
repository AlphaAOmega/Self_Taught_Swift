import UIKit

// 8-6 옵셔널 값의 강제 추출
var myName: String? = "yagom"

// 옵셔널이 아니니 변수에는 옵셔널 값이 들어갈 수 없습니다. 추출해서 할당해주어야 합니다.
var yagom: String = myName!

myName = nil
// yagom = myName   // 런타임 오류!

// if 구문 등 조건문을 이용해서 조금 더 안전하게 처리해볼 수 있습니다.
if myName != nil {
    print("My name is \(myName!)")
} else {
    print("myName == nil")
}
// myName == nil



// 8-7 옵셔널 바인딩을 사용한 옵셔널 값의 추출
myName = "yagom"

// 옵셔널 바인딩을 통한 임시 상수 할당
if let name = myName {
    print("My name is \(name)")
} else {
    print("myName == nil")
}
// My name is yagom

// 옵셔널 바인딩을 통한 임시 변수 할당
if var name = myName {
    name = "wizplan"    // 변수이므로 내부에서 변경이 가능합니다.
    print("My name is \(name)")
} else {
    print("myName == nil")
}
// My name is wizplan



// 8-8 옵셔널 바인딩을 사용한 여러 개의 옵셔널 값의 추출
var yourName: String? = nil

// friend에 바인딩이 되지 않으므로 실행되지 않습니다.
if let name = myName, let  friend = yourName{
    print("We are friend! \(name) & \(friend)")
}

yourName = "eric"

if let name = myName, let friend = yourName {
    print("We are friend! \(name) & \(friend)")
}
// We are friend! yagom & eric



// 8-9 암시적 추출 옵셔널의 사용
var myName0: String! = "yagom"
print(myName0)   // yagom
myName0 = nil

// 암시적 추출 옵셔널도 옵셔널이므로 당연히 바인딩을 사용할 수 있습니다.
if let name = myName0 {
    print("My name is \(name)")
} else {
    print("myName0 == nil")
}
// myName0 == nil

// myName.isEmpty  // 오류 !!

// 옵셔널 사용 시 강제 추출 또는 암시적 추출을 사용하기 보다는
// 바인딩, nil 병합 연산자를 비롯한 옵셔널 체이닝을 사용하는 편이 훨씬 안전하다.
