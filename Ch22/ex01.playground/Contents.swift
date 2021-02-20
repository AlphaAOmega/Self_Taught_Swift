import UIKit

// 22-1 제네릭, 프로토콜, 서브스크립트 등 다양한 기능으로 구현된 Array 타입 선언부
/*
public struct Array<Element> : RandomAccessCollection, MutableCollection {
    public typealias Index = Int
    public typealias Iterator = IndexingIterator<[Element]>
    // 중략...
    public var startIndex: Int { get }
    public var endIndex: Int { get }
    // 중략...
    public subscript(index: Int) -> Element
    public subscript(bounds: Range<Int>) -> ArraySlice<Element>
    // 중략...
    public mutating func popLast() -> Element?
    // 중략...
    public func map<T>(_ transForm: (Element) throws -> T) rethrows -> [T]
    // 중략...
    public var last: Element? { get }
    // 중략...
    public func reduce<Result>(_ initialResult: Result, _ nextPartialResult: (Result, Element) throws -> Result) rethrows -> Result
}
*/



// 22-2 프로토콜과 제네릭을 이용한 저누이 연산자 구현과 사용
prefix operator **

prefix func ** <T: BinaryInteger> (value: T) -> T {
    return value * value
}

let minusFive: Int = -5
let five: UInt = 5

let sqrtMinusFive = **minusFive
let sqrtFive: UInt = **five

print(sqrtMinusFive)
print(sqrtFive)



// 22-3 제네릭을 사용하지 않은 swapTwoInts(_:_:) 함수
func swapTwoInts(_ a: inout Int, _ b: inout Int) {
    let temp: Int = a
    a = b
    b = temp
}

var numberOne: Int = 5
var numberTwo: Int = 10

swapTwoInts(&numberOne, &numberTwo)
print("\(numberOne), \(numberTwo)")



// 22-4 제네릭을 사용하지 않은 swapTwoStrings(_:_:) 함수
func swapTwoStrings(_ a: inout String, _ b: inout String) {
    let temp: String = a
    a = b
    b = temp
}

var stringOne: String = "A"
var stringTwo: String = "B"

swapTwoStrings(&stringOne, &stringTwo)

print("\(stringOne), \(stringTwo)")



// 22-5 제네릭을 사용하지 않은 swapTwoValues(_:_:) 함수
func swapTwoValues(_ a: inout Any, _ b: inout Any) {
    let temp: Any = a
    a = b
    b = temp
}

var anyOne: Any = 1
var anyTwo: Any = "Two"

swapTwoValues(&anyOne, &anyTwo)
print("\(anyOne), \(anyTwo)")

anyOne = stringOne
anyTwo = stringTwo

swapTwoValues(&anyOne, &anyTwo)
print("\(anyOne), \(anyTwo)")
print("\(stringOne), \(stringTwo)")

//swapTwoValues(&stringOne, &stringTwo)     오류 발생! Any 외 다른 타입의 전달인자 전달 불가



// 22-6 제네릭을 사용한 swapTwoValues(_:_:) 함수
func swapTwoValues<T>(_ a: inout T, _ b: inout T) {
    let temp: T = a
    a = b
    b = temp
}

swapTwoValues(&numberOne, &numberTwo)
print("\(numberOne), \(numberTwo)")

swapTwoValues(&stringOne, &stringTwo)
print("\(stringOne), \(stringTwo)")

swapTwoValues(&anyOne, &anyTwo)
print("\(anyOne), \(anyTwo)")

//swapTwoValues(&numberTwo, &stringOne)     오류 발생! 같은 타입끼리만 교환 가능
