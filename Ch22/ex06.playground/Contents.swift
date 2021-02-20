import UIKit

protocol Container {
    associatedtype ItemType
    var count: Int { get }
    mutating func append(_ item: ItemType)
    subscript(i: Int) -> ItemType { get }
}

struct Stack<Element>: Container {
    // 기존 Stack<Element> 구조체 구현
    var items = [Element]()
    mutating func push(_ item: Element) {
        items.append(item)
    }
    mutating func pop() -> Element {
        return items.removeLast()
    }
    
    // Container 프로토콜 준수를 위한 구현
    var count: Int {
        return items.count
    }
    mutating func append(_ item: Element) {
        self.push(item)
    }
    subscript(i: Int) -> Element {
        return items[i]
    }
}

// MARK:- 이전 자료

// 22-21 Stack 구조체의 제네릭 서브스크립트 구현과 사용
extension Stack {
    subscript<Indices: Sequence>(indices: Indices) -> [Element] where Indices.Iterator.Element == Int {
        var result = [ItemType]()
        for index in indices {
            result.append(self[index])
        }
        return result
    }
}

var integerStack: Stack<Int> = Stack<Int>()
for i in 1...5 {
    integerStack.append(i)
}

print(integerStack[0...2])

