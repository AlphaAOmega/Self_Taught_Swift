import UIKit


// 5-12 중위 연산자의 정의

infix operator ** : MultiplicationPrecedence

// 5-13 중위 연산자의 구현과 사용

// String 타입의 contains(_:) 메서드를 사용하기 위해 Foundation 프레임워크를 임포트합니다.
import Foundation

func ** (lhs: String, rhs: String) -> Bool {    // 중위 연산자 구현 함수에는 키워드를 추가하지 않는다.
    return lhs.contains(rhs)
}

let helloYagom: String = "Hello yagom"
let yagom: String = "yagom"
let isContainsYagom: Bool = helloYagom ** yagom    // true



// 5-14 클래스 및 구조체의 비교 연산자 구현
class Car {
    var modelYear: Int?     // 연식
    var modelName: String?  // 모델 이름
}

struct SmartPhone {
    var company: String?    // 제조사
    var model: String?      // 모델
}

// Car 클래스의 인스턴스끼리 == 연산했을 때 model이 같다면 true를 반환
func == (lhs: Car, rhs: Car) -> Bool {
    return lhs.modelName == rhs.modelName
}

func == (lhs: SmartPhone, rhs: SmartPhone) -> Bool {
    return lhs.model == rhs.model
}

let myCar = Car()
myCar.modelName = "S"

let yourCar = Car()
yourCar.modelName = "S"

var myPhone = SmartPhone()
myPhone.model = "SE"

var yourPhone = SmartPhone()
yourPhone.model = "6"

print(myCar == yourCar)
print(myPhone == yourPhone)



// 5-15 타입 메서드로 구현된 사용자 정의 비교 연산자

class Car0 {
    var modelYear: Int?
    var modelName: String?
    
    // Car 클래스의 인스턴스끼리 == 연산했을 때 modelName이 같다면 true를 반환
    static func == (lhs: Car0, rhs: Car0) -> Bool {
        return lhs.modelName == rhs.modelName
    }
}

struct SmartPhone0 {
    var company: String?
    var model: String?
    
    // SmartPhone 클래스의 인스턴스끼리 == 연산했을 때 model이 같다면 true를 반환
    static func == (lhs: SmartPhone0, rhs: SmartPhone0) -> Bool {
        return lhs.model == rhs.model
    }
}


