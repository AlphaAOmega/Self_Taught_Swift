import UIKit

// 16-7 doubledEven(_:) 함수와 플랫맵의 사용
func doubledEven(_ num: Int) -> Int? {
    if num.isMultiple(of: 2) {
        return num * 2
    }
    return nil
}

Optional(3).flatMap(doubledEven)
// nil( ==Optional<Int>.none
Optional.none.flatMap(doubledEven)



// 16-8 맵과 컴팩트의 차이
let optionals: [Int?] = [1, 2, nil, 5]

let mapped: [Int?] = optionals.map{ $0 }
let compactMapped: [Int] = optionals.compactMap{ $0 }

print(mapped)   // [Optional(1), Optional(2), nil, Optional(5)]
print(compactMapped)    // [1, 2, 5]



// 16-9 중첩된 컨테이너에서 맵과 플랫맵(콤팩트맵)의 차이
let multipleContainer = [[1, 2, Optional.none], [3, Optional.none], [4, 5, Optional.none]]

let mappedMultipleContainer = multipleContainer.map{ $0.map{ $0 } }
let flatmappedMultipleContainer = multipleContainer.flatMap{ $0.flatMap{ $0 } }

print(mappedMultipleContainer)
// [[Optional(1), Optional(2), nil], [Optional(3), nil], [Optional(4), Optional(5), nil]]
print(flatmappedMultipleContainer)
// [1, 2, 3, 4, 5]



// 16-10 플랫맵의 활용
func stringToInt(_ string: String) -> Int? {
    return Int(string)
}

func intToString(_ integer: Int) -> String? {
    return "\(integer)"
}

var optionalString: String? = "2"

let flattenResult = optionalString.flatMap(stringToInt).flatMap(intToString).flatMap(stringToInt)

print(flattenResult)    // Optional(2)

let mappedResult = optionalString.map(stringToInt)  // 더 이상 체인 연결 불가
print(mappedResult) // Optinal(Optinal(2))



// 16-11 옵셔널의 맵과 플랫맵의 정의
//func map<U>(_ transform: (Wrapped) throws -> U) rethrows -> U?
//func flatMap<U>(_ transfrom: (Wrapped) throws -> U?) rethrows -> U?



// 16-12 옵셔널 바인딩을 통한 연산
var result: Int?
if let string: String = optionalString {
    if let number: Int = stringToInt(string) {
        if let finalString: String = intToString(number) {
            if let finalNumber: Int = stringToInt(finalString) {
                result = Optional(finalNumber)
            }
        }
    }
}

print(result)   // Optinal(2)

if let string: String = optionalString,
   let number: Int = stringToInt(string),
   let finalString: String = intToString(number),
   let finalNumber: Int = stringToInt(finalString) {
    result = Optional(finalNumber)
}

print(result)



// 16-13 플랫맵 체이닝 중 빈 컨텍스트를 만났을 떄의 결과
func intToNil(param: Int) -> String? {
    return nil
}

optionalString = "2"

result = optionalString.flatMap(stringToInt).flatMap(intToNil).flatMap(stringToInt)
print(result)   // nil
