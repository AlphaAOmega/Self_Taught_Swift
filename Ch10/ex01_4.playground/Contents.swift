import UIKit

// 10-14 키 경로 타입의 타입 확인
class Person {
    var name: String
    
    init(name: String) {
        self.name = name
    }
}

struct Stuff {
    var name: String
    var owner: Person
}

print(type(of: \Person.name))   // ReferenceWritableKeyPath<Person, String> - 참조(클래스) 타입의 키 경로
print(type(of: \Stuff.name))    // WritableKeyPath<Stuff, String> - 값 타입의 키 경로



// 10-15 키 경로 타입의 경로 연결
let keyPath = \Stuff.owner
let nameKeyPath = keyPath.appending(path: \.name)



// 10-16 keyPath 서브스크립트와 키 경로 활용
let yagom = Person(name: "yagom")
let hana = Person(name: "hana")
let macbook = Stuff(name: "MacBook Pro", owner: yagom)
var iMac = Stuff(name: "iMac", owner: yagom)
let iPhone = Stuff(name: "iPhone", owner: hana)

let stuffNameKeyPath = \Stuff.name
let ownerkeyPath = \Stuff.owner

// \Stuff.owner.name과 같은 표현이 됩니다.
let ownerNameKeyPath = ownerkeyPath.appending(path: \.name)

// 키 경로와 서브스크립트를 이용해 프로퍼티에 접근하여 값을 가져옵니다.
print(macbook[keyPath: stuffNameKeyPath])   // MacBook Pro
print(iMac[keyPath: stuffNameKeyPath])      // iMac
print(iPhone[keyPath: stuffNameKeyPath])    // iPhone

print(macbook[keyPath: ownerNameKeyPath])   // yagom
print(iMac[keyPath: ownerNameKeyPath])      // yagom
print(iPhone[keyPath: ownerNameKeyPath])    // hana

// 키 경로와 서브스크립트를 이용해 프로퍼티에 접근하여 값을 변경합니다.
iMac[keyPath: stuffNameKeyPath] = "iMac Pro"
iMac[keyPath: ownerkeyPath] = hana

print(iMac[keyPath: stuffNameKeyPath])  // iMac Pro
print(iMac[keyPath: ownerNameKeyPath])  // hana

// 상수로 지정한 값 타입과 읽기 전용 프로퍼티는 키 경로 서브스크립트로도 값을 바꿔줄 수 없습니다.



// 10-17 클로저를 대체할 수 있는 키 경로 표현
struct Person0 {
    let name: String
    let nickname: String?
    let age: Int
    
    var isAdult: Bool {
        return age > 18
    }
}

let yagom0: Person0 = Person0(name: "yagom", nickname: "bear", age: 100)
let hana0: Person0 = Person0(name: "hana", nickname: "na", age: 100)
let happy: Person0 = Person0(name: "happy", nickname: nil, age: 3)

let family: [Person0] = [yagom0, hana0, happy]
let names: [String] = family.map(\.name)    // ["yagom", "hana", "happy"] - (Person0) -> T
let nickname: [String] = family.compactMap(\.nickname)  // ["bear", "na"] - (Person0) -> T?
let adult: [String] = family.filter(\.isAdult).map(\.name)  // ["yagom", "hana"] - (Person0) -> Bool


