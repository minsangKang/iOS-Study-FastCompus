import UIKit
import Foundation

/* 반복문 while */
/* 조건 → 코드수행 */
var i = 10
print("--- while")
while i < 10 {
    print(i)
    
    if i == 5 {
        break
    }
    
    i += 1
}


/* 반복문 repeat */
/* 코드수행 → 조건 */
print("--- repeat")
i = 10
repeat {
    print(i)
    i += 1
} while i < 10


/* 반복문 for loop */
let closedRange = 0...10 //0 ~ 10 : 11가지
let halfClosedRange = 0..<10 //0 ~ 9 : 10가지

var sum = 0
for i in closedRange {
    print("--> \(i)")
    sum += i
}
print("--> total sum: \(sum)")

sum = 0
for i in halfClosedRange {
    print("--> \(i)")
    sum += i
}
print("--> total sum: \(sum)")


/* 사인 그래프 sin */
/* import Foundation 필요 */
var sinValue: CGFloat = 0
for i in closedRange {
    sinValue = sin(CGFloat.pi/4 * CGFloat(i))
}


/* 반복문 for문 심화내용 */
let name = "Jason"
for _ in closedRange {
    print("--> name: \(name)")
}

for i in closedRange {
    if i%2 == 0 {
        print("--> 짝수: \(i)")
    }
}

for i in closedRange where i%2 == 0 {
    print("--> 짝수: \(i)")
}

for i in closedRange {
    if i == 3 {
        continue
    }
    print("--> \(i)")
}

for i in closedRange {
    for j in closedRange {
        print("gugu -> \(i) * \(j) = \(i*j)")
    }
}


/* switch */
/* 해당되는 케이스가 있는경우 실행 후 switch를 종료한다 */
var num = 10
switch num {
case 0:
    print("--> 0 입니다.")
case 0...10:
    print("--> 0 10 사이 입니다. ")
case 10:
    print("--> 10 입니다. ")
default:
    print("--> 나머지 입니다. ")
}

let pet = "bird"
switch pet {
case "dog", "cat", "bird":
    print("--> 집동물이네요?")
default:
    print("--> 잘 모르겠습니다")
}


num = 20
switch num {
case _ where num%2 == 0:
    print("--> 짝수")
default:
    print("--> 홀수")
}


let coordinate = (x: 4, y: 4)
switch coordinate {
case (0, 0):
    print("--> 원점 이네요")
case (let x, 0):
    print("--> x축 이네요, x:\(x)")
case (0, _):
    print("--> y축 이네요")
case (let x, let y) where x == y:
    print("--> x랑 y랑 같음 x,y = \(x),\(y)")
case (let x, let y):
    print("--> 좌표 어딘가 x,y = \(x),\(y)")
}
