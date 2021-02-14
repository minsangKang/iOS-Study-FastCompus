import UIKit

/* closure 실습 */
/*
{ ( "parameters" ) -> "return type" in
    "statements"
*/

// ex1) 초심플 closure
let choSimpleClosure = {
    
}
choSimpleClosure()

// ex2) 코드블록을 구현한 clsure
let choSimpleClosure2 = {
    print("Hello, 클로져, 코로나 하이!")
}
choSimpleClosure2()

// ex3) 인풋 파라미터를 받는 closure
let choSimpleClosure3: (String) -> Void = { name in
    print("Hello, 클로져, 코로나 하이! 나의 이름은 \(name) 입니다")
}
choSimpleClosure3("Jason")

// ex4) 값을 리턴하는 closure
let choSimpleClosure4: (String) -> String = { name in
    let message = "iOS 개발 만만세, \(name)님 경제적 자유를 얻으실 거에요!"
    return message
}
let result = choSimpleClosure4("Jason")
print(result)

// ex5) closure를 파라미터로 받는 함수
func someSimpleFunction(choSimpleClosure: () -> Void) {
    print("함수에서 호출이 되었어요")
    choSimpleClosure()
}
someSimpleFunction(choSimpleClosure: {
    print("헬로 코로나 from closure")
})


// ex6) trailing closure
func someSimpleFunction(message: String, choSimpleClosure: () -> Void) {
    print("함수에서 호출이 되었어요, 메세지는 \(message)")
    choSimpleClosure()
}
someSimpleFunction(message: "코로나 극혐", choSimpleClosure: {
    print("from closure")
})
someSimpleFunction(message: "코로나 극혐") {
    print("from closure")
}
