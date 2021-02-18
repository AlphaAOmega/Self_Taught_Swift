import UIKit


// 18-12 이니셜라이저의 자동 상속
// 18-13 편의 이니셜라이저 자동 상속
class Person {
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    convenience init() {
        self.init(name: "Unknown")
    }
}

class Student: Person {
    var major: String   // 18-12 = "Swift"
    
    // 18-13
    override init(name: String) {
        self.major = "Unknown"
        super.init(name: name)
    }
    
    // 18-14
    convenience init(major: String) {
        self.init()
        self.major = major
    }
    
    init(name: String, major: String) {
        self.major = major
        super.init(name: name)
    }
}

// 부모클래스의 지정 이니셜라이저 자동 상속
let yagom: Person = Person(name: "yagom")
let hana: Person = Person(name: "hana")
print(yagom.name)
print(hana.name)

// 부모클래스의 편의 이니셜라이저 자동 상속
let wizplan: Person = Person()
let jinsung: Student = Student()
print(wizplan.name)
print(jinsung.name)



// 18-15 편의 이니셜라이저 자동 상속 3
class UniversityStudent: Student {
    var grade: String = "A+"
    var description: String {
        return "\(self.name) \(self.major) \(self.grade)"
    }
    
    convenience init(name: String, major: String, grade: String) {
        self.init(name: name, major: major)
        self.grade = grade
    }
}

let nova: UniversityStudent = UniversityStudent()
print(nova.description)     // Unknown Unknown A+

let raon: UniversityStudent = UniversityStudent(name: "raon")
print(raon.description)     // raon Unknown A+

let joker: UniversityStudent = UniversityStudent(name: "joker", major: "Programming")
print(joker.description)    // joker Programming A+

let chope: UniversityStudent = UniversityStudent(name: "chope", major: "Computer", grade: "C")
print(chope.description)    // chope Computer C
