import UIKit

for i in 0...2 {
    defer {
        print("A", terminator: " ")
    }
    print(i, terminator: " ")
    
    if i % 2 == 0 {
        defer {
            print("", terminator: "\n")
        }
        
        print("It's even", terminator: " ")
    }
}



// 28-10 파일쓰기 예제에서 defer 구문 활용
/*
func writeData() {
    let file = openFile()
    
    // 함수 코드 블록을 빠져나가기 직전 무조건 실행되어 파일을 잊지 않고 닫아줍니다.
    defer {
        closeFile(file)
    }
    
    if ... {
        return
    }
    
    if ... {
        return
    }
    
    // 처리 끝
}
*/



// 28-11 파일쓰기 예제에서 defer 구문이 없다면
/*
func writeData() {
    let file = openFile()
    
    if ... {
        closeFile(file)
        return
    }
    
    if ... {
        closeFile(file)
        return
    }
    
    if ... {
        closeFile(file)
        return
    }
    
    closeFile(file)
    // 처리 끝
}
 */



// 28-12 defer 구문의 실행 순서
func someThrowingFunction(shouldThrowError: Bool) throws -> Int {
    defer {
        print("First")
    }
    
    if shouldThrowError {
        enum SomeError: Error {
            case justSomeError
        }
        
        throw SomeError.justSomeError
    }
    
    defer {
        print("Second")
    }
    
    defer {
        print("Third")
    }
    
    return 100
}

try? someThrowingFunction(shouldThrowError: true)
// First
// 오류를 던지기 직전까지 작성된 defer 구문까지만 실행됩니다.

try? someThrowingFunction(shouldThrowError: false)
// Third
// Second
// First
// 여러 개의 defer 구문이 한 범위 내부에 있다면 역순으로 실행됩니다.



// 28-13 복합적인 defer 구문의 실행 순서
// do 구문은 코드 블록 내부에 한 단계 하위의 블록을 만들고자 할 때도 사용할 수 있다.
func someFunction() {
    print("1")
    
    defer {
        print("2")
    }
    
    do {
        defer {
            print("3")
        }
        print("4")
    }
    
    defer {
        print("5")
    }
    
    print("6")
}

someFunction()

// 1
// 4
// 3
// 6
// 5
// 2
