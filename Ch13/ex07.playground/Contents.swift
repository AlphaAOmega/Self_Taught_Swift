import UIKit

// 13-21 클로저를 이용한 연산 지연
// 대기 중인 손님들입니다.
var customersInLine: [String] = ["YoangWha", "Sangyong", "SungHun", "HaMi"]
print(customersInLine.count)    // 4

// 클로저를 만들어두면 클로저 내부의 코드를 미리 실행(연산)하지 않고 가지고만 있습니다.
let customerProvider: () -> String = {
    return customersInLine.removeFirst()
}
print(customersInLine.count)    // 4

// 실제로 실행합니다.
print("Now surving \(customerProvider())!") // "Now serving YongWha!"
print(customersInLine.count)    // 3



// 13-22 함수의 전달인자로 전달하는 클로저
customersInLine.insert("YoangWha", at: 0)
func serveCustomer(_ customerProvider: () -> String) {
    print("Now serving \(customerProvider())!")
}

serveCustomer( { customersInLine.removeFirst() } )  // "Now serving YongWha!"



// 13-23 자동 클로저의 사용
// customersInLine is ["YoangWha", "Sangyong", "SungHun", "HaMi"]
customersInLine.insert("YoangWha", at: 0)

func serveCustomer0(_ customerProvider: @autoclosure () -> String) {
    print("Now serving \(customerProvider())!")
}

serveCustomer0(customersInLine.removeFirst())   // "Now serving YongWha!"



// 13-24 자동 클로저의 탈출
var customersInLine1: [String] = ["minjae", "innoceive", "sopress"]

func returnProvider1(_ customerProvider: @autoclosure @escaping () -> String) -> (() -> String) {
    return customerProvider
}

let customerProvider1: () -> String = returnProvider1(customersInLine1.removeFirst())
print("Now serving \(customerProvider1())!")    // "Now serving minjae!"

