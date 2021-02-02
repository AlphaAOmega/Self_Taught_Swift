import UIKit

// 3-6 String

// 상수로 선언된 문자열은 변경이 불가능합니다.
let name: String = "yagom"

// 이니셜라이저를 사용하여 빈 문자열을 생성할 수 있습니다.
// var 키워드를 사용하여 변수를 생성했으므로 문자열의 수정 및 변경이 가능합니다.
var introduce: String = String()

// append() 메서드를 사용하여 문자열을 이어붙일 수 있습니다.
introduce.append("제 이름은")

// + 연산자를 통해서도 문자열을 이어붙일 수 있습니다.
introduce = introduce + " " + name + "입니다."
print(introduce)

// name에 해당하는 문자의 수를 셀 수 있습니다.
print("name의 글자 수: \(name.count)")
// 빈 문자열인지 확인해볼 수 있습니다.
print("introduce가 비어있습니까?: \(introduce.isEmpty)")

// 유니코드의 스칼라값을 사용하면 값에 해당하는 표현이 출력됩니다.  - 어떤 모양이 출력되나요?(♥)
let unicodeScalarValue: String = "\u{2665}"
print(unicodeScalarValue)

// 3-7 String 타입의 다양한 기능

// 연산자를 이용한 문자열 결합
let hello: String = "Hello"
let yagom: String = "yagom"
var greeting: String = hello + " " + yagom  + "!"
print(greeting)

greeting = hello
greeting += " "
greeting += yagom
greeting += "!"
print(greeting)

// 연산자를 이용한 문자열 비교
var isSameString: Bool = false

isSameString = hello == "Hello"
print(isSameString) // true

isSameString = hello == "hello"
print(isSameString) // false

isSameString = yagom == "yagom"
print(isSameString) // true

isSameString = hello == yagom
print(isSameString) // false

// 메서드를 통한 접두어, 접미어 확인
var hasPrefix: Bool = false  // 접두어 확인
hasPrefix = hello.hasPrefix("He")
print(hasPrefix) // true

hasPrefix = hello.hasPrefix("HE")
print(hasPrefix) // false

var hasSuffix: Bool = false  // 접미어 확인
hasSuffix = hello.hasSuffix("He")
print(hasSuffix) // false

hasSuffix = hello.hasSuffix("llo")
print(hasSuffix) // true

// 메서드를 이용한 대소문자 변환
var convertedString: String = String()
convertedString = hello.uppercased()
print(convertedString) // HELLO

convertedString = hello.lowercased()
print(convertedString) // hello

// 프로퍼티를 이용한 빈 문자열 확인
var isEmptyString: Bool = false
isEmptyString = greeting.isEmpty
print(isEmptyString) // false

greeting = ""
isEmptyString = greeting.isEmpty
print(isEmptyString) // true

// 프로퍼티를 이용한 문자열 길이 확인
print(greeting.count)

print(hello.count)

greeting = "안녕"
print(greeting.count)

// 코드상에서 여러 줄의 문자열을 직접 쓰고 싶다면 큰따옴표 세 개를 사용하면 됩니다.
// 큰따옴표 세 개를 써주고 한 줄을 내려써야 합니다.
// 마지막 줄도 큰따옴표 세 개는 한 줄 내려써야 합니다.
greeting = """
    안녕하세요 저는 야곰입니다.
    스위프트를 잘하고 싶어요!
    잘 부탁합니다!
    """
print(greeting)

// 3-8 문자열 내 특수문자 사용
print("문자열 내부에\n 이런 \"특수문자\"를\t사용하면 \\이런 놀라운 결과를 볼 수 있습니다.")
print(#"문자열 내부에서 특수문자를 사용하기 싫다면 문자열 앞, 뒤에 #을 붙여주세요.\n"#)
let number: Int = 100
print(#"특수문자를 사용하지 않을 때도 문자열 보간법을 사용하고 싶다면 \#(number) 이렇게 해보세요"#)
