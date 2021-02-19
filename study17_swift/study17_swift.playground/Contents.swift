import UIKit

struct Lecture {
    var title: String
    var maxStudents: Int = 10
    var numOfRegistered: Int = 0
    //method
    func remainSeats() -> Int {
        let remainSeats = maxStudents - numOfRegistered
        return remainSeats
    }
    //struct 내에서 변수를 수정하는 메소드의 경우 mutating 키워드 필요
    mutating func register() {
        //등록된 학생수 증가시키기
        numOfRegistered += 1
    }
    
    //type property
    static let target: String = "Anybody want to learn something"
    //type method
    static func 소속학원이름() -> String {
        return "패캠"
    }
    
}

var lec = Lecture(title: "iOS Basic")
//function
//func remainSeats(of lec: Lecture) -> Int {
//    let remainSeats = lec.maxStudents - lec.numOfRegistered
//    return remainSeats
//}
//remainSeats(of: lec)
lec.remainSeats()

lec.register()
lec.remainSeats()

Lecture.target
Lecture.소속학원이름()


/* extension을 활용하여 만들어진 struct에 메소드를 추가할 수 있다 */
struct Math {
    static func abs(value: Int) -> Int {
        if value > 0 {
            return value
        } else {
            return -value
        }
    }
}
Math.abs(value: -20)

//만들어져있는 Math struct 에 새로운 함수 추가하기
extension Math {
    static func square(value: Int) -> Int {
        return value * value
    }
    
    static func half(value: Int) -> Int {
        return value / 2
    }
}
Math.square(value: 5)
Math.half(value: 20)

//애플이 만들어 놓은 struct에 추가해서 사용할수도 있다
extension Int {
    func square() -> Int {
        return self * self
    }
    
    func half() -> Int {
        return self / 2
    }
}
var value: Int = 5
value.square()
value.half()
