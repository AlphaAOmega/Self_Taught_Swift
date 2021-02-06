import UIKit

// 10-23 클래스의 타입 메서드

class AClass {
    static func staticTypeMethod() {
        print("AClass staticTypeMethod")
    }
    
    class func classTypeMethod() {
        print("AClass ClassTypeMethod")
    }
}

//class BClass {
//    /*
//     // 오류 발생! 재정의 불가!
//     override static func staticTypeMethod() {
//     }
//    */
//

      // 이건 된다고 되어있는데, 이제 막힌듯(경고 : 부모클래스에서 받은 어떤 메소드도 중복 정의(? override) 할 수 없습니다.)
//    override class func classTypeMethod() {
//        print("BClass classTypeMethod")
//    }
//}

AClass.staticTypeMethod()   // AClass staticTypeMethod
AClass.classTypeMethod()    // AClass staticTypeMethod



// 10-24 타입 프로퍼티와 타입 메서드의 사용
// 시스템 음량은 한 기기에서 유일한 값이어야 합니다.
struct SystemVolume  {
    // 타입 프로퍼티를 사용하면 언제나 유일한 값이 됩니다.
    static var volume: Int = 5
    
    // 타입 프로퍼티를 제어하기 위해 타입 메서드를 사용합니다.
    static func mute() {
        self.volume = 0     // SystemVolume.volume = 0 과 같은 표현입니ㅏㄷ.
                            // Self.volum = 0 와도 같은 표현입니다.
    }
}

// 네비게이션 역할은 여러 인스턴스가 수행할 수 있습니다.
class Navigation {
    
    // 네비게이션 인스턴스마다 음량을 따로 설정할 수 있습니다.
    var volume: Int = 5
    
    // 길 안내 음성 재생
    func guideWay() {
        // 네비게이션 외 다른 재생원 음소거
        SystemVolume.mute()
    }
    
    // 길 안내 음성 종료
    func finishGuideWay() {
        SystemVolume.volume = self.volume
    }
}

SystemVolume.volume = 10

let myNavi: Navigation = Navigation()

myNavi.guideWay()
print(SystemVolume.volume)  // 0

myNavi.finishGuideWay()
print(SystemVolume.volume)  // 5


