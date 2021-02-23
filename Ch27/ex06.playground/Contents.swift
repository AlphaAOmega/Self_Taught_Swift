import UIKit

// 27-10 클로저의 강한참조 순환 문제
class Person {
    let name: String
    let hobby: String?
    
    lazy var introduce: () -> String = {
        
        var introduction: String = "My name is \(self.name)."
        
        guard let hobby = self.hobby else {
            return introduction
        }
        
        introduction += " "
        introduction += "My hobby is \(hobby)."
        
        return introduction
    }
    
    init(name: String, hobby: String? = nil) {
        self.name = name
        self.hobby = hobby
    }
    
    deinit {
        print("\(name) is being deinitialized")
    }
}

var yagom: Person? = Person(name: "yagom", hobby: "eating")
print(yagom?.introduce())   // My name is yagom. My hobby is eating.
yagom = nil



// 27-11 획득목록을 통한 값 획득
var a = 0
var b = 0
let closure = { [a] in
    print(a, b)
    b = 20
}

a = 10
b = 10
closure()   // 0 10
print(b)



// 27-12 참조 타입의 획득목록 동작
class SimpleClass {
    var value: Int = 0
}

var x = SimpleClass()
var y = SimpleClass()

let closure0 = { [x] in
    print(x.value, y.value)
}
x.value = 10
y.value = 10

closure0()   // 10 10



// 27-13 획득목록의 획득 종류 명시
var c: SimpleClass? = SimpleClass()
var d = SimpleClass()

let closure1 = { [weak c, unowned d] in
    print(c?.value, d.value)
}

c = nil
d.value = 10

closure1()   // nil 10
