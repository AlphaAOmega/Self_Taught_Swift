import UIKit

// 10-1 저장 프로퍼티의 선언 및 인스턴스 생성
// 좌표
struct CoordinatePoint {
    var x: Int  // 저장 프로퍼티
    var y: Int  // 저장 프로퍼티
}

// 구조체에는 기본적으로 저장 프로퍼티를 매개변수로 갖는 이니셜라이저가 있습니다.
let yagomPoint: CoordinatePoint = CoordinatePoint(x: 10, y: 5)

// 사람의 위치 정보
class Position {
    var point: CoordinatePoint
    // 저장 프로퍼티(변수) - 위치(point)는 변경될 수 있음을 의미
    let name: String    // 저장 프로퍼티(상수)
    
    // 프로퍼티 기본값을 지정해주지 않는다면 이니셜라이저를 따로 정의해주어야 합니다.
    init(name: String, currentPoint: CoordinatePoint) {
        self.name = name
        self.point = currentPoint
    }
}

// 사용자 정의 이니셜라이저를 호출해야만 합니다.
// 그렇지 않으면 프로퍼티 초깃값을 할당할 수 없기 때문에 인스턴스 생성이 불가능 합니다.
let yagomPosition: Position = Position(name: "yagom", currentPoint: yagomPoint)

// 구조체는 프로퍼티에 맞는 이니셜 라이저를 자동으로 제공
// 클래스는 그렇지 않아서 초기값을 지정하지 않을 때는 init으로 이니셜라이저를 생성해야함



// 10-2 저장 프로퍼티의 초깃값 지정
// 좌표
struct CoordinatePoint0 {
    var x: Int = 0  // 저장 프로퍼티
    var y: Int = 0  // 저장 프로퍼티
}

// 프로퍼티의 초깃값을 할당했다면 굳이 전달인자로 초깃값을 넘길 필요가 없습니다.
let yagomPoint0: CoordinatePoint0 = CoordinatePoint0()

// 물론 기존에 초깃값을 할당할 수 있는 이니셜라이저도 사용 가능합니다.
let wizplanPoint: CoordinatePoint0 = CoordinatePoint0(x: 10, y: 5)
 
print("yagom's point: \(yagomPoint0.x), \(yagomPoint0.y)")
// yagom's point : 0, 0

print("wizplan's point: \(wizplanPoint.x), \(wizplanPoint.y)")
// wizplan's point: 10, 5

// 사람의 위치 정보
class Position0 {
    var point: CoordinatePoint0 = CoordinatePoint0()    // 저장 프로퍼티
    var name: String = "Unknown"                        // 저장 프로퍼티
}

// 초깃값을 지정해줬다면 사용자 정의 이니셜라이저를 사용하지 않아도 됩니다.
let yagomPosition0: Position0 = Position0()

yagomPosition0.point = wizplanPoint
yagomPosition0.name = "yagom"

print("x: \(yagomPosition0.point.x), y: \(yagomPosition0.point.y), \(yagomPosition0.name)")
// x: 10, y: 5, yagom



// 10-3 옵셔널 저장 프로퍼티
// 좌표
struct CoordinatePoint1 {
    // 위치는 x, y 값이 모두 있어야 하므로 옵셔널이면 안 됩니다.
    var x: Int
    var y: Int
}

// 사람의 위치 정보
class Position1 {
    // 현재 사람의 위치를 모를 수도 있습니다. - 옵셔널
    var point: CoordinatePoint1?
    let name: String
    
    init(name: String) {
        self.name = name
    }
}

// 이름은 필수지만 위치는 모를 수 있습니다.
let yagomPosition1: Position1 = Position1(name: "yagom")

// 위치를 알게되면 그 때 위치 값을 할당해줍니다.
yagomPosition1.point = CoordinatePoint1(x: 20, y: 10)



// 10-4 지연 저장 프로퍼티
struct CoordinatePoint2 {
    var x: Int = 0
    var y: Int = 0
}

class Position2 {
    lazy var point: CoordinatePoint2 = CoordinatePoint2()
    let name: String
    
    init(name: String) {
        self.name = name
    }
}

let yagomPosition2: Position2 = Position2(name: "yagom")

// 이 코드를 통해 point 프로퍼티에 처음 접근할 때
// point 프로퍼티의 CoordinatePoint가 생성됩니다.
print(yagomPosition2.point)
