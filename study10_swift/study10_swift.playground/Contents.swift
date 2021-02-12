import UIKit

/* 사전형 dictionary*/
// 선언하는 두가지 방법
var scoreDic: [String: Int] = ["Jason": 80, "Jay": 95, "Jake": 90]
var scoreDic2: Dictionary<String, Int> = ["Jason": 80, "Jay": 95, "Jake": 90]

//값 가져오는 방법
scoreDic["Jason"]
scoreDic["Jay"]
scoreDic["Jerry"]

//optional 사용하여 안정적으로 가져오는 방법
if let score = scoreDic["Jason"] {
    score
} else {
    //
}

//비었는지 여부 확인하는 방법
//scoreDic = [:]
scoreDic.isEmpty

//개수를 확인하는 방법
scoreDic.count

//값을 수정하는 방법
scoreDic["Jason"] = 99
scoreDic

//새로운 값을 추가하는 방법
scoreDic["Jack"] = 100
scoreDic

//특정 값을 제거하는 방법
scoreDic["Jack"] = nil
scoreDic

//전체 키,값을 for문으로 접근하는 방법
for (name, score) in scoreDic {
    print("\(name), \(score)")
}

//전체 키를 for문으로 접근하는 방법
for key in scoreDic.keys {
    print(key)
}



//1. 이름, 직업, 도시에 대해서 본인의 딕셔너리 만들기
var myDic: [String: String] = ["name": "minsang", "job": "iOS Engineer", "city": "Seoul"]

//2. 도시를 부산으로 업데이트 하기
myDic["city"] = "Busan"
myDic

//3. 딕셔너리를 받아서 이름과 도시 프린트하는 함수 만들기
//-> 파라미터로 Dictionary를 받아와 optional 사용하여 두가지 키워드를 사용하여 값을 접근한다
func printNameAndCity(dic: [String: String]) {
    if let name = dic["name"], let city = dic["city"] {
        print(name, city)
    } else {
        print("--> cannot find")
    }
}
printNameAndCity(dic: myDic)
