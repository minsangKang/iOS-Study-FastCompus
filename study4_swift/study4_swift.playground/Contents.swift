import UIKit

/* function */
func printName() {
    print("--> My name is Jason")
}
printName()

// param 1개
// 숫자를 받아서 10을 곱해서 출력한다
func printMutipleOfTen(value: Int) {
    print("\(value) * 10 = \(value * 10)")
}
printMutipleOfTen(value: 5)

// param 2개
// 물건값과 개수를 받아서 전체 금액을 출력하는 함수
func printTotalPrice(price: Int, count: Int) {
    print("Total price: \(price * count)")
}
printTotalPrice(price: 1500, count: 5)

// external parameter names 설정방법
func printTotalPrice(가격 price: Int, 개수 count: Int) {
    print("Total price: \(price * count)")
}
printTotalPrice(가격: 1500, 개수: 5)

func printTotalPrice(_ price: Int, _ count: Int) {
    print("Total price: \(price * count)")
}
printTotalPrice(1500, 5)

// default value 설정방법
func printTotalPriceWithDefaultValue(price: Int = 1500, count: Int) {
    print("Total price: \(price * count)")
}
printTotalPriceWithDefaultValue(count: 5)
printTotalPriceWithDefaultValue(price: 2000, count: 5)

// 반환값이 있는 function
func totalPrice(price: Int, count: Int) -> Int {
    let totalPrice = price * count
    return totalPrice
}
let calcupatedPrice = totalPrice(price: 10000, count: 77)
