import UIKit


// 4-25 연관 값을 갖는 열거형의 항목 순회
enum PastaTaste: CaseIterable {
    case cream, tomato
}

enum PizzaDough: CaseIterable {
    case cheeseCrust, thin, original
}

enum PizzaTopping: CaseIterable {
    case pepperoni, cheese, bacon
}

enum MainDish: CaseIterable {
    case pasta(taste: PastaTaste)
    case pizza(dough: PizzaDough, topping: PizzaTopping)
    case chicken(withSauce: Bool)
    case rice
    
    static var allCases: [MainDish] {
        return PastaTaste.allCases.map(MainDish.pasta)
            + PizzaDough.allCases.reduce([]) { (result, dough) -> [MainDish] in result + PizzaTopping.allCases.map { (topping) -> MainDish in MainDish.pizza(dough: dough, topping: topping)
                }
            }
            + [true, false].map(MainDish.chicken)
            + [MainDish.rice]
    }
}

print(MainDish.allCases.count)  // 14
print(MainDish.allCases)        // 모든 경우의 연관 값을 갖는 케이스 컬렉션



// 4-26 특정 항목에 순환 열거형 항목 명시

enum ArithmeticExpression {
    case number(Int)
    indirect case addition(ArithmeticExpression, ArithmeticExpression)
    indirect case multiplication(ArithmeticExpression, ArithmeticExpression)
}



// 4-27 열거형 전체에 순환 열거형 명시

indirect enum ArithmeticExpression0 {
    case number(Int)
    case addition(ArithmeticExpression, ArithmeticExpression)
    case multiplication(ArithmeticExpression, ArithmeticExpression)
}



// 4-28 순환 열거형의 사용

let five = ArithmeticExpression.number(5)
let four = ArithmeticExpression.number(4)
let sum = ArithmeticExpression.addition(five, four)
let final = ArithmeticExpression.multiplication(sum, ArithmeticExpression.number(2))

func evaluate(_ expression: ArithmeticExpression) -> Int {
    switch expression {
    case .number(let value):
        return value
    case .addition(let left, let right):
        return evaluate(left) + evaluate(right)
    case .multiplication(let left, let right):
        return evaluate(left) * evaluate(right)
    }
}

let result: Int = evaluate(final)
print("(5 + 4) * 2 = \(result)")        // (5 + 4) * 2 = 18



// 4-29 비교 가능한 열거형의 사용

enum Condition: Comparable {
    case terrible
    case bad
    case good
    case great
}

let myCondition: Condition = .great
let yourCondition: Condition = .bad

if myCondition >= yourCondition {
    print("제 상태가 더 좋군요")
} else {
    print("당신의 상태가 더 좋군요")
}
// 제 상태가 더 좋군요

enum Device: Comparable {
    case iPhone(version: String)
    case iPad(version: String)
    case macbook
    case iMac
}

var devices: [Device] = []
devices.append(.iMac)
devices.append(.iPhone(version: "14.3"))
devices.append(.iPhone(version: "6.1"))
devices.append(.iPad(version: "10.3"))
devices.append(.macbook)

let sortedDevices: [Device] = devices.sorted()
print(sortedDevices)    // [Device.iPhone(version: "14.3"), Device.iPhone(version: "6.1"), ...)
