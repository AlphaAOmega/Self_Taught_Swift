import UIKit


// 17-1 서브스크립트 정의 문법
/*
 subscript(index: Int) -> Int {
     get {
        // 적절한 서브스크립트 결과값 반환
     }
 
    set(newValue) {
        // 적절한 설정자 역할 수행
    }
 }
 */



// 17-2 읽기 전용 서브스크립트 정의 문법
/*
subscript(index: Int) -> Int {
    get {
        // 적절한 서브스크립트 값 반환
    }
}
 
 subscript(index: Int) -> Int {
    // 적절한 서브스크립트 값 반환
 }
 
 // 위의 두 서브스크립트 정의는 같은 동작을 합니다.
 */


