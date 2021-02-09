import UIKit

// 13-16 탈출 클로저를 매개변수로 갖는 함수
var completionHandlers: [() -> Void] = []

func someFunctionWithEscapingClosure(completionHanler: @escaping () -> Void) {
    completionHandlers.append(completionHanler)
}



// 13-17 함수를 탈출하는 클로저의 예
typealias VoidVoidClosure = () -> Void
let firstClosure: VoidVoidClosure = {
    print("Closure A")
}
let secondClosure: VoidVoidClosure = {
    print("Closure B")
}

// first와 second 매개변수 클로저는 함수의 반환 값으로 사용될 수 있으므로 탈출 클로저입니다.
func returnOneClosure(first: @escaping VoidVoidClosure, second: @escaping VoidVoidClosure, shouldReturnFirstClosure: Bool) -> VoidVoidClosure {
    // 전달인자로 전달받은 클로저를 함수 외부로 다시 반환하기 때문에 함수를 탈출하는 클로저입니다.
    return shouldReturnFirstClosure ? first : second
}

// 함수에서 반환한 클로저가 함수 외부에 저장되었습니다.
let returnedClosure: VoidVoidClosure = returnOneClosure(first: firstClosure, second: secondClosure, shouldReturnFirstClosure: true)

returnedClosure()   // Closure A

var closures: [VoidVoidClosure] = []

// closure 매개변수 클로저는 함수 외부의 변수에 저장될 수 있으므로 탈출 클로저입니다.
func appendClosure(closure: @escaping VoidVoidClosure) {
    // 전달인자로 전달받은 클로저가 함수 외부의 변수 내부에 저장되므로 함수를 탈출합니다.
    closures.append(closure)
}



// 13-18 클래스 인스턴스 메서드에 사용되는 탈출, 비탈출 클로저
func functionWithNoescapeClosure(closure: VoidVoidClosure) {
    closure()
}

func functionWithEscapingClosure(completionHandler: @escaping VoidVoidClosure) -> VoidVoidClosure {
    return completionHandler
}

class SomeClass {
    var x = 10
    
    func runNoescapeClosure() {
        // 비탈출 클로저에서 self 키워드 사용은 선택사항 입니다.
        functionWithNoescapeClosure { x = 200 }     // functionWithNoescapeClosure() { (() -> Void ) 또는 VoidVoidClosure -> Void in x = 200 }
    }
    
    func runEscapeClosure() -> VoidVoidClosure {
        // 탈출 클로저에서는 명시적으로 self를 사용해야 합니다.
        return functionWithEscapingClosure { self.x = 100 } //
    }
}

let instance: SomeClass = SomeClass()
instance.runNoescapeClosure()
print(instance.x)    // 200

let returnedClosure0: VoidVoidClosure = instance.runEscapeClosure()
returnedClosure0()
print(instance.x)   // 100



// 13-19 오류가 발생하는 hasElements 함수
// func hasElement(in array: [Int], match predicate: (Int) -> Bool) -> Bool {
//     return (array.lazy.filter { predicate($0) }.isEmpty == false)
// }   // 탈출 클로저를 매개변수로 하는데 비탈출 클로저를 넣어서 오류가 남(predicate)



// 13-20 withoutActuallyEscaping(_:do) 함수의 활용
let numbers: [Int] = [2, 4, 6, 8]

let evenNumberPredicate = { (number: Int) -> Bool in
    return number % 2 == 0
}

let oddNumberPredicate = { (number: Int) -> Bool in
    return number % 2 == 1
}

func hasElements(in array: [Int], match predicate: (Int) -> Bool) -> Bool {
    return withoutActuallyEscaping(predicate, do: { excapablePredicate in
        return (array.lazy.filter { excapablePredicate($0) }.isEmpty == false)
    })
}

let hasEvenNumber = hasElements(in: numbers, match: evenNumberPredicate)
let hasOddNumber = hasElements(in: numbers, match: oddNumberPredicate)

print(hasEvenNumber)    // true
print(hasOddNumber)     // false
