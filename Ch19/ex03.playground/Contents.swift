import UIKit

class Coffee {
    let name: String
    let shot: Int
    
    var description: String {
        return "\(shot) shot(s) \(name)"
    }
    
    init(shot: Int) {
        self.shot = shot
        self.name = "coffee"
    }
}

class Latte: Coffee {
    var flavor: String
    
    override var description: String {
        return "\(shot) shot(s) \(flavor) latte"
    }
    
    init(flavor: String, shot: Int) {
        self.flavor = flavor
        super.init(shot: shot)
    }
}

class Americano: Coffee {
    let iced: Bool
    
    override var description: String {
        return "\(shot) shot(s) \(iced ? "iced" : "hot") americano"
    }
    
    init(shot: Int, iced: Bool) {
        self.iced = iced
        super.init(shot: shot)
    }
}

// MARK: - 위에는 이전 자료에서 필요한 부분


// 19-5 데이터 타입 확인
let coffee: Coffee = Coffee(shot: 1)
print(coffee.description)

let myCoffee: Americano = Americano(shot: 2, iced: false)
print(myCoffee.description)

let yourCoffee: Latte = Latte(flavor: "green tea", shot: 3)
print(yourCoffee.description)   // 3shot(s) green tea latte

print(coffee is Coffee)     // true
print(coffee is Americano)  // false
print(coffee is Latte)      // false

print(myCoffee is Coffee)   // true
print(yourCoffee is Coffee) // true

print(myCoffee is Latte)    // false
print(yourCoffee is Latte)  // true



// 19-6 메타 타입
protocol SomeProtocol { }
class SomeClass: SomeProtocol { }

let intType: Int.Type = Int.self
let stringType: String.Type = String.self
let classType: SomeClass.Type = SomeClass.self
let protocolProtocol: SomeProtocol.Protocol = SomeProtocol.self

var someType: Any.Type

someType = intType
print(someType)     // Int

someType = stringType
print(someType)     // String

someType = classType
print(someType)     // SomeClass

someType = protocolProtocol
print(someType)     // SomeProtocol



// 19-7 type(of:) 함수와 .self의 사용
print(type(of: coffee) == Coffee.self)           // true
print(type(of: coffee) == Americano.self)        // false

print(type(of: myCoffee) == Americano.self)      // true
print(type(of: yourCoffee) == Americano.self)    // false

print(type(of: myCoffee) == Latte.self)         // false
print(type(of: yourCoffee) == Latte.self)       // true
