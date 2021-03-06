import UIKit

enum Gender {
    case male, female, unknown
}

struct Friend {
    let name: String
    let gender: Gender
    let location: String
    let age: UInt
}

var friends: [Friend] = [Friend]()

friends.append(Friend(name: "Yoobato", gender: .male, location: "발리", age: 26))
friends.append(Friend(name: "JiSoo", gender: .male, location: "시드니", age: 24))
friends.append(Friend(name: "Juhyun", gender: .male, location: "경기", age: 30))
friends.append(Friend(name: "Jiyoung", gender: .female, location: "서울", age: 22))
friends.append(Friend(name: "SungHo", gender: .male, location: "충북", age: 20))
friends.append(Friend(name: "JungKi", gender: .unknown, location: "대전", age: 29))
friends.append(Friend(name: "YoungMin", gender: .male, location: "경기", age: 24))



// 15-10 조건에 맞는 친구 결과 출력
// 서울 외의 지역에 거주하며 25세 이상인 친구
var result: [Friend] = friends.map{ Friend(name: $0.name, gender: $0.gender, location: $0.location, age: $0.age + 1)}

result = result.filter{ $0.location != "서울" && $0.age >= 25}

let string: String = result.reduce("서울 외의 지역에 거주하는 25세 이상인 친구") { ($0 + "\n" + "\($1.name) \($1.gender) \($1.location) \($1.age)")}

print(string)
/*
서울 외의 지역에 거주하는 25세 이상인 친구
Yoobato male 발리 27
JiSoo male 시드니 25
Juhyun male 경기 31
JungKi unknown 대전 30
YoungMin male 경기 25
 */

