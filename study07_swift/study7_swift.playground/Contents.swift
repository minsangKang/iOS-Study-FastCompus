import UIKit

/* 옵셔널 optional */
/* 변수 뒤에 ?를 넣음으로서 값이 있을수도 있고 없을수도(nil) 있다는 뜻 */
var carName: String? = "Tesla"
carName = "nil"
carName = "탱크"

// 과제1. 외애하는 영화배우의 이름을 담는 변수를 작성해주세요 (string?)
var favoriteActorName: String? = "suzi"
// 과제2. let num = Int("10") -> 타입은 뭘까요 ??
let num = Int("10")

print(carName) //optional 까지 같이 출력된다

// 고급 기능 4가지
// forced unwrapping : 강제로 데이터를 접근한다
// optional binding (if let) : 부드럽게 데이터를 접근 1
// optional binding (guard) : 부드럽게 데이터를 접근 2
// nil coalescing : 값이 없으면 디폴트 값으로 설정

// forced unwrapping : 강제로 까기
print(carName!) //opstional이 제거되고 값만 출력된다

carName = nil
// optional binding (if let) : 부드럽게 까기 1
if let unwrappedCarName = carName {
    print(unwrappedCarName)
} else {
    print("Car Name 없다")
}

// optional binding (if let) : 부드럽게 까지 1
func printParsedInt(from: String) {
    if let parsedInt = Int(from) {
        print(parsedInt)
    } else {
        print("Int로 컨버팅 안된다")
    }
}
printParsedInt(from: "100")
printParsedInt(from: "hello")

// optional binding (guard) : 부드럽게 까기 2
func printParsedInt2(from: String) {
    guard let parsedInt = Int(from) else {
        print("Int로 컨버팅 안된다.")
        return
    }
    print(parsedInt)
}
printParsedInt2(from: "100")
printParsedInt2(from: "hello")


// nil coalescing : 값이 없으면 디폴트 값으로 설정
let myCarName: String = carName ?? "model S"
