import UIKit

class Building {    // 건물
    var name: String    // 건물 이름
    var room: Int?     // 호실 정보
    
    init(name: String) {
        self.name = name
    }
}

class Person {  // 사람
    var name: String        // 이름
    var address: Address?   // 주소
    
    init(name: String) {
        self.name = name
    }
}




// 14-8 옵셔널 체이닝을 통한 메서드 호출
struct Address { // 주소
    var province: String          // 광역시/도
    var city: String              // 시/군/구
    var street: String           // 도로명
    var building: Building?      // 건물
    var detailAddress: String?   // 건물 외 상세 주소
    
    init(province: String, city: String, street: String) {
        self.province = province
        self.city = city
        self.street = street
    }
    
    func fullAddress() -> String? {
        var restAddress: String? = nil
        
        if let buildingInfo: Building = self.building {
            restAddress = buildingInfo.name
        } else if let detail = self.detailAddress {
            restAddress = detail
        }
        
        if let rest: String = restAddress {
            var fullAddress: String = self.province
            
            fullAddress += " " + self.city
            fullAddress += " " + self.street
            fullAddress += " " + rest
            
            return fullAddress
        } else {
            return nil
        }
    }
    
    func printAddress() {
        if let address: String = self.fullAddress() {
            print(address)
        }
    }
}

let yagom: Person = Person(name: "yagom")
yagom.address = Address(province: "대구광역시", city: "동구", street: "반야월로")

yagom.address?.fullAddress()?.isEmpty   // restAddress 값이 nil이라 if 문 실행이 안되고 nil을 반환함
yagom.address?.printAddress()

yagom.address?.building = Building(name: "용계보라아파트") // buliding을 넣어주니, 바인딩을 잘 받아서 식을 진행함
yagom.address?.fullAddress()?.isEmpty
yagom.address?.printAddress()



// 14-9 옵셔널 체이닝을 통한 서브스크립트 호출
let optionalArray: [Int]? = [1, 2, 3]
optionalArray?[1]   // 2

var optionalDictionary: [String: [Int]]? = [String: [Int]]()
optionalDictionary?["numberArray"] = optionalArray
optionalDictionary?["numberArray"]?[2]  // 3
