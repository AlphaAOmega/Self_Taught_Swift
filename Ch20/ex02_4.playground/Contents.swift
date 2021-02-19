import UIKit

// 20-7 프로토콜의 이니셜라이저 요구와 구조체의 이니셜라이저 요구 구현
protocol Named {
    var name: String { get }
    
    init(name: String)
}

struct Pet: Named {
    var name: String
    
    init(name: String) {
        self.name = name
    }
}



// 20-8 클래스의 이니셜라이저 요구 구현
class Person: Named {
    var name: String
    
    required init(name: String) {
        self.name = name
    }
}



// 20-9 상속이 불가능한 클래스의 이니셜라이저 요구 구현
final class Person0: Named {
    var name: String
    
    init(name: String) {
        self.name = name
    }
}



// 20-10 상속받은 클래스의 이니셜라이저 요구 구현 및 재저으이
class School {
    var name: String
    
    init(name: String) {
        self.name = name
    }
}

class MiddleSchool: School, Named {
    required override init(name: String) {
        super.init(name: name)
    }
}



// MARK:-
// 20-11 실패 가능한 이니셜라이저 요구를 포함하는 Named 프로토콜과 Named 프로토콜을 준수하는 다양한 타입들
protocol Name {
    var name: String { get }
    
    init?(name: String)
}

struct Animal: Name {
    var name: String
    
    init!(name: String) {
        self.name = name
    }
}

struct Pet0: Name {
    var name: String
    
    init(name: String) {
        self.name = name
    }
}

class Person1: Name {
    var name: String
    
    required init(name: String) {
        self.name = name
    }
}

class School0: Name {
    var name: String
    
    required init?(name: String) {
        self.name = name
    }
}
