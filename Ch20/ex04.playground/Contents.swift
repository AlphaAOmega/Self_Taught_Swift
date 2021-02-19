import UIKit

// 20-14 프로토콜 조합 및 프로토콜, 클래스 조합
protocol Named {
    var name: String { get }
}

protocol Aged {
    var age: Int { get }
}

struct Person: Named, Aged {
    var name: String
    var age: Int
}

class Car: Named {
    var name: String
    
    init(name: String) {
        self.name = name
    }
}

class Truck: Car, Aged {
    var age: Int
    
    init(name: String, age: Int) {
        self.age = age
        super.init(name: name)
    }
}

func celebrateBirthday(to celebrator: Named & Aged) {
    print("Happy birthday \(celebrator.name)!! Now you are \(celebrator.age)")
}

let yagom: Person = Person(name: "yagom", age: 99)
celebrateBirthday(to: yagom)

let myCar: Car = Car(name: "BoongBoong")
// celebrateBirthday(to: myCar)  오류발생! Aged 프로토콜을 충족하지 못했습니다.

// 오류 발생! 클래스 & 프로토콜 조합에서 클래스 타입은 한 타입만 조합할 수 있습니다.
// var somwVariable: Car & Truck & Aged

// Car 클래스의 인스턴스 역할도 수행할 수 있고, Aged 프로토콜을 준수하는 인스턴스만 할당할 수 있습니다.
var someVariable: Car & Aged

// Truck 인스턴스는 Car 클래스의 역할도 할 수 있고 Aged 프로토콜도 준수하므로 할당할 수 있습니다.
someVariable = Truck(name: "Truck", age: 5)
celebrateBirthday(to: someVariable)

// Car의 인스턴스인 myCar는 Aged 프로토콜을 준수하지 않으므로 할당할 수 없습니다.
// 오류 발생!
// someVariable = myCar



// 20-15 프로토콜 확인 및 캐스팅
print(yagom is Named)   // true
print(yagom is Aged)    // true

print(myCar is Named)   // true
print(myCar is Aged)    // false

if let castedInstance: Named = yagom as? Named {
    print("\(castedInstance) is Named")
}   // Person is Named

if let castedInstance: Aged = yagom as? Aged {
    print("\(castedInstance) is Aged")
}   // Person is Aged

if let castedInstance: Named = myCar as? Named {
    print("\(castedInstance) is Named")
}

if let castedInstance: Aged = myCar as? Aged {
    print("\(castedInstance) is Aged")
}   // 출력 없음... 캐스팅 실패
