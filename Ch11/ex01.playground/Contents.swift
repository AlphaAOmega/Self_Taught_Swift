import UIKit

// 11-1 클래스, 구저체, 열거형의 기본적인 형태의 이니셜라이저
class SomeClass {
    init() {
        // 초기화할 때 필요한 코드
    }
}

struct SomeStruct {
    init() {
        // 초기화할 때 필요한 코드
    }
}

enum SomeEnum {
    case someCase
    
    init() {
        // 열거형은 초기화할 때 반드시 case중 하나가 되어야 합니다.
        self = .someCase
        // 초기화할 때 필요한 코드
    }
}



// 11-2 Area 구조체와 이니셜라이저
struct Area {
    var squareMeter: Double
    
    init() {
        squareMeter = 0.0   // squareMeter의 초깃값 할당
    }
}

let room: Area = Area()
print(room.squareMeter) // 0.0



// 11-3 프로퍼티 기본값 지정
struct Area0 {
    var squareMeter: Double = 0.0   // 프로퍼티 기본값 할당
}

let room0: Area0 = Area0()
print(room0.squareMeter)    // 0.0



// 11-4 이니셜라이저 매개변수
struct Area1 {
    var squareMeter: Double
    
    init(fromPy py: Double) {   // 첫 번째 이니셜라이저
        squareMeter = py * 3.3058
    }
    
    init(fromSquareMeter squareMeter: Double) {  // 두 번째 이니셜라이저
        self.squareMeter = squareMeter
    }
    
    init(value: Double) {   // 세 번째 이니셜라이저
        squareMeter = value
    }
    
    init(_ value: Double) { // 네 번째 이니셜라이저
        squareMeter = value
    }
}

let roomOne: Area1 = Area1(fromPy: 15.0)
print(roomOne.squareMeter)  // 49.587

let roomTwo: Area1 = Area1(fromSquareMeter: 33.06)
print(roomTwo.squareMeter)  // 33.06

let roomThree: Area1 = Area1(value: 30.0)
let roomFour: Area1 = Area1(33.0)

// Area() // 오류 발생!!



// 11-5 Person 클래스
class Person {
    var name: String
    var age: Int?
    
    init(name: String) {
        self.name = name
    }
}

let yagom: Person = Person(name: "yagom")
print(yagom.name)   // yagom
print(yagom.age)    // nil

yagom.age = 99
print((yagom.age)!)

yagom.name = "Eric"
print(yagom.name)



// 11-6 상수 프로퍼티의 초기화
class Person0 {
    let name: String
    var age: Int?
    
    init(name: String) {
        self.name = name
    }
}

let yagom0: Person0 = Person0(name: "yagom")
// yagom0.name = "Eric" // 오류 발생!!



// 11-7 Point 구조체와 Size 구조체의 멤버와이즈 이니셜라이저의 사용
struct Point {
    var x: Double = 0.0
    var y: Double = 0.0
}

struct Size {
    var width: Double = 0.0
    var height: Double = 0.0
}

let point: Point = Point(x: 0, y: 0)
let size: Size = Size(width: 50.0, height: 50.0)

// 구조체의 저장 프로퍼티의 기본값이 있는 경우
// 필요한 매개변수만 사용하여 초기화할 수도 있습니다.
let somePoint: Point = Point()
let someSize: Size = Size(width: 50)
let anotherPoint: Point = Point(y: 100)



// 11-8 Student 열거형과 초기화 위임
enum Student {
    case elementary, middle, high
    case none
    
    // 사용자 정의 이니셜라이저가 있는 경우, init() 메서드를 구현해주어야 기본 이니셜라이저를 사용할 수 있습니다.
    init() {
        self = .none
    }
    
    init(나이 koreanAge: Int) {   // 첫 번째 사용자 정의 이니셜라이저
        switch koreanAge {
        case 8...13:
            self = .elementary
        case 14...16:
            self = .middle
        case 17...19:
            self = .high
        default:
            self = .none
        }
    }
    
    init(출생연도 bornAt: Int) {    // 두 번째 사용자 정의 이니셜라이저
        let currentYear: Int = 2021
        self.init(나이: currentYear - bornAt + 1)
    }
}

var younger: Student = Student(나이: 16)
print(younger)  // middle

younger = Student(출생연도: 2003)
print(younger)  // high



