import UIKit

var str = "Hello, playground"
/* 랜덤숫자 random number */
let value = arc4random_uniform(100)
/* 변수 문자열에 넣기 interpolation */
print("--> \(value)")


/* 튜플 Touple */
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

let name1 = "jin"
let name2 = "jason"
let isTwoNameSame = name1 == name2
if isTwoNameSame {
    print("--> 이름이 같다")
} else {
    print("--> 이름이 다르다")
}
