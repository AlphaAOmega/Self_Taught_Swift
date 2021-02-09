import UIKit

// 빠른 종료( 키워드 : guard )
/*
 guard Bool 타입 값 else {
    예외사항 실행문
    제어문 전환 명령어
 }
 */

// 14-10 같은 역할을 하는 if 구문과 guard 구문
// if 구문을 사용한 코드
for i in 0...3 {
    if i == 2 {
        print(i)
    } else {
        continue
    }
}


// guard 구문을 사용한 코드
for i in 0...3 {
    guard i == 2 else {
        continue
    }
    print(i)
}



// 14-11 guard 구문의 옵셔널 바인딩 활용
func greet(_ person: [String: String]) {
    guard let name: String = person["name"] else {
        return
    }
    
    print("Hello \(name)!")
    
    guard let location: String = person["location"] else {
        print("I hope the weather is nice near you")
        return
    }
    print("I hope the weather is nice in \(location)")
}

var personInfo: [String: String] = [String: String]()
personInfo["name"] = "Jenny"
greet(personInfo)
// Hello Jenny!
// I hope the weather is nice near you

personInfo["location"] = "Korea"
greet(personInfo)
// Hello Jenny!
// I hope the weather is nice in Korea



// 14-12 메서드 내부에서 guard 구문의 옵셔널 바인딩 활용
//func fullAddress() -> String? {
//    var restAddress: String? = nil
//
//    if let buildingInfo: Building = self.building {
//        restAddress = buildingInfo.name
//    } else if let detail = self.detailAddress {
//        restAddress = detail
//    }
//
//    guard let rest: String = restAddress else {
//        return nil
//    }
//
//    var fullAddress: String = self.province
//
//    fullAddress += " " + self.city
//    fullAddress += " " + self.street
//    fullAddress += " " + rest
//
//    return fullAddress
//}



// 14-13 guard 구문에 구체적인 조건을 추가
func enterClub(name: String?, age: Int?) {
    guard let name: String = name, let age: Int = age, age > 19, name.isEmpty == false else {
        print("You are not allowed to enter the club.")
        return
    }
    
    print("Welcome \(name)!")
}

enterClub(name: "Hun", age: 23) // Welcome Hun!
enterClub(name: "min", age: 19) // You are not allowed to enter the club.
enterClub(name: "", age: 18)    // You are not allowed to enter the club.



// 14-14 guard 구문이 사용될 수 없는 경우
//let first: Int = 3
//let second: Int = 5
//
//guard first > second else {
//    // 여기에 들어올 만한 제어문 전환 명령이 없습니다. - 오류 발생
//}
