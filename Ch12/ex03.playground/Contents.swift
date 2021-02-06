import UIKit

// 12-4 잘못된 접근수준 부여 - 접근수준의 규칙은 '상위 요소보다 하위 요소가 더 높은 접근수준을 가질 수 없다.'
private class AClass0 {
    // 공개 접근수준을 부여해도 AClass의 접근수준이 비공개 접근수준이므로
    // 이 메서드의 접근수준도 비공개 접근수준으로 취급됩니다.
    public func someMethod() {
        // ...
    }
}

// AClass의 접근수준이 비공개 접근수준이므로
// 공개 접근수준 함수의 매개변수나 반환 값 타입으로 사용할 수 없습니다.
// public func someFunction(a: AClass) -> AClass { // 오류 발생
//     return a
// }



// 12-5 튜플의 접근수준 부여
internal class InternalClass {} // 내부 접근수준 클래스
private struct PrivateStruct {} // 비공개 접근수준 구조체

// 요소로 사용되는 internalClass와 PrivateStruct의 접근수준이
// publicTuple보다 낮기 때문에 사용할 수 없습니다.
// public var publicTuple: (first: InternalClass, second: PrivateStruct)
// = (InternalClass(), PrivateStruct())

// 요소로 사용되는 InternalClass와 PrivateStruct의 접근수준이
// privateTuple보다 같거나 높기 때문에 사용할 수 있습니다.
private var privateTuple: (first: InternalClass, second: PrivateStruct) =
    (InternalClass(), PrivateStruct())



// 12-6 접근수준에 따른 접근 결과
// AClass.swift 파일과 Common.swift 파일이 같은 모듈에 속해 있을 경우

// AClass.swift 파일
class AClass {
    func internalMethod() {}
    fileprivate func fileprivateMethod() {}
    var internalProperty = 0
    fileprivate var filePrivateProperty = 0
}

// Common.swift 파일
let aInstance: AClass = AClass()
aInstance.internalMethod()          // 같은 모듈이므로 호출 가능
aInstance.fileprivateMethod()       // 다른 파일이므로 호출 불가 - 오류
aInstance.internalProperty = 1      // 같은 모듈이므로 호출 가능
aInstance.filePrivateProperty = 1   // 다른 파일이므로 호출 불가 - 오류



// 12-7 열거형의 접근수준
private typealias PointValue = Int

// 오류 - PointValue가 Point보다 접근수준이 낮기 때문에 원시 값으로 사용할 수 없습니다.
// enum Point: PointValue {
//     case x, y
// }
