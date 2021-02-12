import UIKit

// external name : 함수 사용시 사용되는 파라미터 별칭
// parameter : 함수 내에서 사용되는 변수 이름
// 다양한 반환 내용이 필요할 때 overload를 사용한다

func printTotalPrice(price: Int, count: Int) {
    print("Total Price: \(price * count)")
}
/* overload : 같은 이름, 다른 행동 */
func printTotalPrice(가격: Double, 개수: Double) {
    print("총 가격은 \(가격 * 개수)")
}

/* in out parameter */
/* parameter 는 변하지 않는 let 변수이다 */
/* 변수로 사용하려면 inout 키워드가 필요하다 */
/* 또한 함수를 사용시에 변수에 & 기호가 필요하다 */
var value = 3
func incrementAndPrint(_ value: inout Int) {
    value += 1
    print(value)
}
incrementAndPrint(&value)


/* function as a parameter : 함수를 파라미터로 넘기는 방법 */
/* 함수를 파라미터로 사용시 타입이 같아야만 한다 */
func add(_ a: Int, _ b: Int) -> Int {
    return a + b
}
func subtract(_ a: Int, _ b: Int) -> Int {
    return a - b
}

var function = add
function(4, 2)
function = subtract
function(4, 2)

func printResult(_ function: (Int, Int) -> Int, _ a: Int, b: Int) {
    let result = function(a, b)
    print(result)
}
printResult(add, 10, b: 5)
printResult(subtract, 10, b: 5)
