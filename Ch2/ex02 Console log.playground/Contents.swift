import UIKit

var str = "Hello, playground"

print(str)

var j: Int = 0

for i in 0...3 {
    j += i
}

struct BasicInformation {
    let name: String
    var age: Int
}

var yagomInfo: BasicInformation = BasicInformation(name: "yagom", age: 99)

class Person {
    var height: Float = 0.0
    var weight: Float = 0.0
}

let yagom: Person = Person()
yagom.height = 182.5
yagom.weight = 78.5

print(yagomInfo)
dump(yagomInfo)

print(yagom)
dump(yagom)
