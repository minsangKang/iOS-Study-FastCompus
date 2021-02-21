import UIKit

var str = "Hello, playground"
/* 랜덤숫자 random number */
let value = arc4random_uniform(100)
/* 변수 문자열에 넣기 interpolation */
print("--> \(value)")


/* 튜플 Tuple */
let coordinates = (4, 6)
let x = coordinates.0
let y = coordinates.1

let coordinatesNamed = (x:2, y:3)
let x2 = coordinatesNamed.x
let y2 = coordinatesNamed.y

let (x3, y3) = coordinatesNamed
x3
y3


/* 불값 Boolean */
let yes = true
let no = false

let isFourGreaterThanFive = 4 > 5
if isFourGreaterThanFive {
    print("--> 참")
} else {
    print("--> 거짓")
}

/* 논리연산자 */
let name1 = "jin"
let name2 = "jason"
let isTwoNameSame = name1 == name2
if isTwoNameSame {
    print("--> 이름이 같다")
} else {
    print("--> 이름이 다르다")
}


let isJason = name2 == "jason"
let isMale = false
let jasonAndMain = isJason && isMale
let jsonOrMale = isJason || isMale


let greetingMessage: String
if isJason {
    greetingMessage = "Hello Jason"
} else {
    greetingMessage = "Hello Somebody"
}
print("MSG: \(greetingMessage)")


/* 3항연산자 */
let greetingMessage2: String = isJason ? "Hello Jason" : "Hello Somebody"
print("MSG: \(greetingMessage2)")


/* 스코프 Scope */
func hello() {
    var hours = 50
    let payPerHour = 10000
    var salary = 0

    if hours > 40 {
        let extraHours = hours - 40
        salary += extraHours * payPerHour * 2
        hours -= extraHours
    }
    salary += hours * payPerHour
    
    print(hours)
}

hello()
