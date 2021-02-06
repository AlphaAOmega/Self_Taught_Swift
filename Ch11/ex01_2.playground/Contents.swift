import UIKit

// 11-9 실패 가능한 이니셜라이저
class Person {
    let name: String
    var age: Int?
    
    init?(name: String) {
        if name.isEmpty {
            return nil
        }
        self.name = name
    }
    
    init?(name: String, age: Int) {
        if name.isEmpty || age < 0 {
            return nil
        }
        self.name = name
        self.age = age
    }
}
let yagom: Person? = Person(name: "yagom", age: 99)

if let person: Person = yagom {
    print(person.name)
} else {
    print("Person wasn't initialized")
}
// yagom

let chope: Person? = Person(name: "chope", age: -10)

if let person: Person = chope {
    print(person.name)
} else {
    print("Person wasn't initialized")
}
// Person wasn't initialized
    


// 11-10 열거형의 실패 가능한 이니셜라이저
enum Student: String {
    case elementary = "초등학생", middle = "중학생", high = "고등학생"
    
    init?(koreanAge: Int) {
        switch koreanAge {
        case 8...13:
            self = .elementary
        case 14...16:
            self = .middle
        case 17...19:
            self = .high
        default:
            return nil
        }
    }
    
    init?(bornAt: Int, currentYear: Int) {
        self.init(koreanAge: currentYear - bornAt + 1)
    }
}

var younger: Student? = Student(koreanAge: 20)
print(younger)  // nil

younger = Student(bornAt: 2003, currentYear: 2021)
print(younger)  // high

younger = Student(rawValue: "대학생")
print(younger)  // nil

younger = Student(rawValue: "고등학생")
print(younger)  // high



// 11-11 클로저를 통한 프로퍼티 기본값 설정
/*
class SomeClass {
    let someProperty: SomeType = {
        // 새로운 인스턴스를 생성하고 사용자 정의 연산을 통한 후 반환해줍니다.
        // 반환되는 값의 타입은 SomeType과 같은 타입이어야 합니다.
        return someValue
    }() // 클로저를 실행하기 위한 소괄호 - 소괄호가 없다면 프로퍼티의 기본값은 클로저 그 자체가 됨
}
*/



// 11-12 클로저를 통한 student 프로퍼티 기본값 설정
struct Student0 {
    var name: String?
    var number: Int?
}

class SchoolClass {
    var students: [Student0] = {
        // 새로운 인스턴스를 생성하고 사용자 정의 연산을 통한 후 반환해줍니다.
        // 반환되는 값의 타입은 [Student0] 타입이어야 합니다.
        var arr: [Student0] = [Student0]()
        
        for num in 1...15 {
            var student: Student0 = Student0(name: nil, number: num)
            arr.append(student)
        }
        
        return arr
    }()
}

let myClass: SchoolClass = SchoolClass()
print(myClass.students.count)   // 15
