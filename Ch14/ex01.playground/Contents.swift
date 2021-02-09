import UIKit

// 14-1 사람의 주소 정보 표현 설계
class Room { // 호실
    var number: Int     // 호실 번호
    
    init(number: Int) {
        self.number = number
    }
}

class Building {    // 건물
    var name: String    // 건물 이름
    var room: Room?     // 호실 정보
    
    init(name: String) {
        self.name = name
    }
}

struct Address { // 주소
    var province: String          // 광역시/도
    var city: String             // 시/군/구
    var street: String           // 도로명
    var building: Building?     // 건물
    var detailAddress: String?   // 건물 외 상세 주소
}

class Person {  // 사람
    var name: String        // 이름
    var address: Address?   // 주소
    
    init(name: String) {
        self.name = name
    }
}



// 14-2 yagom 인스턴스 생성
let yagom: Person = Person(name: "yagom")



// 14-3 옵셔널 체이닝 문법
let yagomRoomViaOptionalChaining: Int? = yagom.address?.building?.room?.number  // nil
// let yagomRoomViaOptionalUnwraping: Int = yagom.address!.building!.room!.number
// 오류 발생(nil 값이 있는데 옵셔널 강제 추출(!)을 진행함)



// 14-4 옵셔널 바인딩의 사용
var roomNumber: Int? = nil

if let yagomAddress: Address = yagom.address {
    if let yagombuilding: Building = yagomAddress.building {
        if let yagomRoom: Room = yagombuilding.room {
            roomNumber = yagomRoom.number
        }
    }
}

if let number: Int = roomNumber {
    print(number)
} else {
    print("Can not find room number")
}



// 14-5 옵셔널 체이닝의 사용
if let roomNumber: Int = yagom.address?.building?.room?.number {
    print(roomNumber)
} else {
    print("Can not find room number")
}



// 14-6 옵셔널 체이닝을 토한 값 할당 시도
yagom.address?.building?.room?.number = 505
print(yagom.address?.building?.room?.number)    // nil
// yagom에 address 프로퍼티가 없으며 하위 프로퍼티도 없기 때문에 옵셔널 체이닝은 동작 도중 중지됨



// 14-7 옵셔널 체이닝을 통한 값 할당
yagom.address = Address(province: "대구광역시", city: "동구", street: "반야월로", building: nil, detailAddress: nil)
yagom.address?.building = Building(name: "용계보라아파트")
yagom.address?.building?.room = Room(number: 0)
yagom.address?.building?.room?.number = 505

print(yagom.address?.building?.room?.number)




