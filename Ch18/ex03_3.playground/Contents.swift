import UIKit

// 18-16 요구 이니셜라이저 정의
class Person {
    var name: String
    // 요구 이니셜라이저 정의
    required init() {
        self.name = "Unknown"
    }
}

class Student: Person {
    var major: String = "Unknown"
}

let miJeong: Student = Student()
// 자동 상속되었기 때문에 요청 이니셜라이저를 구현하지 않았음



// 18-17 요구 이니셜라이저 재구현
class Person0 {
    var name: String
    
    // 요구 이니셜라이저 정의
    required init() {
        self.name = "Unknown"
    }
}

class Student0: Person0 {
    var major: String = "Unknown"
    
    // 자신의 지정 이니셜라이저 구현
    init(major: String) {
        self.major = major
        super.init()
    }
    
    required init() {
        self.major = "Unknown"
        super.init()
    }
}

class UniversityStudent: Student0 {
    var grade: String
    
    // 자신의 지정 이니셜라이저 구현
    init(grade: String) {
        self.grade = grade
        super.init()
    }
    
    required init() {
        self.grade = "F"
        super.init()
    }
}

let jiSoo: Student0 = Student0()
print(jiSoo.major)  // Unknown

let yagom: Student0 = Student0(major: "Swift")
print(yagom.major)  // Swift

let juHyun: UniversityStudent = UniversityStudent(grade: "A+")
print(juHyun.grade) // A+



// 18-18 일반 이니셜라이저의 요구 이니셜라이저 변경
class Person1 {
    var name: String
    
    init() {
        self.name = "Unknown"
    }
}

class Student1: Person1 {
    var major: String = "Unknown"
    
    init(major: String) {
        self.major = major
        super.init()
    }
    
    // 부모클래스의 이니셜라이저를 재정의함과 동시에
    // 요구 이니셜라이저로 변경됨을 알립니다.
    required override init() {
        self.major = "Unknown"
        super.init()
    }
    
    // 이 요구 이니셜라이저는 앞으로 계속 요구합니다.
    required convenience init(name: String) {
        self.init()
        self.name = name
    }
}

class UniversityStudent0: Student1 {
    var grade: String
    
    init(grade: String) {
        self.grade = grade
        super.init()
    }
    
    // Student 클래스에서 요구했으므로 구현해주어야 합니다.
    required init() {
        self.grade = "F"
        super.init()
    }
    
    // Student 클래스에서 요구했으므로 구현해주어야 합니다.
    required convenience init(name: String) {
        self.init()
        self.name = name
    }
}

let yagom0: UniversityStudent0 = UniversityStudent0()
print(yagom0.grade)  // F

let juHyun0: UniversityStudent0 = UniversityStudent0(name: "Juhyun")
print(juHyun0.name) // JuHyun
