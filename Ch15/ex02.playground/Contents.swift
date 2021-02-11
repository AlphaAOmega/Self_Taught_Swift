import UIKit

// 15-5 필터 메서드의 사용
let numbers: [Int] = [0, 1, 2, 3, 4, 5]

let evenNumber: [Int] = numbers.filter { $0 % 2 == 0 }
print(evenNumber)   // [0, 2, 4]

let oddNumber: [Int] = numbers.filter { $0 % 2 == 1 }
print(oddNumber)    // [1, 3, 5]



// 15-6 맵과 필터 메서드의 연계 사용
let mappedNumbers: [Int] = numbers.map{ $0 + 3 }

let evenMappedNumbers: [Int] = mappedNumbers.filter{ $0 % 2 == 0 }
print(evenMappedNumbers)    // [4, 6, 8]

let oddMappedNumbers: [Int] = numbers.map { $0 + 3 }.filter { $0 % 2 == 1 }
print(oddMappedNumbers)     // [3, 5, 7]


