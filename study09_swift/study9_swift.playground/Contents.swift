import UIKit

/* array 선언 두가지 방법 */
/* let으로 선언시 추가(append)가 불가하다 */
var evenNumbers: [Int] = [2, 4, 6, 8]
let evenNumbers2: Array<Int> = [2, 4, 6, 8]

/* array 중요내용 4가지 */
//1. isEmpty
//2. count
//3. 접근방법
//4. index, num for문으로 : enumerated()

//추가하는 방법
evenNumbers.append(10)
evenNumbers += [12, 14, 16]
evenNumbers.append(contentsOf: [18, 20])

//비었는지 여부 확인
var isEmpty = evenNumbers.isEmpty
evenNumbers = []
isEmpty = evenNumbers.isEmpty

//개수 확인
evenNumbers = [2, 4, 6, 8]
evenNumbers.count

//첫번째 값 확인 : optional값
print(evenNumbers.first)
//let firstItem = evenNumbers.first

//evenNumbers = []
if let firstElement = evenNumbers.first {
    print("--> first item is : \(firstElement)")
}

//최소값, 최대값 확인 : optional
evenNumbers.min()
evenNumbers.max()

//값 접근하기
var firstItem = evenNumbers[0]
var secondItem = evenNumbers[1]
//index out of range : crash가 발생하기 때문에 주의해야 한다
//var twentithItem = evenNumbers[20]


//특정범위 array값 저장하기
let firstThree = evenNumbers[0...2]

//특정값 있는지 여부 확인하기
evenNumbers.contains(3)
evenNumbers.contains(4)

//특정 위치에 새로운 값을 넣는 방법 (기존 값들은 뒤로 밀린다)
evenNumbers.insert(0, at: 0)
evenNumbers

//배열 특정위치값 삭제
evenNumbers.remove(at: 0)
evenNumbers

//배열 전체 삭제
//evenNumbers.removeAll()
//evenNumbers = []

//특정 위치의 값을 update 하는 방법
evenNumbers[0] = -2
evenNumbers
evenNumbers[0...2] = [-2, -4, -6]
evenNumbers

//특정 두위치 값을 서로 바꾸는 방법
evenNumbers.swapAt(0, 1)

//배열 모든값 for로 접근하는 방법
for num in evenNumbers {
    print(num)
}

//배열의 각 인덱스, 값을 받는 방법
for(index, num) in evenNumbers.enumerated() {
    print("idx: \(index), value:\(num)")
}

//앞의 특정개수를 제외한 배열 얻는 방법 : 배열자체에 영향을 주지 않는다
let firstThreeRemoved = evenNumbers.dropFirst(3)
evenNumbers
//뒤의 특정개수를 제외한 배열 얻는 방법 : 배열자체에 영향을 주지 않는다
let lastRemoved = evenNumbers.dropLast(3)
evenNumbers

//앞의 특정개수 배열을 얻는 방법
let firstTwo = evenNumbers.prefix(2)
evenNumbers
//뒤의 특정개수 배열을 얻는 방법
let lastTwo = evenNumbers.suffix(2)
evenNumbers
