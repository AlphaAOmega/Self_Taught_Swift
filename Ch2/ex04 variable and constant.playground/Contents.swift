import UIKit

// 변수
// var [변수명]: [데이터 타입] = [값] 의 형태로 선언한다.

var name: String = "yagom"
var age: Int = 100
var job = "iOS Programmer"  //데이터 타입이 없을 경우 타입 추론
var height = 181.5          //타입 추론으로 float형 예상
// print("\(type(of: height))")  더블형이었음
age = 99
job = "Writer"
print("저의 이름은 \(name)이고, 나이는 \(age)세이며, 직업은 \(job)입니다. 비밀이지만 키는 \(height)cm입니다.")

// 상수
// let [상수명]: [데이터 타입] = [값] 형태로 선언한다.

let name0: String = "hun"
let age0: Int = 100
let job0 = "iOS Programmer"
let height0 = 173.1
print("저의 이름은 \(name0)이고, 나이는 \(age0)세이며, 직업은 \(job0)입니다. 비밀이지만 키는 \(height0)cm입니다.")

/*
 상수를 사용하는 가장 중요한 이유는 '가독성'
 차후의 값 변경을 신경쓰지 않아도 됨(예: 원주율)
 그리고 특별한 의미를 부여할 떄 좋음
 (예: 최대 크기가 100일 때 / let maxSize = 100
 */
