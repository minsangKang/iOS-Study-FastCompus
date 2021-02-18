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
