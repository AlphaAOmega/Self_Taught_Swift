import UIKit

// 17-5 타입 서브스크립트 구현
enum School: Int {
    case elementary = 1, middle, high, university
    
    static subscript(level: Int) -> School? {
        return Self(rawValue: level)
        // return School(rawValue: level)과 같은 표현입니다.
    }
}

let school: School? = School[2]
print(school)   // Optional(School.middle)
 
