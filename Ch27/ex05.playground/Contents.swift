import UIKit

// 27-9 미소유참조와 암시적 추출 옵셔널 프로퍼티의 활용
class Company {
    let name: String
    // 암시적 추출 옵셔널 프로퍼티 (강한 참조)
    var ceo: CEO!   // 인스턴스 생성 과정에서 자기 자신을 보내야하기 때문에 암시적 추출 옵셔널(!)을 사용
    // 일반 프로퍼티를 사용했다면 init 메서드 호출 후에 CEO(name...)과 같은 코드를 호출할 수 있음
    
    init(name: String, ceoName: String) {
        self.name = name
        self.ceo = CEO(name: ceoName, company: self)
    }
    
    func introduce() {
        print("\(name)의 CEO는 \(ceo.name)입니다.")
    }
}

class CEO {
    let name: String
    // 미소유참조 상수 프로퍼티 (미소유참조)
    unowned let company: Company
    
    init(name: String, company: Company) {
        self.name = name
        self.company = company
    }
    
    func introduce() {
        print("\(name)는 \(company.name)의 CEO입니다.")
    }
}

let company: Company = Company(name: "무한상사", ceoName: "김태호")
company.introduce()     // 무한상사의 CEO는 김태호입니다.
company.ceo.introduce() // 김태호는 무한상사의 CEO입니다.

