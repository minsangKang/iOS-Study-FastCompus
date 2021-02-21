import UIKit

// 과제1. 최애 음식 이름을 담는 변수 (String?)
var favoriteFood: String? = "치킨"

// 과제2. 옵셔널 바인딩을 이용해서 값을 확인해보기
func checkFoodName(from: String?) {
    if let foodName = from {
        print(foodName)
    } else {
        print("좋아하는 음식 없음")
    }
}
checkFoodName(from: favoriteFood)

// 과제3. 닉네임을 받아서 출력하는 함수 만들기, 조건 입력 파라미터는 String?
func printNickname(name: String?) {
    guard let NAME = name else {
        print("닉네임이 없다!")
        return
    }
    print("닉네임: \(NAME)")
}
printNickname(name: "fdee")
