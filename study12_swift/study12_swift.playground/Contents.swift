import UIKit

/* closure : 이름이 없는 메소드 */
/* func인 함수와는 다르게 var로 생성되는 메소드 개념이다 */
/* 이를통해 만들어진 closure를 파라미터로 받는 func를 만들 수 있다 */

/* 정확히는 func는 closure의 한가지 타입 */
/* global 함수 (func), nested 함수, closure expressions(closure) 로 세가지 타입이 있다 */

/* closure : Input -> Output*/
//정석대로 사용하는 방법
var multiplyClosure: (Int, Int) -> Int = { (a: Int, b: Int) -> Int in
    return a * b
}
//간편하게 사용하는 방법
var subClosure: (Int, Int) -> Int = { a, b in
    return a - b
}
//제일 짧은코드
var sumClosure: (Int, Int) -> Int = { $0 + $1 }

let result = multiplyClosure(4, 2)
let result2 = subClosure(4, 2)
let result3 = sumClosure(4, 2)

/* closure : No Input -> No Output */
let voidClosure: () -> Void = {
    print("iOS Hello")
}
voidClosure

/* closure를 파라미터로 받는 함수 */
func operateTwoNum(a: Int, b: Int, operation: (Int, Int) -> Int) -> Int {
    let result = operation(a, b)
    return result
}

operateTwoNum(a: 4, b: 2, operation: multiplyClosure)
operateTwoNum(a: 4, b: 2, operation: sumClosure)
operateTwoNum(a: 4, b: 2) {a, b in
    return a / b
}


/* capturing values */
/* scope를 벗어나더라도 사용이 가능한 개념 */
var count = 0
let incrementer = {
    count += 1
}

incrementer()
incrementer()
incrementer()
incrementer()
count

/* first class type */
/* 변수에 할당할 수 있다 */
/* 인자로 받을 수 있다 */
/* 리턴할 수 있다 */

/* closure 사용목적 */
/* 1. completion block : 비동기에서 앞선 작업이 종료된 후 작업이 수행될 경우 closure를 사용한다 */
/* 2. higher order functions : 곡예함수(함수로 인자로 받을 수 있는 함수)를 즉시 생성하여 사용할 때 closure를 사용한다 */
