import UIKit

// 배열, 딕셔너리, 세트

// 4-6 배열의 선언과 생성

// 대괄호를 사용하여 배열임을 표협합니다.
var names0: Array<String> = ["yagom", "chulsoo", "younghee", "yagom"]

// 위 선언과 정확히 동일한 표현입니다. [String]은 Array<String>의 축약 표현입니다.
var names1: [String] = ["yagom", "chulsoo", "younghee", "yagom"]

var emptyArray0: [Any] = [Any]()         // Any 데이터를 요소로 갖는 빈 배열을 생성합니다.
var emptyArray1: [Any] = Array<Any>()    // 위 선언과 동일한 동작을 하는 코드입니다.

// 배열의 타입을 정확히 명시했다면 []만으로도 빈 배열을 생성할 수 있습니다.
var emptyArray2: [Any] = []
print(emptyArray2.isEmpty)  // true
print(names0.count)         // 4



// 4-7 배열의 사용
print(names0[2])        // younghee
names0[2] = "jenny"
print(names0[2])        // jenny
// print(names0[4])     // 인덱스의 범위를 벗어나 오류가 발생합니다.

// names0[4] = "elsa"   // 인덱스의 범위를 벗어나 오류가 발생합니다.
names0.append("elsa")   // 마지막에 elsa가 추가됩니다.
names0.append(contentsOf: ["john", "max"])  // 맨 마지막에 john과 max가 추가됩니다.
names0.insert("happy", at: 2)               // 인덱스 2에 happy가 삽입됩니다.
names0.insert(contentsOf: ["jinhee", "minsoo"], at: 5)  // 인덱스 5 위치에 jinhee와 minsoo가 삽입됩니다.

print(names0[4])                        // yagom
print(names0.firstIndex(of: "yagom")!)   // 0
print(names0.firstIndex(of: "christal")) // nil
print((names0.first)!) // yagom
print((names0.last)!)  // max (나중에 여기 들어가는 !의 의미를 찾아봐야할 듯 : Force unwrap)

let firstItem: String = names0.removeFirst()        // removeFirst로 첫번째 요소를 제거하며 firstItem에 할당
let lastItem: String = names0.removeLast()          // removeLast로 마지막 요소를 제거하며 lastItem에 할당
let indexZeroItem: String = names0.remove(at: 0)    // remove(at: 0)으로 0번 요소를 삭제하며 indexZeroItem에 할당

print(firstItem)        // yagom
print(lastItem)         // max
print(indexZeroItem)    // chulsoo
print(names0[1...3])    // jenny, yagom, jinhee

// ---------------------------------------------------------------------------------------------------------



// 4-8 딕셔너리의 선언과 생성

//typealias를 통해 조금 더 단순하게 표현해볼 수도 있습니다.
typealias StringIntDictionary = [String: Int]

// 키는 String, 값은 Int 타입인 빈 딕셔너리를 생성합니다.
var numberForName3: Dictionary<String, Int> = Dictionary<String, Int>()

// 위 선언과 같은 표현입니다. [String: Int]는 Dictionary<String, Int>의 축약 표현입니다.
var numberForName0: [String: Int] = [String: Int]()

// 위 코드와 같은 동작을 합니다.
var numberForName1: StringIntDictionary = StringIntDictionary()

// 딕셔너리의 키와 값 타입을 정확히 명시해줬다면 [:]만으로도 빈 딕셔너리를 생성할 수 있습니다.
var numberForName2: [String: Int] = [:]

// 초깃값을 주어 생성해줄 수도 있습니다.
var numberForName: [String: Int] = ["yagom": 100, "chulsoo": 200, "jenny": 300]

print(numberForName.isEmpty)        // false
print(numberForName3.isEmpty)       // true
print(numberForName3.count)         // 3



// 4-9 딕셔너리의 사용

print((numberForName["chulsoo"])!) // 200
print(numberForName["minji"])   // nil

numberForName["chulsoo"] = 150
print((numberForName["chulsoo"])!) // 150

numberForName["max"] = 999      // max라는 키로 999라는 값을 추가해줍니다.
print((numberForName["max"])!)     // 999

print((numberForName.removeValue(forKey: "yagom"))!)   // 100

