import UIKit

// 28-4 옵셔널 값으로 오류를 처리
func someThrowingFunction(shouldThrowError: Bool) throws -> Int {
    if shouldThrowError {
        enum SomeError: Error {
            case justSomeError
        }
        
        throw SomeError.justSomeError
    }
    
    return 100
}

let x: Optional = try? someThrowingFunction(shouldThrowError: true)
print(x)    // nil

let y: Optional = try? someThrowingFunction(shouldThrowError: false)
print(y)    // OPtional(100)



// 28-5 옵셔널 값으로 오류를 처리하는 방법과 기존 옵셔널 반환 타입과의 결합
/*
func fetchData() -> Data? {
    if let data = try? fetchDataFromDist() {
        return data
    }
    if let data = try? fetchDataFromServer() {
        return data
    }
    return nil
}
*/


// 28-6 오류가 발생하지 않음을 확신하여 오류처리
func someThrowingFunc(shouldThrowError: Bool) throws -> Int {
    if shouldThrowError {
        enum SomeError: Error {
            case justSomeError
        }
        
        throw SomeError.justSomeError
    }
    
    return 100
}

let a: Int = try! someThrowingFunc(shouldThrowError: false)
print(a)

//let b: Int = try! someThrowingFunc(shouldThrowError: true)  // 런타임 오류!



// 28-7 오류의 다시 던지기
// 오류를 던지는 함수
func someThrowingFunct() throws {
    enum SomeError: Error {
        case justSomeError
    }
    throw SomeError.justSomeError
}

// 다시 던지기 함수
func someFunction(callback: () throws -> Void) rethrows {
    try callback()  // 다시 던지기 함수는 오류를 다시 던질 뿐 따로 처리하지는 않습니다.
}

do {
    try someFunction(callback: someThrowingFunct)
} catch {
    print(error)
}
// justSomeError



// 28-8 다시 던지기 함수의 오류 던지기
// 오류를 던지는 함수
func someThrowingFuncti() throws {
    enum SomeError: Error {
        case justSomeError
    }
    
    throw SomeError.justSomeError
}

// 다시 던지기 함수
func someFunc(callback: () throws -> Void) rethrows {
    enum AnotherError: Error {
        case justAnotherError
    }
    
    do {
        // 매개변수로 전달한 오류 던지기 함수이므로
        // catch 절에서 제어할 수 있습니다.
        try callback()
    } catch {
        throw AnotherError.justAnotherError
    }
    /*
    do {
        // 매개변수로 전달한 오류 던지기 함수가 아니므로
        // catch 절에서 제어할 수 없습니다.
        try someThrowingFuncti()
    } catch {
        // 오류 발생!
        throw AnotherError.justAnotherError
    }
    
    // catch 절 외부에서 단독으로 오류를 던질 수는 없습니다. 오류 발생!
    throw AnotherError.justAnotherError
     */
}



// 28-9 프로토코로가 상속에서 던지기 함수와 다시 던지기 함수
protocol SomeProtocol {
    func someThrowingFunctionFromProtocol(callback: () throws -> Void) throws
    func someRethrowingFunctionFromProtocol(callback: () throws -> Void) rethrows
}

class SomeClass: SomeProtocol {
    func someThrowingFunction(callback: () throws -> Void) throws { }
    func someFunction(callback: () throws -> Void) rethrows { }
    
    // 던지기 메서드는 다시 던지기 메서드를 요구하는 프로토콜을 충족할 수 없습니다.
    // 오류 발생!
    
    // func someRethrowingFunctionFromProtocol(callback: () throws -> Void) throws {
    // }
    func someRethrowingFunctionFromProtocol(callback: () throws -> Void) rethrows {
    }
    
    // 다시 던지기 메서드는 던지기 메서드를 요구하는 프로토콜의 요구사항에 부합합니다.
    func someThrowingFunctionFromProtocol(callback: () throws -> Void) rethrows {
    }
}

class SomeChildClass: SomeClass {
    // 부모클래스의 던지기 메서드는 자식클래스에서 다시 던지기 메서드로 재정의 할 수 있습니다.
    override func someThrowingFunction(callback: () throws -> Void) rethrows { }
    
    // 부모클래스의 다시 던지기 메서드는 자식클래스에서 던지기 메서드로 재정의할 수 없습니다.
    // 오류 발생!
    // override func someFunction(callback: () throws -> Void) throws { }
}

