import UIKit

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
doubleStack.push(2.0)
doubleStack.pop()

var stringStack: Stack<String> = Stack<String>()
stringStack.push("1")
stringStack.push("2")
stringStack.pop()

var anyStack: Stack<Any> = Stack<Any>()
anyStack.push(1.0)
anyStack.push("2")
anyStack.push(3)
anyStack.pop()
// MARK:- 이전자료

// 22-9 익스텐션을 통한 제네릭 타입의 기능 추가
extension Stack {
    var topElement: Element? {
        return self.items.last
    }
}

print(doubleStack.topElement)
print(stringStack.topElement)
print(anyStack.topElement)

