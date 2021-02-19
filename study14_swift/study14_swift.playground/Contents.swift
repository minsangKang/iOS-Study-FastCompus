import UIKit

/* structure 구조체 */
/* 의미적으로 관계가 있는 것들을 묶어서 표현 */
/* structure vs class */
/* structure : value 타입 : 값이 복사되어 할당된다 -> Stack에 저장 */
/* class : reference 타입 : 값이 참조되는 형태이다 -> Heap에 저장 */

// 문제: 가장 가까운 편의점 찾기
/*----------------------- struct 사용전 -------------------------*/

// 주어진 편의점 정보
let store1 = (x: 3, y: 5, name: "gs")
let store2 = (x: 4, y: 6, name: "seven")
let store3 = (x: 1, y: 7, name: "cu")

// 거리 구하는 함수
func distance(current: (x: Int, y: Int), target: (x: Int, y: Int)) -> Double {
    // 피타고라스..
    let distanceX = Double(target.x - current.x)
    let distanceY = Double(target.y - current.y)
    let distance = sqrt(distanceX * distanceX + distanceY * distanceY)
    return distance
}

// 가장 가까운 편의점 프린트하는 함수
func printClosestStore(currentLocation:(x: Int, y: Int), stores:[(x: Int, y: Int, name: String)]) {
    var closestStoreName = ""
    var closestStoreDistance = Double.infinity

    for store in stores {
        let distanceToStore = distance(current: currentLocation, target: (x: store.x, y: store.y))
        closestStoreDistance = min(distanceToStore, closestStoreDistance)
        if closestStoreDistance == distanceToStore {
            closestStoreName = store.name
        }
    }
    print("Closest store: \(closestStoreName)")
}

// Stores Array 세팅, 현재 내 위치 세팅
let myLocation = (x: 2, y: 2)
let stores = [store1, store2, store3]

// printClosestStore 함수이용해서 현재 가장 가까운 스토어 출력하기
printClosestStore(currentLocation: myLocation, stores: stores)



/*----------------------- struct 사용후 -------------------------*/

// Improve Code
// - make Location struct
struct Location {
    let x: Int
    let y: Int
}
// - make Store struct
struct Store {
    let loc: Location
    let name: String
}

// 주어진 편의점 정보
let store1_after = Store(loc: Location(x: 3, y: 5), name: "gs")
let store2_after = Store(loc: Location(x: 4, y: 6), name: "seven")
let store3_after = Store(loc: Location(x: 1, y: 7), name: "cu")

// 거리 구하는 함수
func distance_after(current: Location, target: Location) -> Double {
    // 피타고라스..
    let distanceX = Double(target.x - current.x)
    let distanceY = Double(target.y - current.y)
    let distance = sqrt(distanceX * distanceX + distanceY * distanceY)
    return distance
}

// 가장 가까운 편의점 프린트하는 함수
func printClosestStore_after(currentLocation: Location, stores:[Store]) {
    var closestStoreName = ""
    var closestStoreDistance = Double.infinity

    for store in stores {
        let distanceToStore = distance_after(current: currentLocation, target: store.loc)
        closestStoreDistance = min(distanceToStore, closestStoreDistance)
        if closestStoreDistance == distanceToStore {
            closestStoreName = store.name
        }
    }
    print("Closest store: \(closestStoreName)")
}

// Stores Array 세팅, 현재 내 위치 세팅
let myLocation_after = Location(x: 2, y: 5)
let stores_after = [store1_after, store2_after, store3_after]

// printClosestStore 함수이용해서 현재 가장 가까운 스토어 출력하기
printClosestStore_after(currentLocation: myLocation_after, stores: stores_after)



/*----------------------- struct 메소드 추가 -------------------------*/

struct Store2 {
    let loc: Location
    let name: String
    let deliveryRange = 2.0
    
    func isDeliverable(userLoc: Location) -> Bool {
        let distanceToStore = distance_after(current: userLoc, target: loc)
        return distanceToStore <= deliveryRange
    }
}

// 가장 가까운 편의점 프린트하는 함수
func printClosestStore_after2(currentLocation: Location, stores:[Store2]) {
    var closestStoreName = ""
    var closestStoreDistance = Double.infinity
    //배송여부 추가
    var isDeliverable = false

    for store in stores {
        let distanceToStore = distance_after(current: currentLocation, target: store.loc)
        closestStoreDistance = min(distanceToStore, closestStoreDistance)
        if closestStoreDistance == distanceToStore {
            closestStoreName = store.name
            //배송여부 확인
            isDeliverable = store.isDeliverable(userLoc: currentLocation)
        }
    }
    print("Closest store: \(closestStoreName), isDeliverable: \(isDeliverable)")
}

// 주어진 편의점 정보
let store1_after2 = Store2(loc: Location(x: 3, y: 5), name: "gs")
let store2_after2 = Store2(loc: Location(x: 4, y: 6), name: "seven")
let store3_after2 = Store2(loc: Location(x: 1, y: 7), name: "cu")

// Stores Array 세팅
let stores_after2 = [store1_after2, store2_after2, store3_after2]

// printClosestStore 함수이용해서 현재 가장 가까운 스토어 출력하기
printClosestStore_after2(currentLocation: myLocation_after, stores: stores_after2)



/*----------------------- struct vs class -------------------------*/
struct PersonStruct {
    var name: String
    var age: Int

    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}
class PersonClass {
    var name: String
    var age: Int

    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}

let pClass1 = PersonClass(name: "Jason", age: 5)
let pClass2 = pClass1
pClass2.name = "Hey"

pClass1.name
pClass2.name

var pStruct1 = PersonStruct(name: "Jason", age: 5)
var pStruct2 = pStruct1
pStruct2.name = "Hey"

pStruct1.name
pStruct2.name
