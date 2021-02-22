import UIKit

// 23-1 익스텐션을 통한 프로토콜의 실제 구현
protocol Receiveable {
    func received(data: Any, from: Sendable)
}

extension Receiveable {
    // 메세지를 수신합니다.
    func received(data: Any, from: Sendable) {
        print("\(self) received \(data) from \(from)")
    }
}

// 무언가를 발신할 수 있는 기능
protocol Sendable {
    var from: Sendable { get }
    var to: Receiveable? { get }
    
    func send(data: Any)
    
    static func isSendableInstance(_ instance: Any) -> Bool
}

extension Sendable {
    // 발신은 발신 가능한 객체, 즉 Sendable 프로토콜으 준수하는 타입의 인스턴스여야 합니다.
    var from: Sendable {
        return self
    }
    
    // 메세지를 발신합니다.
    func send(data: Any) {
        guard let receiver: Receiveable = self.to else {
            print("\(self) has no receiver")
            return
        }
        
        // 수신 가능한 인스턴스의 received 메서드를 호출합니다.
        receiver.received(data: data, from: self.from)
    }
    
    static func isSendableInstance(_ instance: Any) -> Bool {
        if let sendableInstance: Sendable = instance as? Sendable {
            return sendableInstance.to != nil
        }
        return false
    }
}

// 수신, 발신이 가능한 Message 클래스
class Message: Sendable, Receiveable {
    var to: Receiveable?
}

// 수신, 발신이 가능한 Mail 클래스
class Mail: Sendable, Receiveable {
    var to: Receiveable?
}

// 두 Message 인스턴스를 생성합니다.
let myPhoneMessage: Message = Message()
let yourPhoneMessage: Message = Message()

// 아직 수신받을 인스턴스가 없습니다.
myPhoneMessage.send(data: "Hello")  // Message has no receiver

// Message 인스턴스는 발신과 수신이 모두 가능하므로 메세지를 주고 받을 수 있습니다.
myPhoneMessage.to = yourPhoneMessage
myPhoneMessage.send(data: "Hello")  // Message received Hello from Message

// Mail 인스턴스를 두 개 생성합니다.
let myMail: Mail = Mail()
let yourMail: Mail = Mail()

myMail.send(data: "Hi") // Mail has no receiver

// Message 와 Mail 모두 Sendable과 Receiveable 프로토콜을 준수하므로
// 서로 주고 받을 수 있습니다.
myMail.to = yourMail
myMail.send(data: "Hi") // Mail received Hi from Mail

myMail.to = myPhoneMessage
myMail.send(data: "Bye")    // Message received Bye from Mail

// String은 Sendable 프로토콜을 준수하지 않습니다.
Message.isSendableInstance("Hello") // false

// Message와 Mail은 Sendable 프로토콜을 준수합니다.
Message.isSendableInstance(myPhoneMessage)  // true

// yourPhoneMessage는 to 프로퍼티가 설정되지 않아서 보낼 수 없는 상태입니다.
Message.isSendableInstance(yourPhoneMessage)    // false
Mail.isSendableInstance(myPhoneMessage) // true
Mail.isSendableInstance(myMail) // true



// 23-2 익스텐션을 통해 구현된 메서드 재정의
class Mail0: Sendable, Receiveable {
    var to: Receiveable?
    
    func send(data: Any) {
        print("Mail의 send 메서드는 재정의 되었습니다.")
    }
}

let mailInstance: Mail0 = Mail0()
mailInstance.send(data: "Hello")    // Mail의 send 메서드는 재정의 되었습니다.



// 23-3 제넥, 프로토콜, 익스텐션을 통한 재사용 가능한 코드 작성
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
}

struct Queue<Element>: Insertable {
    var items: [Element] = [Element]()
}

var myIntStack: Stack<Int> = Stack<Int>()
var myStringStack: Stack<String> = Stack<String>()
var myIntQueue: Queue<Int> = Queue<Int>()
var myStringQueue: Queue<String> = Queue<String>()

myIntStack.push(3)
myIntStack.printSelf()  // [3]
myIntStack.push(2)
myIntStack.printSelf()  // [3, 2]
myIntStack.pop()
myIntStack.printSelf()  // [3]

myStringStack.push("A")
myStringStack.printSelf()   // ["A"]
myStringStack.push("B")
myStringStack.printSelf()   // ["A", "B"]
myStringStack.pop()
myStringStack.printSelf()   // ["A"]

myIntQueue.insert(3)
myIntQueue.printSelf()  // [3]
myIntQueue.insert(2)
myIntQueue.printSelf()  // [3, 2]
myIntQueue.delete()
myIntQueue.printSelf()  // [2]

myStringQueue.insert("A")
myStringQueue.printSelf()   // ["A"]
myStringQueue.insert("B")
myStringQueue.printSelf()   // ["A", "B"]
myStringQueue.delete()
myStringQueue.printSelf()   // ["B"]
