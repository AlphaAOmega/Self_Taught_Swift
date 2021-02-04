import UIKit

// 7-1 기본 형태의 함수 정의와 사용
func hello(name: String) -> String {
    return "Hello \(name)!"
}

let helloJenny: String = hello(name: "Jenny")
print(helloJenny)   // Hello Jenny!

func introduce(name: String) -> String {
    // return "제 이름은 " + name + "입니다." 과 같은 동작을 합니다.
    "제 이름은 " + name + "입니다."
}

let introduceJenny: String = introduce(name: "Jenny")
print(introduceJenny)   // 제 이름은 Jenny입니다.



// 7-2 매개변수가 없는 함수 정의와 사용
func helloWorld() -> String {
    return "Hello, World!"
}

print(helloWorld())    // Hello, World!



// 7-3 매개변수가 여러 개인 함수의 정의와 사용
func sayHello(myName: String, yourName: String) -> String {
    return "Hello \(yourName)! I'm \(myName)."
}

print(sayHello(myName: "Donghoon", yourName: "yagom"))  // Hello yagom! I'm Donghoon.



// 7-4 매개변수 이름과 전달인자 레이블을 가지는 함수 정의와 사용
// from 과 to가 전달인자 레이블이 된다.(레이블을 지정하면 함수를 호출할 때 매개변수의 이름으로 불가)
func sayHello(from myName: String, to yourName: String) -> String {
    return "Hello \(yourName)! I'm \(myName)."
}

print(sayHello(from: "Donghoon", to: "yagom"))    // Hello yagom! I'm Donghoon.



// 7-5 전달인자 레이블이 없는 함수 정의와 사용
// 7-7 매개변수 기본값이 있는 함수의 정의와 사용
func sayHello(_ name: String, _ times: Int = 3) -> String {
    var result: String = ""
    for _ in 0..<times {
        result += "Hello \(name)! "
    }
    return result
}

// 매개변수 기본 값이 3이기 때문에 매개변수를 넘겨주지 않아도 3번 출력됨
print(sayHello("Chope"))        // Hello Chope! Hello Chope! Hello Chope!
print(sayHello("Chope", 2))    // Hello Chope! Hello Chope!



// 7-6 전달인자 레이블 변경을 통한 함수 중복 정의
// 전달인자 레이블을 변경하면 함수의 이름 자체가 변경된다(레이블 이름만 다르면 중복 정의(overload)가 가능하다)
func sayHello (to name: String, _ times: Int) -> String {
    var result: String = ""
    
    for _ in 0..<times {
        result += "Hello \(name)! "
    }
    
    return result
}

func sayHello (to name: String, repeatCount times: Int) -> String {
    var result: String = ""
    
    for _ in 0..<times {
        result += "Hello \(name)! "
    }
    
    return result
}

print(sayHello(to: "yagom", 2))                 // Hello yagom! Hello yagom!
print(sayHello(to: "yagom", repeatCount: 2))    // Hello yagom! Hello yagom!
