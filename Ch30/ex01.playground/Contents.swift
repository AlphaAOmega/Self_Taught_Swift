import UIKit

// 30-1 뽑기 상품 프로토콜 정의
// 포장된 상품 프로토콜 정의
protocol WrappedPrize {
    associatedtype Prize
    
    var wrapColor: String! { get }  // 포장 색상
    var prize: Prize! { get }       // 실제 상품
}



// 30-2 포장된 상품 프로토콜 정의
protocol Gundam { }
protocol Pokemon { }

struct WrappedGundam: WrappedPrize {
    var wrapColor: String!
    var prize: Gundam!
}

struct WrappedPokemon: WrappedPrize {
    var wrapColor: String!
    var prize: Pokemon!
}



// 30-3 뽑기 기계 구조체 정의
/*
struct PrizeMachine {
    func dispenseRandomPrize() -> WrappedPrize {
        return WrappedGundam()
    }
}
 */



// 30-4 뽑기 기계 구조체 개선
struct PrizeMachine {
    func dispenseRandomPrize() -> some WrappedPrize {
        return WrappedGundam()
    }
}

let machine: PrizeMachine = PrizeMachine()
let wrappedPrize = machine.dispenseRandomPrize()
