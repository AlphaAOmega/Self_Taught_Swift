import UIKit

// 4-3 튜플 기본

// String, Int, Double 타입을 갖는 튜플
var person: (String, Int, Double) = ("yagom", 100, 182.5)

// 인덱스를 통해서 값을 빼 올 수 있습니다.
print("이름: \(person.0), 나이: \(person.1), 신장: \(person.2)")

person.1 = 99       // 인덱스를 통해 값을 할당할 수 있습니다.
person.2 = 178.5

print("이름: \(person.0), 나이: \(person.1), 신장: \(person.2)")



// 4-4 튜플 요소 이름 지정

// String, Int, Double 타입을 갖는 튜플
var person0: (name: String, age: Int, height: Double) = ("yagom", 100, 182.5)

// 요소의 이름을 통해서 값을 빼 올 수 있습니다.
print("이름: \(person0.name), 나이: \(person0.age), 신장: \(person0.height)")

person0.age = 99        // 요소의 이름을 통해 값을 할당할 수 있습니다.
person0.2 = 178.5       // 인덱스를 통해서도 값을 할당할 수 있습니다.

// 기존처럼 인덱스를 이용하여 값을 빼올 수 도 있습니다.
print("이름: \(person0.0), 나이: \(person0.1), 신장: \(person0.2)")



// 4-5 튜플 별칭 지정
typealias PersonTuple = (name: String, age: Int, height: Double)

let yagom: PersonTuple = ("yagom", 55, 187.5)
let eric: PersonTuple = ("eric", 23, 173.1)

print("이름: \(yagom.name), 나이: \(yagom.age), 신장: \(yagom.height)")
print("이름: \(eric.name), 나이: \(eric.age), 신장: \(eric.height)")


