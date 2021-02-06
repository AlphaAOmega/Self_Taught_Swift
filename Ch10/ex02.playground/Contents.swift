import UIKit

class LevelClass {
    // 현재 레벨을 저장하는 저장 프로퍼티
    var level: Int = 0 {
        // 프로퍼티 값이 변경되면 호출하는 프로퍼티 감시자
        didSet {
            print("Level \(level)")
        }
    }
    
    // 레벨이 올랐을 때 호출할 메서드
    func levelUp() {
        print("Level Up!")
        level += 1
    }
    
    // 레벨이 감소했을 때 호출할 메서드
    func levelDown() {
        print("Level Down")
        level -= 1
        if level < 0 {
            reset()
        }
    }
    
    // 특정 레벨로 이동할 때 호출할 메서드
    func jumpLevel(to: Int) {
        print("Jump to \(to)")
        level = to
    }
    
    // 레벨을 초기화할 때 호출할 메서드
    func reset() {
        print("Reset!")
        level = 0
    }
}

var levelClassInstance: LevelClass = LevelClass()
levelClassInstance.levelUp()    // Level Up!
// Level 1
levelClassInstance.levelDown()  // Level Down
// Level 0
levelClassInstance.levelDown()  // Level Down
// Level -1
// Reset!
// Level 0
levelClassInstance.jumpLevel(to: 30)    // Jump to 30
// Level 30



// 10-19 mutating 키워드의 사용
// 값 타입인 구조체나 열거형은 메서드 앞에 mutating 키워드를 붙여서 해당 메서드가 인스턴스 내부의 값을 변경한다는 것을 명시해야 함
struct LevelStruct {
    var level: Int = 0 {
        didSet {
            print("Level \(level)")
        }
    }
    
    mutating func levelUp() {
        print("Level Up!")
        level += 1
    }
    
    // 레벨이 감소했을 때 호출할 메서드
    mutating func levelDown() {
        print("Level Down")
        level -= 1
        if level < 0 {
            reset()
        }
    }
    
    // 특정 레벨로 이동할 때 호출할 메서드
    mutating func jumpLevel(to: Int) {
        print("Jump to \(to)")
        level = to
    }
    
    // 레벨을 초기화할 때 호출할 메서드
    mutating func reset() {
        print("Reset!")
        level = 0
    }
}

var levelStructInstance: LevelStruct = LevelStruct()
levelStructInstance.levelUp()    // Level Up!
// Level 1
levelStructInstance.levelDown()  // Level Down
// Level 0
levelStructInstance.levelDown()  // Level Down
// Level -1
// Reset!
// Level 0
levelStructInstance.jumpLevel(to: 30)    // Jump to 30
// Level 30



// 10-20 self 프로퍼티의 사용
class LevelClass0 {
    var level: Int = 0
    
    func jumpLevel(to level: Int) {
        print("Jump to \(level)")
        self.level = level
        // 인스턴스 프로퍼티인 level을 지정 - LevelClass0.level 과 같음
        // 이걸 안하면 매개변수인 level을 level로 받음
    }
}



// 10-21 self 프로퍼티와 mutating 키워드
//class LevelClass1 {
//    var level: Int = 0
//
//    func reset() {
//        // 오류!! self 프로퍼티 참조 변경 불가!
//        self = LevelClass()
//    }
//}

struct LevelStruct0 {
    var level: Int = 0
    
    mutating func levelUp() {
        print("Level Up!")
        level += 1
    }
    
    mutating func reset() {
        print("Reset!")
        self = LevelStruct0()
        // self를 통해서 자기 자신을 치환 - 값 타입 인스턴스 자체의 값을 치환
    }
}

var levelStructInstance0: LevelStruct0 = LevelStruct0()
levelStructInstance0.levelUp()   // Level Up!
print(levelStructInstance.level)    // 1

levelStructInstance0.reset()    // Reset!
print(levelStructInstance.level)    // 0

enum OnOffSwitch {
    case on, off
    mutating func nextState() {
        self = self == .on ? .off : .on
    }
}

var toggle: OnOffSwitch = OnOffSwitch.off
toggle.nextState()
print(toggle)   // on



// 10-22 Puppy 구조체에 callAsFunction 메서드 구현
struct Puppy {
    
    var name: String = "멍멍이"
    
    func callAsFunction() {
        print("멍멍")
    }
    
    func callAsFunction(destination: String) {
        print("\(destination)(으)로 달려갑니다.")
    }
    
    func callAsFunction(something: String, times: Int) {
        print("\(something)(을)를 \(times)번 반복합니다.")
    }
    
    func callAsFunction(color: String) -> String {
        return "\(color) 응가"
    }
    
    mutating func callAsFunction(name: String) {
        self.name = name
    }
}

var doggy: Puppy = Puppy()
doggy.callAsFunction()                      // 멍멍
doggy()                                     // 멍멍
doggy.callAsFunction(destination: "집")     // 집(으)로 달려갑니다.
doggy(destination: "집")                    // 집(으)로 달려갑니다.
doggy(something: "원반 물어오기", times: 5)    // 원반 물어오기(을)를 5번 반복합니다.
print(doggy(color: "무지개색"))               // 무지개색 응가
doggy(name: "댕댕이")
print(doggy.name)                           // 댕댕이

