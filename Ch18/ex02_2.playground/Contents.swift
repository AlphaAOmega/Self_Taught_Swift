import UIKit

// 18-5 프로퍼티 재정의
class Person {
    var name: String = ""
    var age: Int = 0
    var koreanAge: Int {
        return self.age + 1
    }
    
    var introduction: String {
        return "이름: \(name), 나이: \(age)"
    }
}

class Student: Person {
    var grade: String = "F"
    
    override var introduction: String {
        return super.introduction + ", " + "학점: \(self.grade)"
    }
    
    override var koreanAge: Int {
        get {
            return super.koreanAge
        }
        
        set {
            self.age = newValue - 1
        }
    }
}

let yagom: Person = Person()
yagom.name = "yagom"
yagom.age = 55
//yagom.koreanAge = 56  // koreanAge는 읽기 전용 프로퍼티라 쓰기 불가
print(yagom.introduction)   // 이름: yagom, 나이: 55
print(yagom.koreanAge)  // 56

let jay: Student = Student()
jay.name = "jay"
jay.koreanAge = 15
print(jay.introduction) // 이름: jay, 나이: 14, 학점: F(koreanAge에 추가한 설정자(쓰기)로 Age 쓰기 가능)
print(jay.koreanAge)    // 15
