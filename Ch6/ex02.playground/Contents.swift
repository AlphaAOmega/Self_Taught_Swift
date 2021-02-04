import UIKit

// 6-15 for-in 반복 구문의 활용
for i in 0...2 {
    print(i)
}
// 0
// 1
// 2

for i in 0...5 {
    if i.isMultiple(of: 2) {
        print(i)
        continue
    }
    print("\(i) == 홀수")
}
// 0
// 1 == 홀수
// 2
// 3 == 홀수
// 4
// 5 == 홀수

let helloSwift:String = "Hello Swift"
for char in helloSwift {
    print(char)
}

var result: Int = 1

// 시퀀스에 해당하는 값이 필용 벗다면 와일드카드 식별자(_)를 사용하면 됩니다.
for _ in 1...3 {
    result *= 10
}

print("10의 세제곱은 \(result)입니다.")
// 10의 세제곱은 1000입니다.



// 6-16 기본 데이터 타입의 for-in 반복 구문 사용
// Dictionary
let friends: [String: Int] = ["Jay": 35, "Joe": 29, "Jenny": 31]

for tuple in friends {
    print(tuple)
}
// (key: "Jenny", value: 31)
// (key: "Jay", value: 35)
// (key: "Joe", value: 29)

let 주소: [String: String] = ["도": "충청북도", "시군구": "청주시 청원구", "동읍면":"율량동"]

for (키, 값) in 주소 {
    print("\(키) : \(값)")
}
// 도 : 충청북도
// 시군구 : 청주시 청원구
// 동읍면 : 율량동

// Set
let 지역번호: Set<String> = ["02", "031", "032", "033", "041", "042", "043", "051"]

for 번호 in 지역번호 {
    print(번호)
}
// 02
// 051
// 042
// ...      세트는 순서가 없기 때문에 무작위 출력(sorted를 사용하면 순서대로 출력할 수 있음)
