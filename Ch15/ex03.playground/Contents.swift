import UIKit

// 15-7 리듀스 메서드의 사용
let numbers: [Int] = [1, 2, 3]

// 첫 번째 형태인 reduce(_:_:) 메서드의 사용

// 초깃값이 0이고 정수 배열의 모든 값을 더합니다.
var sum: Int = numbers.reduce(0, { (result: Int, next: Int) -> Int in
    print("\(result) + \(next)")
    // 0 + 1
    // 1 + 2
    // 3 + 3
    return result + next
})

print(sum)  //6

// 초깃값이 0이고 정수 배열의 모든 값을 뺍니다.
let subtract: Int = numbers.reduce(0, { $0 - $1 })
print(subtract) // -6

// 초깃값이 3이고 정수 배열의 모든 값을 더합니다.
let sumFromThree: Int = numbers.reduce(3) { $0 + $1 }
print(sumFromThree) // 9

// 문자열 배열을 reduce(_:_:) 메서드를 이용해 연결시킵니다.
let names: [String] = ["Chope", "Jay", "Joker", "Nova"]

let reduceNames: String = names.reduce("", { $0 + ", " + $1 })
print(reduceNames)  // , Chope, Jay, Joker, Nova


// 두 번째 현태인 reduce(into:_:) 메서드의 사용

// 초깃값이 0이고 정수 배열의 모든 값을 더합니다.
// 첫 번째 리듀스 형태와 달리 클로저의 값을 반환하지 않고 내부에서
// 직접 이전 값을 변경한다는 점이 다릅니다.
sum = numbers.reduce(into: 0, { (result: inout Int, next: Int) in
    print("\(result) + \(next)")
    // 0 + 1
    // 1 + 2
    // 3 + 3
    result += next
})

print(sum)  // 6

// 초깃값이 3이고 정수 배열의 모든 값을 뺍니다.
// 첫 번째 리듀스 형태와 달리 클로저의 값을 반환하지 않고 내부에서
// 직접 이전 값을 변경한다는 점이 다릅니다.
var subtractFromThree: Int = numbers.reduce(into: 3, {
    print("\($0) - \($1)")
    // 3 - 1
    // 2 - 2
    // 0 - 3
    $0 -= $1
})

print(subtractFromThree)    // -3

// 첫 번쨰 리듀스 형태와 다르기 때문에 다른 컨테이너에 값을 변경하여 넣어줄 수도 있습니다.
// 이렇게 하면 맵이나 필터와 유사한 형태로 사용할 수도 있습니다.

// 홀수는 걸러내고 짝수만 두 배로 변경하여 초깃값인 [1, 2, 3] 배열에 직접 연산합니다.
var doubledNumbers: [Int] = numbers.reduce(into: [1, 2], { (result: inout [Int], next: Int) in
    print("result: \(result), next: \(next)")
    // result: [1, 2], next: 1
    // result: [1, 2], next: 2
    // result: [1, 2, 4], next: 3
    
    guard next % 2 == 0 else {
    return
    }
    
    print("\(result) append \(next)")
    // [1, 2] append 2
    
    result.append(next * 2)
})

print(doubledNumbers)   // [1, 2, 4]

// 필터와 맵을 사용한 모습
doubledNumbers = [1, 2] + numbers.filter { $0 % 2 == 0 }.map { $0 * 2 }
print(doubledNumbers)   // [1, 2, 4]

// 이름을 모두 대문자로 변환하여 초깃값인 빈 배열에 직접 연산하빈다.
var upperCasedNames: [String]
upperCasedNames = names.reduce(into: [], { $0.append($1.uppercased()) })

print(upperCasedNames)  // ["CHOPE", "JAY", "JOKER", "NOVA"]

// 맵을 사용한 모습
upperCasedNames = names.map { $0.uppercased() }
print(upperCasedNames)  // ["CHOPE", "JAY", "JOKER", "NOVA"]



// 15-8 맵, 필터, 리듀스 메서드의 연계 사용
let numbers0: [Int] = [1, 2, 3, 4, 5, 6, 7]

// 짝수를 걸러내어 각 값에 3을 곱해준 후 모든 값을 더합니다.
var result: Int = numbers0.filter{ $0.isMultiple(of: 2) }.map{ $0 * 3}.reduce(0){ $0 + $1 }
print(result)   // 36

// for-in 구문 사용 시
result = 0

for number in numbers0 {
    guard number.isMultiple(of: 2) else {
        continue
    }
    
    result += number * 3
}

print(result)   // 36
