import UIKit

// 19-1 C언어와 스위프트의 데이터 타입 변환 비교
// C 언어
/*
double value = 3.3
int convertedValue = (int)value
convertedValue = 5.5   // double -> int 암시적 데이터 타입 교환
*/

// 스위프트
var value: Double = 3.3
var convertedValue: Int = Int(value)
// convertedValue = 5.5     오류 발생!



// 19-3 실패 가능한 Int 이니셜라이저
var stringValue: String = "123"
var integerValue: Int? = Int(stringValue)

print(integerValue) // Optional(123)

stringValue = "A123"
integerValue = Int(stringValue)

print(integerValue) // nil
