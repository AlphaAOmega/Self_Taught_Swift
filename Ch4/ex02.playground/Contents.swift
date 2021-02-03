import UIKit

// 4-2 타입 별칭
typealias MyInt = Int
typealias YourInt = Int
typealias MyDouble = Double

let age: MyInt = 100            // MyInt는 Int의 또 다른 이름입니다.
var year: YourInt = 2080        // YourInt도 Int의 또 다른 이름입니다.

// MyInt도 YourInt도 Int이기 때문에 같은 타입으로 취급합니다.
year = age

let month: Int = 7
let percentage: MyDouble = 99.9
