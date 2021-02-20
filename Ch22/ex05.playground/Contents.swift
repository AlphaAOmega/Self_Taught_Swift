import UIKit


// 22-16 Container 프로토콜 정의
protocol Container {
    associatedtype ItemType
    var count: Int { get }
    mutating func append(_ item: ItemType)
    subscript(i: Int) -> ItemType { get }
}



// 22-17 MyContainer 클래스 정의
class MyContainer: Container {
    var items: Array<Int> = [Int]()
    
    var count: Int {
        return items.count
    }
    
    func append(_ item: Int) {
        items.append(item)
    }
    
    subscript(i: Int) -> Int {
        return items[i]
    }
}



// 22-18 IntStack 구조체의 Container 프로토콜 준수
struct IntStack: Container {
    // 기존 IntStack 구조체 구현
    var items: [Int] = [Int]()
    mutating func push(_ item: Int) {
        items.append(item)
    }
    mutating func pop() -> Int {
        return items.removeLast()
    }
    
    // Container 프로토콜 준수를 위한 구현
    var count: Int {
        return items.count
    }
    mutating func append(_ item: Int) {
        self.push(item)
    }
    subscript(i: Int) -> Int {
        return items[i]
    }
}



// 22-19 IntStack 구조체의 typealias 사용
struct IntStack0: Container {
    typealias ItemType = Int
    
    // 기존 IntStack 구조체 구현
    var items = [ItemType]()
    mutating func push(_ item: ItemType) {
        items.append(item)
    }
    mutating func pop() -> ItemType {
        return items.removeLast()
    }
    
    // Container 프로토콜 준수를 위한 구현
    var count: ItemType {
        return items.count
    }
    mutating func append(_ item: ItemType) {
        self.push(item)
    }
    subscript(i: ItemType) -> ItemType {
        return items[i]
    }
}



// 22-20 Stack 구조체의 Container 프로토콜 준수
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
