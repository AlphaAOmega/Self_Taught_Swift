import UIKit

// 22-7 제네릭을 사용하지 않은 IntStack 구조체 타입
struct IntStack {
    var items = [Int]()
    mutating func push(_ item: Int) {
        items.append(item)
    }
    mutating func pop() -> Int {
        return items.removeLast()
    }
}

var integerStack: IntStack = IntStack()

integerStack.push(3)
print(integerStack.items)

integerStack.push(2)
print(integerStack.items)

integerStack.push(3)
print(integerStack.items)

integerStack.push(5)
print(integerStack.items)

integerStack.pop()
print(integerStack.items)

integerStack.pop()
print(integerStack.items)

integerStack.pop()
print(integerStack.items)

integerStack.pop()
print(integerStack.items)



// 22-8 제네릭을 사용한 Stack 구조체 타입
struct Stack<Element> {
    var items = [Element]()
    mutating func push(_ item: Element) {
        items.append(item)
    }
    mutating func pop() -> Element {
        return items.removeLast()
    }
}

var doubleStack: Stack<Double> = Stack<Double>()

doubleStack.push(1.0)
print(doubleStack.items)
doubleStack.push(2.0)
print(doubleStack.items)
doubleStack.pop()
print(doubleStack.items)

var stringStack: Stack<String> = Stack<String>()

stringStack.push("1")
print(stringStack.items)
stringStack.push("2")
print(stringStack.items)
stringStack.pop()
print(stringStack.items)

var anyStack: Stack<Any> = Stack<Any>()

anyStack.push(1.0)
print(anyStack.items)
anyStack.push("2")
print(anyStack.items)
anyStack.push(3)
print(anyStack.items)
anyStack.pop()
print(anyStack.items)
