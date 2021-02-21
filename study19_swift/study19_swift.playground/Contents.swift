import UIKit

//성적 struct
struct Grade {
    var letter: Character
    var points: Double
    var credits: Double
}

//사람 class
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

//학생 class
//class Student {
//    var grades: [Grade] = []
//    //중복되는 property가 보인다
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


/* ------------- 상속을 사용하여 코드중복을 없앤 후 -------------- */


//학생 class
class Student: Person {
    var grades: [Grade] = []
    //중복되는 property들은 상속받았기 때문에 그대로 사용이 가능하다!
}


let jay = Person(firstName: "Jay", lastName: "Lee")
//상속받았기 때문에 property, method를 그대로 사용할 수 있다
let jason = Student(firstName: "Jason", lastName: "Lee") //init 메소드 사용
jay.firstName
jason.firstName //fitstName 메소드 사용
jay.printMyName()
jason.printMyName() //printMyName 메소드 사용

let math = Grade(letter: "B", points: 8.5, credits: 3)
let history = Grade(letter: "A", points: 10.0, credits: 3)
jason.grades.append(math)
jason.grades.append(history)
jason.grades.count
//Person에 grades 값은 접근할 수 없다
//jay.grades


/* 상속의 규칙 */
//1. 자식은 한개의 super class만 상속을 받는다
//2. 부모는 여러 자식들을 가질 수 있다
//3. 상속의 깊이는 상관없다

//상속의 깊이 예제 : Person -> Student -> StudentAthlete
class StudentAthlete: Student {
    var minimumTraningTime: Int = 2
    var trainedTime: Int = 0
    
    func train() {
        trainedTime += 1
    }
}
//상속의 깊이 예제 : Person -> Student -> StudentAthlete -> FootballPlayer
class FootballPlayer: StudentAthlete {
    var footballTeam = "FC Swift"
    //같은 메소드를 자식에서 수정할 때 override를 사용한다
    override func train() {
        trainedTime += 2
    }
}

var athelete1 = StudentAthlete(firstName: "Yuna", lastName: "Kim")
var athelete2 = FootballPlayer(firstName: "Heung", lastName: "Son")

athelete1.firstName
athelete2.firstName

athelete1.grades.append(math)
athelete2.grades.append(math)

athelete1.minimumTraningTime
athelete2.minimumTraningTime

//상속에 따라 사용가능 메소드 차이
//athelete1.footballTeam
athelete2.footballTeam

//override 확인
athelete1.train()
athelete2.train()
athelete1.trainedTime
athelete2.trainedTime

/* StudentAthlete 클래스는 FootballPlayer 클래스를 할당할 수 있다 */
/* 즉, "super class" = "child class" 가능하다 */
athelete1 = athelete2
//좀더 정확하게 표현하기 위한 upperCast를 사용한다
athelete1 = athelete2 as StudentAthlete
//child class 내의 메소드가 실행되기 때문에 2시간이 추가된다
athelete1.train()
athelete1.trainedTime
//기존 ChildClass 내에서 선언되었던 property는 접근이 불가하다
//athelete1.footboolTeam

//downCast를 통해 FootBall로 바꿀 수 있다
if let son = athelete1 as? FootballPlayer {
    print("--> team: \(son.footballTeam)")
}


/* 상속을 사용하는 경우 */
//1. single responsibility (단일책임)
//-> 한 클래스는 하나의 책임을 지니면 된다. 여러개의 책임을 지닐 필요가 없다!
//-> 즉 최대한 한 기능위주로 작성되어야 한다
//2. type safety (타입이 분명해야 할 때)
//3. shared base classes (다자녀가 있다)
//4. extensibility (확장성이 필요한 경우)
//5. identity (정체를 파악하기 위해서)
