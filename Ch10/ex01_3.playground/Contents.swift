import UIKit

// 10-9 프로퍼티 감시자
class Account {
    var credit: Int = 0 {
        willSet {
            print("잔액이 \(credit)원에서 \(newValue)원으로 변경될 예정입니다.")
        }
        
        didSet {
            print("잔액이 \(oldValue)원에서 \(credit)원으로 변경되었습니다.")
        }
    }
}

let myAccount: Account = Account()
// 잔액이 0원에서 1000원으로 변경될 예정입니다.
myAccount.credit = 1000
// 잔약이 0원에서 1000원으로 변경되었습니다.



// 10-10 상속받은 연산 프로퍼티의 프로퍼티 감시자 구현
class Account0 {
    var credit: Int = 0 {
        willSet {
            print("잔액이 \(credit)원에서 \(newValue)원으로 변경될 예정입니다.")
        }
        
        didSet {
            print("잔액이 \(oldValue)원에서 \(credit)원으로 변경되었습니다.")
        }
    }
    
    var dollarValue: Double {   // 연산 프로퍼티
        get {
            return Double(credit) / 1000.0
        }
        
        set {
            credit = Int(newValue * 1000)
            print("잔액을 \(newValue)달러로 변경 중입니다.")
        }
    }
}

class ForeignAccount: Account0 {
    override var dollarValue: Double {
        willSet {
            print("잔액이 \(dollarValue)달러에서 \(newValue)달러로 변경될 예정입니다.")
        }
        
        didSet {
            print("잔액이 \(oldValue)달러에서 \(dollarValue)달러로 변경되었습니다.")
        }
    }
}

let myAccount0: ForeignAccount = ForeignAccount()
// 잔액이 0원에서 1000원으로 변경될 예정입니다.
myAccount0.credit = 1000
// 잔액이 0원에서 1000원으로 변경되었습니다.

// 잔액이 1.0달러에서 2.0달러로 변경될 예정입니다.
// 잔액이 1000원에서 2000원으로 변경될 예정입니다.
// 잔액이 1000원에서 2000원으로 변경되었습니다.

myAccount0.dollarValue = 2   // 잔액을 2.0달러로 변경 중입니다.
// 잔액이 1.0달러에서 2.0달러로 변경되었습니다.



// 10-11 저장변수의 감시자와 연산변수
var wonInPocket: Int = 2000 {
    willSet {
        print("주머니의 돈이 \(wonInPocket)원에서 \(newValue)원으로 변경될 예정입니다.")
    }
    
    didSet {
        print("주머니의 돈이 \(oldValue)원에서 \(wonInPocket)원으로 변경되었습니다.")
    }
}

var dollarInPocket: Double {
    get {
        return Double(wonInPocket) / 1000.0
    }
    
    set {
        wonInPocket = Int(newValue * 1000)
        print("주머니의 달러를 \(newValue)달러로 변경 중입니다.")
    }
}

// 주머니의 돈이 2000원에서 3500원으로 변경될 예정입니다.
// 주머니의 돈이 2000원에서 3500으로 변경되었습니다.
dollarInPocket = 3.5    // 주머니의 달러를 3.5달러로 변경 중입니다.



// 10-12 타입 프로퍼티와 인스턴스 프로퍼티
class AClass {
    // 저장 타입 프로퍼티
    static var typeProperty: Int = 0
    
    // 저장 인스턴스 프로퍼티
    var instanceProperty: Int = 0 {
        didSet {
            // Self.typeproperty는
            // AClass.typeproperty와 같은 표현입니다.
            Self.typeProperty = instanceProperty + 100
        }
    }
    
    // 연산 타입 프로퍼티
    static var typeComputedProperty: Int {
        get {
            return typeProperty
        }
        
        set {
            typeProperty = newValue
        }
    }
}

AClass.typeProperty = 123
let classInstance: AClass = AClass()
classInstance.instanceProperty = 100

print(AClass.typeProperty)  // 200
print(AClass.typeComputedProperty)  // 200



// 10-13 타입 프로퍼티의 사용
class Account1 {
    static let dollarExchangeRate: Double = 1000.0  // 타입 상수
    
    var credit: Int = 0     // 저장 인스턴스 프로퍼티
    
    var dollarValue: Double {   // 연산 인스턴스 프로퍼티
        get {
            return Double(credit) / Self.dollarExchangeRate
        }
        
        set {
            credit = Int(newValue * Self.dollarExchangeRate)
            print("잔액을 \(newValue)달러로 변경 중입니다.")
        }
    }
}

var yourAccount: Account1 = Account1()
yourAccount.dollarValue = 3.5
print(yourAccount.credit)
