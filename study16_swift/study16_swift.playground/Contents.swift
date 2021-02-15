import UIKit

/* properties 프로퍼티 : data들 */
/* stored property : 변수에 저장되어 있는 값 */
/* computed property : 직접 저장하지 않고, 저장된 정보를 이용해서 가공, 혹은 계산된 값을 제공할 때 사용 */
/* type property : 생성된 instance에 상관없이 struct의 타입 자체의 속성을 정하고 싶을 때 사용 */
struct Lecture: CustomStringConvertible {
    //computed property : 아래 정보들을 통해 계산된 값을 제공
    var description: String {
        return "Title: \(name), Instructor: \(instructor)"
    }
    //stored property : 값을 저장
    let name: String
    let instructor: String
    let studentsNumber: Int
}


struct Person {
    //stored property
    var firstName: String
    var lastName: String
    //computed property
    var fullName: String {
        get {
            return "\(firstName) \(lastName)"
        }
        set {
            if let firstName = newValue.components(separatedBy: " ").first {
                self.firstName = firstName
            }
            if let lastName = newValue.components(separatedBy: " ").last {
                self.lastName = lastName
            }
        }
    }
    //type property
    static let isAlien: Bool = false
}
var person = Person(firstName: "Jason", lastName: "Lee")
person.firstName
person.lastName

person.firstName = "Jim"
person.lastName = "Kim"

person.firstName
person.lastName
//get
person.fullName
//set
person.fullName = "Min Sang"
person.fullName

Person.isAlien