// 위에서 yagom 키에 해당하는 값이 이미 삭제되었으므로 nil이 반환됩니다.
// 키에 해당하는 값이 없으면 기본값을 돌려주도록 할 수도 있습니다.
print(numberForName.removeValue(forKey: "yagom"))

// yagom 키에 해당하는 값이 없으면 기본으로 0이 반환됩니다.
print(numberForName["yagom", default: 0])   // 0

// ---------------------------------------------------------------------------------------------------------



// 4-10 세트의 선언과 생성

var name0: Set<String> = Set<String>()  // 빈 세트 생성
var name1: Set<String> = []             // 빈 세트 생성

// Array와 마찬가지로 대괄호를 사용합니다.
var name: Set<String> = ["yagom", "chulsoo", "younghee", "yagom"]

// 그렇기 때문에 타입 추론을 사용하게 되면 컴파일러는 Set가 아닌 Array로 타입을 지정합니다.
var numbers = [100, 200, 300]
print(type(of: numbers))    // Array<int>

print(name.isEmpty)         // false
print(name.count)           // 3 - 중복된 값은 허용되지 않아 yagom은 1개만 남습니다.



// 4-11 세트의 사용

print(name.count)           // 3
name.insert("jenny")
print(name.count)           // 4

print(name.remove("chulsoo"))   // chulsoo
print(name.remove("john"))      // nil



// 4-12 세트의 활용 - 집합연산

let englishClassStudents: Set<String> = ["john", "chulsoo", "yagom"]
let koreanClassStudents: Set<String> = ["jenny", "yagom", "chulsoo", "hana", "minsoo"]

// 교집합 {"yagom", "chulsoo"}
let intersectSet: Set<String> = englishClassStudents.intersection(koreanClassStudents)

// 여집합의 합(= 대칭차)(배타적 논리합) {"hana", "minsoo", "john", "jenny"}
let symmetricDiffSet: Set<String> = englishClassStudents.symmetricDifference(koreanClassStudents)

// 합집합 {"minsoo", "jenny", "john", "yagom", "chulsoo", "hana"}
let unionSet: Set<String> = englishClassStudents.union(koreanClassStudents)

// 차집합 {"john"}
let subtractSet: Set<String> = englishClassStudents.subtracting(koreanClassStudents)

print(unionSet.sorted()) // ["chulsoo", "hana", "jenny", "john", "minsoo", "yagom"]



// 4-13 세트의 활용 - 포함관계 연산

let 새: Set<String> = ["비둘기", "닭", "기러기"]
let 포유류: Set<String> = ["사자", "호랑이", "곰"]
let 동물: Set<String> = 새.union(포유류)          // 새와 포유류의 합집합

print(새.isDisjoint(with: 포유류))              // 서로 배타적인지?(같은 요소가 없는지) - true
print(새.isSubset(of: 동물))                   // 새가 동물의 부분집합인가요? - true
print(동물.isSuperset(of: 포유류))              // 동물은 포유류의 전체집합인가요? - true
print(동물.isSuperset(of: 새))                 // 동물은 새의 전체집합인가요? - true

// ---------------------------------------------------------------------------------------------------------



// Tip 컬렉션에서 임의의 요소 추출과 뒤섞기
// (randomElement() - 임의의 요소를 추출, shuffle() - 메서드와 컬렉션의 요소를 임의로 섞음, shuffled() - 자신의 요소는 그대로 둔 채 임의로 순서를 섞어 반환함)

var array: [Int] = [0, 1, 2, 3, 4]
var set: Set<Int> = [0, 1, 2, 3, 4]
var dictionary: [String: Int] = ["a": 1, "b": 2, "c": 3]
var string: String = "string"

print(array.randomElement())  // 임의의 요소
print(array.shuffled())       // 뒤죽박죽된 배열, array 내부의 요소는 그대로
print(array)
array.shuffle()
print(array)                  // 뒤죽박죽된 배열

print(set.shuffled())         // 세트를 뒤섞으면 배열로 반환해줍니다.
// set.shuffle()             // 세트는 순서가 없이 떄문에 뒤섞을 수 없습니다.
print(dictionary.shuffled())  // 딕셔너리를 뒤섞으면 (키, 값)이 쌍을 이룬 튜플의 배열로 반환해줍니다.
print(string.shuffled())      // String도 컬렉션입니다.






