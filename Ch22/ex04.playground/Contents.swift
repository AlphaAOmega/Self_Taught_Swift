import UIKit

// 22-10 Dictionary 타입 정의
// public struct Dictionary<Key : Hashable, Value> : Collection, ExpressibleByDictionaryLiteral { /*...*/}



// 22-11 제네릭 타입 제약
func swapTwoValues<T: BinaryInteger>(_ a: inout T, _ b: inout T) {
    let temp: T = a
    a = b
    b = temp
}

struct Stack<Element: Hashable> {
    // 구조체 구현
}



// 22-12 제네릭 타입 제약 추가
func swapTwoValues<T: BinaryInteger>(_ a: inout T, _ B: inout T) where T: FloatingPoint {
    // 함수 구현
}



// 22-13 substractTwoValues 함수의 잘못된 구현
/*
func substractTwoValues<T>(_ a: T, _ b: T) -> T {
    return a - b
}
*/
// 뺄셈을 하려면 뺄셈 연산자를 사용할 수 있는 타입이어야 연산이 가능함



// 22-14 substractTwoValues 함수의 구현
func substractTwoValues<T: BinaryInteger>(_ a: T, _ b: T) -> T {
    return a - b
}



// 22-15 makeDictionaryWithTwoValue 함수의 구현
func makeDictionaryWithTwoValue<Key: Hashable, Value>(key: Key, value: Value) -> Dictionary<Key, Value> {
    let dictionary: Dictionary<Key, Value> = [key:value]
    return dictionary
}
