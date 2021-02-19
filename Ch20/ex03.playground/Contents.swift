import UIKit

// 20-12 프로토콜의 상속
protocol Readable {
    func read()
}

protocol Writable {
    func write()
}

protocol ReadSpeakable: Readable {
    func speak()
}

protocol ReadWriteSpeakable: Readable, Writable {
    func speak()
}

class SomeClass: ReadWriteSpeakable {
    func read() {
        print("Read")
    }
    
    func write() {
        print("Write")
    }
    
    func speak() {
        print("Speak")
    }
}



// 20-13 클래스 전용 프로토콜의 정의
protocol ClassOnlyProtocol: class, Readable, Writable {
    // 추가 요구사항
}

class SomeClass0: ClassOnlyProtocol {
    func read() { }
    func write() { }
}

/* 오류 발생! 해당 프로토콜은 클래스 타입에만 채택 가능합니다.
 struct SomeStruct: ClassOnlyProtocol {
    func read() { }
    func write() { }
 }
 */
