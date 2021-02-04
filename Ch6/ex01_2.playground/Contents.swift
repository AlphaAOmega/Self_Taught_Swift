import UIKit

// 6-3 switch 구문 기본 구현
let integerValue: Int = 5

switch integerValue {
case 0:
    print("Value == zero")
case 1...10:
    print("Value == 1~10")
    fallthrough                         // 다음 케이스도 실행시킨다.
case Int.min..<0, 101..<Int.max:        // 한 번에 여러 값과 비교할 수 있다.
    print("Value < 0 or Value > 100")
    break
default:
    print("10 < Value <= 100")
}
// 입력값(integerValue)와 비교 값(case 조건)은 데이터 타입이 같아야한다.
// break는 선택사항으로 안넣어도 된다.
// 열거형과 같이 데이터가 제한된 상황이 아니라면 default를 넣어줘야한다.222



// 6-4 부동소수 타입의 범위 연산을 통한 switch case 구성
let doubleValue: Double = 3.0

switch doubleValue {
case 0:
    print("doubleValue == zero")
case 1.5...10.5:
    print("1.5 <= Value <= 10.5")
default:
    print("Value == \(doubleValue)")
}
// 1.5 <= Value <= 10.5



// 6-5 문자열 switch case 구성
var stringValue: String = "Liam Neeson"

switch stringValue {
case "yagom":
    print("He is yagom")
case "Jay":
    print("He is Jay")
case "Jenny", "Joker", "Nova":
    print("He or She is \(stringValue)")
default:
    print("\(stringValue) said 'I don't know who you are'")
}
// Liam Neeson said 'I don't know who you are'



// 6-6 잘못된 case 사용

// switch stringValue {
// case "yagom":
//     print("He is yagom")
// case "Jay":
//     print("He is Jay")
// case "Jenny":
//     // stringValue가 "Jenny"에 해당할 때 실행될 코드가 와야 합니다.
//     // 비어있으므로 오류 발생!
// case "Joker":
//     // stringValue가 "Joker"에 해당할 때 실행될 코드가 와야 합니다.
//     // 비어있으므로 오류 발생!
// case "Nova":
//     print("He or She is \(stringValue)")
// default:
//     print("\(stringValue) said 'I don't know who you are'")
// }



// 6-7 fallthrough의 사용(내용을 비우고 그 다음 케이스를 사용하고 싶다면 fallthrough)
stringValue = "Joker"

 switch stringValue {
 case "yagom":
     print("He is yagom")
 case "Jay":
     print("He is Jay")
 case "Jenny":
     fallthrough
 case "Joker":
     fallthrough
 case "Nova":
     print("He or She is \(stringValue)")
 default:
     print("\(stringValue) said 'I don't know who you are'")
 }



// 6-8 튜플 switch case 구성
typealias NameAge = (name: String, age: Int)

let tupleValue: NameAge = ("yagom", 99)

switch tupleValue {
case ("yagom", 99):
    print("정확히 맞췄습니다!")
default:
    print("누구인가요?")
}
// 정확히 맞췄습니다.



// 6-9 와일드카드 식별자를 사용한 튜플 switch case 구성
switch tupleValue {
case ("yagom", 50):
    print("정확히 맞췄습니다!")
case ("yagom", _):
    print("이름만 맞췄습니다. 나이는 \(tupleValue.age)세 입니다.")
case (_, 99):
    print("나이만 맞았습니다. 이름은 \(tupleValue.name) 입니다.")
default:
    print("누굴 찾나요?")
}
// 이름만 맞췄습니다. 나이는 99세 입니다.



// 6-10 값 바인딩을 사용한 튜플 switch case 구성
switch tupleValue {
case ("yagom", 50):
    print("정확히 맞췄습니다!")
case ("yagom", let age):
    print("이름만 맞췄습니다. 나이는 \(age)세 입니다.")
case (let name, 99):
    print("나이만 맞았습니다. 이름은 \(name) 입니다.")
default:
    print("누굴 찾나요?")
}
// 이름만 맞췄습니다. 나이는 99세 입니다.



// 6-11 where을 사용하여 switch case 확장
let 직급: String = "사원"
let 연차: Int = 1
let 인턴인가: Bool = false

switch 직급 {
case "사원" where 인턴인가 == true:
    print("인턴입니다.")
case "사원" where 연차 < 2 && 인턴인가 == false:
    print("신입사원입니다.")
case "사원" where 연차 < 5:
    print("연차가 좀 된 사원입니다.")
case "사원":
    print("사원입니다.")
case "대리":
    print("대리입니다.")
default:
    print("사장입니까?")
}
// 신입사원입니다.



// 6-12 열거형을 입력 값으로 받는 switch 구문
enum School {
    case primary, elementary, middle, high, college, university, graduate
}

let 최종학력: School = .university

switch 최종학력 {
case .primary:
    print("최종학력은 유치원입니다.")
case .elementary:
    print("최종학력은 초등학교입니다.")
case .middle:
    print("최종학력은 중학교입니다.")
case .high:
    print("최종학력은 고등학교입니다.")
case .college, .university:
    print("최종학력은 대학(교)입니다.")
case .graduate:
    print("최종학력은 대학원입니다.")
}
// 최종학력은 대학(교)입니다.



// 6-13 Menu 열거형의 모든 case를 처리하는 switch 구문의 상태
enum Menu {
    case chicken
    case pizza
}

let lunchMenu: Menu = .chicken

switch lunchMenu {
case .chicken:
    print("반반 무많이")
case .pizza:
    print("핫소스 많이 주세요.")
case _:    // case default: 와 같은 표현입니다.(경고는 아직 case가 추가되지 않아서 사용될 일이 없기 때문에 나옴)
    print("오늘 메뉴가 뭐죠?")
}



// 6-14 차후에 Menu 열거형에 추가한 case를 처리하지 않으면 경고를 내어줄 unknown 속성
enum Menu0 {
    case chicken
    case pizza
    case hamburger
}

let lunchMenu0: Menu0 = .hamburger

switch lunchMenu0 {    // 모든 switch 구문이 모든 case에 대응하지 않는다는 경고
case .chicken:
    print("반반 무많이")
case .pizza:
    print("핫소스 많이 주세요.")
@unknown case _:       // unknown 속성은 case _ 또는 default 에만 적용가능
    print("오늘 메뉴가 뭐죠?")
}
