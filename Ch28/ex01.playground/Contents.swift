import UIKit

// 28-1 자판기 동작 오류의 종류를 표현한 VendingMachineError 열거형
enum VendingMachineError: Error {
    case invalidSelection
    case insufficientFunds(coinsNeeded: Int)
    case outOfStock
}
