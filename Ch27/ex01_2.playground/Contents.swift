import UIKit

// 27-4 강한참조 순환 문제(Strong reference cycle problem)
class Person {
    let name: String
    
    init(name: String) {
        self.name = name
    }
    
    var room: Room?
    
    deinit {
        print("\(name) is being deinitialized")
    }
}

class Room {
    let number: String
    
    init(number: String) {
        self.number = number
    }
    
    var host: Person?
    
    deinit {
        print("Room \(number) is being deinitialized")
    }
}

var yagom: Person? = Person(name: "yagom")  // Person 인스턴스의 참조 횟수 : 1
var room: Room? = Room(number: "505")   // Room 인스턴스의 참조 횟수 : 1

room?.host = yagom  // Person 인스턴스의 참조 횟수 : 2
yagom?.room = room  // Room 인스턴스의 참조 횟수 : 2

yagom = nil // Person 인스턴스의 참조 횟수 : 1
room = nil  // Room 인스턴스의 참조 횟수 : 1
// Person 인스턴스를 참조할 방법 상실 - 메모리에 잔존
// Room 인스턴스를 참조할 방법 상실 - 메모리에 잔존



// 27-5 강한참조 순환 문제를 수동으로 해결
var yagom0: Person? = Person(name: "yagom")  // Person 인스턴스의 참조 횟수 : 1
var room0: Room? = Room(number: "505")       // Room 인스턴스의 참조 횟수 : 1

room0?.host = yagom0    // Person 인스턴스의 참조 횟수 : 2
yagom0?.room = room0    // Room 인스턴스의 참조 횟수 : 2

yagom0?.room = nil       // Room 인스턴스의 참조 횟수 : 1
yagom0 = nil             // Person 인스턴스의 참조 횟수 : 1

room0?.host = nil        // Person 인스턴스의 참조 횟수 : 0
// yagom is being deinitialized
// 위에서 사용한 인스턴스가 없을 시 참조 횟수가 0이 됩니다.

room0 = nil              // Room 인스턴스의 참조 횟수 : 0
// Room 505 is being deinitialized
// 위에서 사용한 인스턴스가 없을 시 참조 횟수가 0이 됩니다.

