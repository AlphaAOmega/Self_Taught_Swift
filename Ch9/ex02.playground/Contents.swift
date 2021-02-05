import UIKit

// 클래스 정의
/*
class 클래스이름 {
    프로퍼티와 메서드들
}
 
 // 상속 받을 때는
 class 클래스이름: 부모클래스이름 {
    프로퍼티와 메서드들
 }
 */



// 9-3 Person 클래스 정의
class Person {
    var height: Float = 0.0
    var weight: Float = 0.0
}



// 9-4 Person 클래스의 인스턴스 생성 및 사용
var yagom: Person = Person()
yagom.height = 123.4
yagom.weight = 123.4

// 클래스는 참조 타입이기 때문에 상수로 정의해도 값을 바꿀 수 있습니다.(포인터랑 유사한 듯?)
let jenny: Person = Person()
jenny.height = 123.4
jenny.weight = 123.4



// 9-5 Person 클래스의 인스턴스 생성 및 소멸
class Person0 {
    var height: Float = 0.0
    var weight: Float = 0.0
    
    // 메모리에서 해제되기 직전에 처리할 코드를 넣어줍니다.
    deinit {
        print("Person0 클래스의 인스턴스가 소멸됩니다.")
    }
}

var yagom0: Person0? = Person0()
yagom0 = nil     // Person0 클래스의 인스턴스가 소멸됩니다.
