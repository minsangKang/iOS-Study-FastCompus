import UIKit

/* class : heap 영역에 저장된다 */
/* reference 타입을 저장할 때 사용된다.
   속도 : heap 보다 slow
   큰 메모리 툴
   시스템에서 동적으로 할당이 가능하다.
   자동으로 데이터를 제거하지 않는다.
   주소를 저장하는 변수는 stack에 저장된다 */

//struct 구조
struct PersonStruct {
    //properties
    var firstName: String
    var lastName: String
    var fullName: String {
        return "\(firstName) \(lastName)"
    }
    //method
    mutating func uppercaseName() {
        //String - uppercased() : 대문자로 변환하는 메소드
        firstName = firstName.uppercased()
        lastName = lastName.uppercased()
    }
    //struct의 경우 init이 없어도 된다는 특징이 있다
    init(firstN: String, lastN: String) {
        self.firstName = firstN
        self.lastName = lastN
    }
}

//class 구조
class PersonClass {
    //properties
    var firstName: String
    var lastName: String
    var fullName: String {
        return "\(firstName) \(lastName)"
    }
    //class의 경우 mutating을 사용하지 않는다
    func uppercaseName() {
        //String - uppercased() : 대문자로 변환하는 메소드
        firstName = firstName.uppercased()
        lastName = lastName.uppercased()
    }
    //class의 경우 init이 필수로 있어야 한다
    init(firstN: String, lastN: String) {
        self.firstName = firstN
        self.lastName = lastN
    }
}

//struct vs class 값 비교
var personStruct1 = PersonStruct(firstN: "Jason", lastN: "Lee")
var personStruct2 = personStruct1

var personClass1 = PersonClass(firstN: "Jason", lastN: "Lee")
var personClass2 = personClass1

personStruct2.firstName = "Jay"
personStruct1.fullName
personStruct2.fullName

personClass2.firstName = "Jay"
personClass1.fullName
personClass2.fullName
//동적으로 새로운 클래스 생성 후 비교
personClass2 = PersonClass(firstN: "Bob", lastN: "Lee")
personClass1.fullName
personClass2.fullName
//참조값을 동일하게 설정
personClass1 = personClass2
personClass1.fullName
personClass2.fullName


/* struct, class 사용용도 구별 */
//struct 사용의 경우
//1. 두 object를 "같다", "다르다"로 비교해야 하는 경우 사용된다
//let point1 = Point(x: 3, y: 5)
//let point2 = Point(x: 3, y: 5)
//2. copy된 각 객체들이 독립적인 상태를 가져야 하는 경우 사용된다
//var myMac = Mac(owner: "Jason")
//var yourMac = myMac
//yourMac.owner = "Jay"
//
//myMac.owner
//yourMac.owner
//3. 코드에서 object의 데이터를 여러 스레드 걸쳐 사용할 경우 사용된다
//-> 각 스레드에서 유니크한 struct 값을 사용하기 때문에 안전하다

//class 사용의 경우
//1. 두 object의 인스턴스 자체가 같음을 확인해야 할 때 사용된다
//2. 하나의 객체가 필요하고, 여러 대상에 의해 접근되고 변경이 필요한 경우 사용된다
