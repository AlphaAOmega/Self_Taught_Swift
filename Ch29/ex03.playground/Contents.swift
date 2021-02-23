import UIKit

// 29-5 복수의 입출력 매개변수로 하나의 변수를 전달하여 메모리 접근 충돌
func balance(_ x: inout Int, _ y: inout Int) {
    let sum = x + y
    x = sum / 2
    y = sum - x
}
// MARK:-

// 메서드 내부에서 self 접근의 충돌

// 29-6 게임캐릭터를 정의한 GamePlayer 구조체
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



// 29-7 메모리 접근 충돌이 없는 shareHealth(with:) 메서드 호출
var oscar: GamePlayer = GamePlayer(name: "Oscar", health: 10, energy: 10)
var maria: GamePlayer = GamePlayer(name: "Maria", health: 5, energy: 10)
oscar.shareHealth(with: &maria)



// 29-8 메모리 접근 충돌이 발생하는 shareHealth(with:) 메서드 호출
//oscar.shareHealth(with: &oscar)   // 오류 발생!
