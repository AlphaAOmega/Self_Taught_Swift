import UIKit

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

// MARK:-
// 27-6 강한참조 순환 문제를 약한참조로 해결
class Room {
    let number: String
    
    init(number: String) {
        self.number = number
    }
    
    weak var host: Person?
    
    deinit {
        print("Room \(number) is being deinitialized")
    }
}

var yagom: Person? = Person(name: "yagom")  // Person 인스턴스의 참조 횟수 : 1
var room: Room? = Room(number: "505")       // Room 인스턴스의 참조 횟수 : 1

room?.host = yagom  // Person 인스턴스의 참조 횟수 : 1(약한 참조는 참조 횟수를 증가시키지 않습니다.)
yagom?.room = room  // Room 인스턴스의 참조 횟수 : 2

yagom = nil // Person 인스턴스의 참조 횟수 : 0, Room 인스턴스의 참조 횟수 : 1
// 인스턴스가 메모리에서 해제될 때, 자신의 프로퍼티가 강한참조를 하던 인스턴스의 참조 횟수를 1 감소시킨다.
// yagom is being deinitialized
print(room?.host)   // nil

room = nil  // Room 인스턴스의 참조 횟수 : 0
// Room 505 is being deinitialized
