import UIKit

enum Gender {
    case male, female, unknown
}

struct Friend {
    let name: String
    let gender: Gender
    let location: Int
    let age: UInt
}

var friends: [Friend] = [Friend]()

friends.append(name: "Yoobato", gender: .male, location: "발리", age: 26)
friends.append(name: "JiSoo", gender: .male, location: "시드니", age: 24)
friends.append(name: "Juhyun", gender: .male, location: "경기", age: 30)
friends.append(name: "Jiyoung", gender: .female, location: "서울", age: 22)
friends.append(name: "SungHo", gender: .male, location: "충북", age: 20)
friends.append(name: "JungKi", gender: .unknown, location: "대전", age: 29)
friends.append(name: "YoungMin", gender: .male, location: "경기", age: 24)


