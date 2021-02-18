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

let coffee: Coffee = Coffee(shot: 1)

let myCoffee: Americano = Americano(shot: 2, iced: false)

let yourCoffee: Latte = Latte(flavor: "green tea", shot: 3)

// MARK: - 위에는 이전 자료에서 필요한 부분



// 19-8 Latte 타입의 인스턴스를 참조하는 Coffee 타입 actingConstant 상수
let actingConstant: Coffee = Latte(flavor: "vanila", shot: 2)
print(actingConstant.description)



// 19-9 다운캐스팅
if let actingOne: Americano = coffee as? Americano {
    print("This is Americano")
} else {
    print(coffee.description)
}
// 1 shot(s) coffee

if let actingOne: Latte = coffee as? Latte {
    print("This is Latte")
} else {
    print(coffee.description)
}
// 1 shot(s) coffee

if let actingOne: Coffee = coffee as? Coffee {
    print("This is Just Coffee")
} else {
    print(coffee.description)
}
// This is Just Coffee

if let actingOne: Americano = myCoffee as? Americano {
    print("This is Americano")
} else {
    print(myCoffee.description)
}
// This is Americano

if let actingOne: Coffee = myCoffee as? Coffee {
    print("This is Just Coffee")
} else {
    print(coffee.description)
}
// This is Just Coffee

// Success
let castedCoffee: Coffee = yourCoffee as! Coffee

// 런타임 오류!! 강제 다운캐스팅 실패!
//let castedAmericano: Americano = coffee as! Americano



// 19-10 항상 성공하는 다운캐스팅
// 항상 성공한다는 것을 컴파일러도 알고 있습니다.
let castedCoffee0: Coffee = yourCoffee as Coffee

