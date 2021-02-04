import UIKit

// 7-8 가변 매개변수를 가지는 함수의 정의와 사용

// 여기서 String... 은 0개 이상(0개 포함)의 값을 받아올 수 있다는 뜻
func sayHelloToFriends(me: String, friends names: String...) -> String {
    var result: String = ""
    
    for friend in names {
        result += "Hello \(friend)! "
    }
    
    result += "I'm " + me + "!"
    
    return result
}

print(sayHelloToFriends(me: "Donghoon", friends: "Minsu", "Jenny", "Wizplan"))
// Hello Minsu! Hello Jenny! Hello Wizplan! I'm Donghoon!

print(sayHelloToFriends(me: "Donghoon"))    // I'm Donghoon!



// 7-9 inout 매개변수의 활용
var numbers: [Int] = [1, 2, 3]

func nonReferenceParameter(_ arr: [Int]) {
    var copiedArr: [Int] = arr
    copiedArr[1] = 1
}

// 입출력 매개변수는 매개변수 기본값을 가질 수 없으며, 가변 매개변수로 사용할 수 없습니다.
func referenceParameter(_ arr: inout [Int]) {
    arr[1] = 1
}

nonReferenceParameter(numbers)
print(numbers[1])   // 2

referenceParameter(&numbers)    // 참조를 표현하기 위해 &를 붙입니다.(포인터와 비슷한 느낌 - 하지만 다름)
print(numbers[1])   // 1



// 7-10 반환 값이 없는 함수의 정의와 사용
func sayHelloWorld() {
    print("Hello, world!")
}
sayHelloWorld() // Hello, world!

func sayHello(from myName: String, to name: String) {
    print("Hello \(name)! I'm \(myName).")
}
sayHello(from: "yagom", to: "Mijeong")  // Hello Mijeong! I'm yagom.

func sayGoodbye() -> Void { // void를 명시해주어도 상관없습니다.
    print("Good bye")
}
sayGoodbye()    // Good bye



// 7-11 함수 타입의 사용
typealias CalculateTwoInts = (Int, Int) -> Int

func addTwoInts (_ a: Int, _ b: Int) -> Int {
    return a + b
}

func multiplyTwoInts (_ a: Int, _ b: Int) -> Int {
    return a * b
}

// var mathFunction: (Int, Int) -> Int = addTwoInts 와 같은 표현입니다.
var mathFunction: CalculateTwoInts = addTwoInts
print(mathFunction(2, 5))   // 7

mathFunction = multiplyTwoInts
print(mathFunction(2, 5))   // 10



// 7-12 전달인자로 함수를 전달받는 함수
func printMathResult(_ mathFunction: CalculateTwoInts, _ a: Int, _ b: Int) {
    print("Result: \(mathFunction(a, b))")
}

printMathResult(addTwoInts, 2, 5)   // Result: 7
// 전달인자 레이블은 함수타입의 구성요소가 아니므로 함수 타입 작성 시 전달인자 레이블 사용 불가

// var mathFunction: (a: Int, b: Int) -> Int    // 오류
// var mathFunction: (_ lhs: Int, _ rhs: Int) -> Int    // OK
// var mathFunction: (Int, Int) -> Int    // OK
