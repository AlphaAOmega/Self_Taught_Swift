import UIKit

func balance(_ x: inout Int, _ y: inout Int) {
    let sum = x + y
    x = sum / 2
    y = sum - x
}

struct GamePlayer {
    var name: String
    var health: Int
    var energy: Int
    
    static let maxHealth = 10
    
    mutating func restoreHealth() {
        self.health = GamePlayer.maxHealth
    }
    
    mutating func shareHealth(with teammate: inout GamePlayer) {
        balance(&teammate.health, &health)
    }
}

var oscar: GamePlayer = GamePlayer(name: "Oscar", health: 10, energy: 10)

// MARK:- 이전 자료

// 29-9 프로퍼티 접근 중 메모리 접근 충돌
// balance(&oscar.health, &oscar.energy)
// 1개의 인스턴스에 동시에 쓰기 접근을 함으로 충돌할 수 밖에 없음



// 29-10 전역변수와 지역변수의 메모리 접근의 차이
func someFunction() {
    var oscar = GamePlayer(name: "Oscar", health: 8, energy: 10)
    balance(&oscar.health, &oscar.energy)
    print(oscar.health)
}
someFunction()
