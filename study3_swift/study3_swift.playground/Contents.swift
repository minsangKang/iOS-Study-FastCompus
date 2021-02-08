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


let name = "Jason"
for _ in closedRange {
    print("--> name: \(name)")
}
