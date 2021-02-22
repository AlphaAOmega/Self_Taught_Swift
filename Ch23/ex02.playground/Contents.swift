import UIKit

protocol SelfPrintable {
    func printSelf()
}

extension SelfPrintable where Self: Container {
    func printSelf() {
        print(items)
    }
}

protocol Container: SelfPrintable {
    associatedtype ItemType
    
    var items: [ItemType] { get set }
    var count: Int { get }
    
    mutating func append(item: ItemType)
    subscript(i: Int) -> ItemType { get }
}

extension Container {
    mutating func append(item: ItemType) {
        items.append(item)
    }
    
    var count: Int {
        return items.count
    }
    
    subscript(i: Int) -> ItemType {
        return items[i]
    }
}

protocol Popable: Container {
    mutating func pop() -> ItemType?
    mutating func push(_ item: ItemType)
}

extension Popable {
    mutating func pop() -> ItemType? {
        return items.removeLast()
    }
    
    mutating func push(_ item: ItemType) {
        self.append(item: item)
    }
}

protocol Insertable: Container {
    mutating func delete() -> ItemType?
    mutating func insert(_ item: ItemType)
}

extension Insertable {
    mutating func delete() -> ItemType? {
        return items.removeFirst()
    }
    
    mutating func insert(_ item: ItemType) {
        self.append(item: item)
    }
}

struct Stack<Element>: Popable {
    var items: [Element] = [Element]()
    
    // 23-6 Stack 구조체 맵
    func map<T>(transform: (Element) -> T) -> Stack<T> {
        var transformedStack: Stack<T> = Stack<T>()
        
        for item in items {
            transformedStack.items.append(transform(item))
        }
        
        return transformedStack
    }
    
    // 23-8 Stack 구조체 필터
    func filter(includeElement: (Element) -> Bool) -> Stack<Element> {
        var filterdStack: Stack<ItemType> = Stack<ItemType>()
        
        for item in items {
            if includeElement(item) {
                filterdStack.items.append(item)
            }
        }
        
        return filterdStack
    }
    
    // 23-10 Stack 구조체 리듀스
    func reduce<T>(_ initialResult: T, nextPartialResult: (T, Element) -> T) -> T {
        var result: T = initialResult
        
        for item in items {
            result = nextPartialResult(result, item)
        }
        
        return result
    }
}

struct Queue<Element>: Insertable {
    var items: [Element] = [Element]()
}

var myIntStack: Stack<Int> = Stack<Int>()
var myStringStack: Stack<String> = Stack<String>()
var myIntQueue: Queue<Int> = Queue<Int>()
var myStringQueue: Queue<String> = Queue<String>()

// MARK:- 이전 자료

// 23-5 Array 타입의 맵 사용
let items: Array<Int> = [1, 2, 3]

let mappedItems: Array<Int> = items.map { (item: Int) -> Int in
    return item * 10
}

print(mappedItems)  // [10, 20, 30]



// 23-6 Stack 구조체 구현부 외부
myIntStack.push(1)
myIntStack.push(5)
myIntStack.push(2)
myIntStack.printSelf()
var myStrStack: Stack<String> = myIntStack.map{ "\($0)" }
myStrStack.printSelf()



// 23-7 Array 타입의 필터 사용
let filteredItems: Array<Int> = items.filter { $0 % 2 == 0 }

print(filteredItems)



// 23-8 Stack 구조체의 필터 메서드
let filteredStack: Stack<Int> = myIntStack.filter{ $0 < 5 }

filteredStack.printSelf()   // [1, 2]



// 23-9 Array 타입의 리듀스 사용
let combinedItems: Int = items.reduce(0) { $0 + $1 }
print(combinedItems)    // 6

let combinedItemsDoubled: Double = items.reduce(0.0) { $0 + Double($1) }
print(combinedItemsDoubled) // 6.0

let combinedItemsString: String = items.reduce("") { $0 + "\($1)" }
print(combinedItemsString)  // 123



// 23-10 Stack 구조체의 리듀스 메서드
let combinedInt: Int = myIntStack.reduce(100) { (result: Int, next: Int) -> Int in
    return result + next
}
print(combinedInt)  // 108

let combinedDouble: Double = myIntStack.reduce(100.0) { $0 + Double($1) }
print(combinedDouble)   // 108.0

let combinedString: String = myIntStack.reduce("") { $0 + "\($1)" }
print(combinedString)
