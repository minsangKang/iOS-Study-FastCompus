import UIKit

/* 상속을 사용하는 경우 */
//1. single responsibility (단일책임)
//-> 한 클래스는 하나의 책임을 지니면 된다. 여러개의 책임을 지닐 필요가 없다!
//-> 즉 최대한 한 기능위주로 작성되어야 한다
//2. type safety (타입이 분명해야 할 때)
//3. shared base classes (다자녀가 있다)
//4. extensibility (확장성이 필요한 경우)
//5. identity (정체를 파악하기 위해서)

// 처음 코드
//struct Grade {
//    var letter: Character
//    var points: Double
//    var credits: Double
//}
//
//class Person {
//    var firstName: String
//    var lastName: String
//
//    init(firstName: String, lastName: String) {
//        self.firstName = firstName
//        self.lastName = lastName
//    }
//
//    func printMyName() {
//        print("My name is \(firstName) \(lastName)")
//    }
//}
//
//class Student: Person {
//    var grades: [Grade] = []
//}
//
//// 학생인데 운동선수
//class StudentAthlete: Student {
//    var minimumTrainingTime: Int = 2
//    var trainedTime: Int = 0
//
//    func train() {
//        trainedTime += 1
//    }
//}
//
//// 운동선인데 축구선수
//class FootballPlayer: StudentAthlete {
//    var footballTeam = "FC Swift"
//
//    override func train() {
//        trainedTime += 2
//    }
//}


struct Grade {
    var letter: Character
    var points: Double
    var credits: Double
}

class Person {
    var firstName: String
    var lastName: String

    init(firstName: String, lastName: String) {
        self.firstName = firstName
        self.lastName = lastName
    }

    func printMyName() {
        print("My name is \(firstName) \(lastName)")
    }
}

class Student: Person {
    var grades: [Grade] = []
    
    override init(firstName: String, lastName: String) {
        super.init(firstName: firstName, lastName: lastName)
    }
    
    convenience init(student: Student) {
        self.init(firstName: student.firstName, lastName: student.lastName)
    }
}

// 학생인데 운동선수
class StudentAthlete: Student {
    var minimumTrainingTime: Int = 2
    var trainedTime: Int = 0
    var sports: [String]
    
    //새로운 property가 추가되었기 때문에 init이 필요하다
    init(firstName: String, lastName: String, sports: [String]) {
        //Phase1 자식의 init이 실행된 후 부모의 init이 실행된다
        self.sports = sports
        super.init(firstName: firstName, lastName: lastName)
        //property가 셋팅되기 전에 사용하려는 경우 에러가 발생하기 때문에 순서에 주의
        //Phase2 부모 -> 자식방향
        self.train()
    }
    
    //두번째의 init
    convenience init(name: String) {
        self.init(firstName: name, lastName: "", sports: [])
    }
    
    func train() {
        trainedTime += 1
    }
}

// 운동선인데 축구선수
class FootballPlayer: StudentAthlete {
    var footballTeam = "FC Swift"

    override func train() {
        trainedTime += 2
    }
}

let student1 = Student(firstName: "Jason", lastName: "Lee")
let student2 = StudentAthlete(firstName: "Jay", lastName: "Lee", sports: ["Football"])
let student3 = StudentAthlete(name: "Mike")

let student4 = Student(student: student1)


/* designated init vs convenience init */
//de init은 super의 de init을 호출해야 한다
//con init은 같은 class 내의 init을 꼭 호출해야 한다
//결국 con init은 de init을 호출해야 한다
