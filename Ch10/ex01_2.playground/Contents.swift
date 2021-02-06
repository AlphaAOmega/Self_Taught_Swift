import UIKit

// 10-5 메서드로 구현된 접근자와 설정자
struct CoordinatePoint {
    var x: Int  // 저장 프로퍼티
    var y: Int  // 저장 프로퍼티

    // 대칭점을 구하는 메서드 - 접근자
    // 인스턴스 내/외부의 값을 연산하여 적절한 값을 돌려주는 접근자의 역할
    // Self는 타입 자기 자신을 뜻합니다.
    // Self 대신 CoordinatePoint를 사용해도 됩니다.
    func oppositePoint() -> Self {
        return CoordinatePoint(x: -x, y: -y)
    }
    
    // 대칭점을 설정하는 메서드 - 설정자
    // 은닉화된 내부의 프로퍼티 값을 간접적으로 설정하는 설정자의 역할
    // mutating 키워드에 관한 내용은 10.2.1절에서 다룹니다.
    mutating func setOppositePoint(_ opposite: CoordinatePoint) {
        x = -opposite.x
        y = -opposite.y
    }
}

var yagomPosition: CoordinatePoint = CoordinatePoint(x: 10, y: 5)

// 현재 좌표
print(yagomPosition)                    // 10, 5

// 대칭 좌표
print(yagomPosition.oppositePoint())    // -10, -5

// 대칭 좌표를 (15, 10)으로 설정하면
yagomPosition.setOppositePoint(CoordinatePoint(x: 15, y: 10))

// 현재 좌표는 -15, -10으로 설정됩니다.
print(yagomPosition)                    // -15, -10



// 10-6 연산 프로퍼티의 정의와 사용
struct CoordinatePoint0 {
    var x: Int  // 저장 프로퍼티
    var y: Int  // 저장 프로퍼티
    
    // 대칭 좌표
    var oppositePoint: Self {   // 연산 프로퍼티
        // 접근자
        get {
            return CoordinatePoint0(x: -x, y: -y)
        }
        
        // 설정자
        set(opposite) {
            x = -opposite.x
            y = -opposite.y
        }
    }
}

var yagomPosition0: CoordinatePoint0 = CoordinatePoint0(x: 10, y: 20)

// 현재 좌표
print(yagomPosition0)                    // 10, 20

// 대칭 좌표
print(yagomPosition0.oppositePoint)    // -10, -20

// 대칭 좌표를 (15, 10)으로 설정하면
yagomPosition0.oppositePoint = CoordinatePoint0(x: 15, y: 10)

// 현재 좌표는 -15, -10으로 설정됩니다.
print(yagomPosition0)



// 10-7 매개변수 이름을 생략한 설정자
struct CoordinatePoint1 {
    var x: Int  // 저장 프로퍼티
    var y: Int  // 저장 프로퍼티
    
    // 대칭 좌표
    var oppositePoint: Self {   // 연산 프로퍼티
        // 접근자
        get {
            // 이곳에서 return키워드를 생략할 수 있습니다.(return 만 빼야함)
            return CoordinatePoint1(x: -x, y: -y)
        }
        
        // 설정자
        // newValue로 매개변수 이름을 대신할 수 있습니다.
        // 매개변수를 표기하고 싶은 경우 소괄호 안에 명시하세요.
        set {
            x = -newValue.x
            y = -newValue.y
        }
    }
}



// 10-8 읽기 전용 연산 프로퍼티
struct CoordinatePoint2 {
    var x: Int
    var y: Int
    
    // 대칭 좌표
    var oppositePoint: CoordinatePoint2 {   // 연산 프로퍼티
        // 접근자
        get {
            return CoordinatePoint2(x: -x, y: -y)
        }
    }
}

var yagomPosition1: CoordinatePoint2 = CoordinatePoint2(x: 10, y: 20)

// 현재 좌표
print(yagomPosition1)

// 대칭 좌표
print(yagomPosition1.oppositePoint)

// 설정자를 구현하지 않았음으로 오류!!
// yagomPosition1.oppositePoint = CoordinatePoint2(x: 15, y: 10)
