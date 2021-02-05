import UIKit

// 4-14 School 열거형의 선언

enum School {
    case primary        // 유치원
    case elementary     // 초등학교
    case middle         // 중학교
    case high           // 고등학교
    case college        // 대학
    case university     // 대학교
    case graduate       // 대학원
}
// 4-15 한줄로 표현하는 것도 가능
/*
enum School {
    case primary, elementary, middle, high...
}
*/



// 4-16 School 열거형 변수의 생성 및 값 변경

var highestEducationLevel: School = School.university

// 위 코드와 정확히 동일한 표현입니다.
var highestEducationLevel0: School = .university

// 같은 타입인 School 내부의 항목으로만 highestEducationLevel의 값을 변경해줄 수 있습니다.
highestEducationLevel = .graduate



// 4-17 열거형의 원시 값(rawValue) 지정과 사용

enum School0: String {
    case primary = "유치원"
    case elementary = "초등학교"
    case middle = "중학교"
    case high = "고등학교"
    case college = "대학"
    case university = "대학교"
    case graduate = "대학원"
}

let highestEducationLevel1: School0 = .university
print("저의 최종학력은 \(highestEducationLevel1.rawValue) 졸업입니다.") // 저의 최종학력은 대학교 졸업입니다.

enum WeekDays: Character {
    case mon = "월", tue = "화", wed = "수", thu = "목", fri = "금", sat = "토", sun = "일"
}

let today: WeekDays = .fri
print("오늘은 \(today.rawValue)요일입니다.")  // 오늘은 금요일입니다.



// 4-18 열거형 원시 값 일부 지정 및 자동 처리

enum School1: String {
    case primary = "유치원"
    case elementary = "초등학교"
    case middle = "중학교"
    case high = "고등학교"
    case college
    case university
    case graduate
}

let highestEducationLevel2: School1 = .university
print("저의 최종학력은 \(highestEducationLevel2.rawValue) 졸업입니다.") // 저의 최종학력은 university 졸업입니다.

print(School1.elementary.rawValue)  // 초등학교

enum Numbers: Int {
    case zero
    case one
    case two
    case ten = 10
}

print("\(Numbers.zero.rawValue), \(Numbers.one.rawValue), \(Numbers.two.rawValue), \(Numbers.ten.rawValue)")    // 0, 1, 2, 10



// 4-19 원시 값을 통한 열거형 초기화

let primary = School1(rawValue: "유치원") // primary
let graduate = School1(rawValue: "석박사") // nil(옳바르지 않은 원시 값임)

let one = Numbers(rawValue: 1)      // one
let three = Numbers(rawValue: 3)    // nil



// 4-20 연관 값을 갖는 열거형

enum MainDish {
    case pasta(taste: String)
    case pizza(dough: String, topping: String)
    case chicken(withSauce: Bool)
    case rice
}

var dinner: MainDish = .pasta(taste: "cream")               // cream pasta
dinner = .pizza(dough: "cheeze crust", topping: "bulgogi")  // bulgogi cheeze crust pizza
dinner = .rice  // rice



// 4-21 여러 열거형의 응용

enum PastaTaste {
    case cream, tomato
}
enum PizzaDough {
    case cheezeCrust, thin, original
}
enum PizzaTopping {
    case pepperoni, cheese, bacon
}

enum MainDish0 {
    case pasta(taste: PastaTaste)
    case pizza(dough: PizzaDough, topping: PizzaTopping)
    case chicken(withSauce: Bool)
    case rice
}

var dinner0: MainDish0 = .pasta(taste: .cream)
dinner0 = .pizza(dough: .cheezeCrust, topping: .bacon)



// 4-22 CaseIterable 프로토콜을 활용한 열거형의 항목 조회
enum School2: CaseIterable {
    case primary        // 유치원
    case elementary     // 초등학교
    case middle         // 중학교
    case high           // 고등학교
    case college        // 대학
    case university     // 대학교
    case graduate       // 대학원
}

let allCases: [School2] = School2.allCases
print(allCases)
// [School.primary, School.elementary, School.middle, School.high...]



// 원시값을 가지는 열거형은 원시값의 타입 다음에 (,)를 쓰고 띄어쓰기 한 후 CaseIterable 프로토콜을 작성하면 된다.
// enum School: String, CaseIterable {}

// 4-23 원시값을 갖는 열거형의 항목 순회

enum School3: String, CaseIterable {
    case primary = "유치원"
    case elementary = "초등학교"
    case middle = "중학교"
    case high = "고등학교"
    case college = "대학"
    case university = "대학교"
    case graduate = "대학원"
}

let allCases0: [School3] = School3.allCases
print(allCases0)
// [School.primary, School.elementary, School.middle, School.high...]



// 4-24 available 속성을 갖는 열거형의 항목 순회

enum School4: String, CaseIterable {
    case primary = "유치원"
    case elementary = "초등학교"
    case middle = "중학교"
    case high = "고등학교"
    case college = "대학"
    case university = "대학교"
    @available(iOS, obsoleted: 12.0)
    case graduate = "대학원"
    
    static var allCases: [School4] {
        let all: [School4] = [.primary, .elementary, .middle, .high, .college, .university]
        
        #if os(iOS)
        return all
        #else
        return all + [.graduate]
        #endif
    }
}

let allCases2: [School4] = School4.allCases
print(allCases2)

