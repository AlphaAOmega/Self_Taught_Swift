import UIKit

enum VendingMachineError: Error {
    case invalidSelection
    case insufficientFunds(coinsNeeded: Int)
    case outOfStock
}

// MARK:-

// 28-2 자판기 동작 도중 발생한 오류 던지기
struct Item {
    var price: Int
    var count: Int
}

class VendingMachine {
    var inventory = [
        "Candy Bar" : Item(price: 12, count: 7),
        "Chips" : Item(price: 10, count: 4),
        "Biscuit" : Item(price: 7, count: 11)
    ]
    
    var coinsDeposited = 0
    
    func dispense(snack: String) {
        print("\(snack) 제공")
    }
    
    func vend(itemNamed name: String) throws {
        guard let item = self.inventory[name] else {
            throw VendingMachineError.invalidSelection
        }
        
        guard item.count > 0 else {
            throw VendingMachineError.outOfStock
        }
        
        guard item.price <= self.coinsDeposited else {
            throw VendingMachineError.insufficientFunds(coinsNeeded: item.price - self.coinsDeposited)
        }
        
        self.coinsDeposited -= item.price
        
        var newItem = item
        newItem.count -= 1
        self.inventory[name] = newItem
        
        self.dispense(snack: name)
    }
}

let favoriteSnacks = [
    "yagom" : "Chips",
    "jinsung" : "Biscuit",
    "heejin" : "Chocolate"
]

func buyFavoriteSnack(person: String, vendingMachine0: VendingMachine) throws {
    let snackName = favoriteSnacks[person] ?? "Candy Bar"
    try vendingMachine0.vend(itemNamed: snackName)
}

struct PurchasedSnack {
    let name: String
    init(name: String, vendingMachine: VendingMachine) throws {
        try vendingMachine.vend(itemNamed: name)
        self.name = name
    }
}

let machine: VendingMachine = VendingMachine()
machine.coinsDeposited = 30

var purchase: PurchasedSnack = try PurchasedSnack(name: "Biscuit", vendingMachine: machine)
// Biscuit 제공
print(purchase.name)    // Biscuit

//for (person, favoriteSnack) in favoriteSnacks {
//    print(person, favoriteSnack)
//    try buyFavoriteSnack(person: person, vendingMachine: machine)
//}
// yagom Chips
// Chips 제공
// jinsung Biscuit
// Biscuit 제공
// heejin Chocolate
// 오류 발생!



// do-catch 구문 표현법
/*
do {
    try 오류 발생 가능 코드
    오류가 발생하지 않으면 실행할 코드
} catch 오류패턴 1 {
    처리 코드
} catch 오류패턴 2 where 추가 조건 {
    처리 코드
}
*/



// 28-3 do-catch 구문을 사용하여 던져진 오류를 처리
func buyFavoriteSnack(person: String, vendingMachine: VendingMachine) {
    let snackName = favoriteSnacks[person] ?? "Candy Bar"
    tryingVend(itemNamed: snackName, vendingMachine: vendingMachine)
}

struct PurchasedSnack0 {
    let name: String
    init(name: String, vendingMachine: VendingMachine) {
        tryingVend(itemNamed: name, vendingMachine: vendingMachine)
        self.name = name
    }
}

func tryingVend(itemNamed: String, vendingMachine: VendingMachine) {
    do {
        try vendingMachine.vend(itemNamed: itemNamed)
    } catch VendingMachineError.invalidSelection {
        print("유효하지 않은 선택")
    } catch VendingMachineError.outOfStock {
        print("품절")
    } catch VendingMachineError.insufficientFunds(let coinsNeeded) {
        print("자금 부족 - 동전 \(coinsNeeded)개를 추가로 지급해주세요.")
    } catch {
        print("그 외의 오류 발생 : ", error)
    }
}

let machine0: VendingMachine = VendingMachine()
machine0.coinsDeposited = 20

var purchase0: PurchasedSnack0 = PurchasedSnack0(name: "Biscuit", vendingMachine: machine0)
// Biscuit 제공

print(purchase0.name)   // Biscuit

purchase0 = PurchasedSnack0(name: "Ice Cream", vendingMachine: machine0)
// 유효하지 않은 선택

print(purchase0.name)   // Ice Cream

for (person, favoriteSnack) in favoriteSnacks {
    print(person, favoriteSnack)
    buyFavoriteSnack(person: person, vendingMachine: machine0)
}
// yagom Chips
// Chips 제공
// jinsung Biscuit
// 자금 부족 - 동전 4개를 추가로 지급해주세요.
// heejin Chocolate
// 유효하지 않은 선택
// (딕셔너리는 순서가 없기 때문에 출력할 때 마다 순서가 다름)
