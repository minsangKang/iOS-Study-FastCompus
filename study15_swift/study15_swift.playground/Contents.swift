import UIKit

/* 도전과제 */
//1. 강의 이름, 강사 이름, 학생수를 가지는 struct 만들기 (Lecture)

/* protocol 사용 */
// CustomStringConvertible : print시 원하는 형태로 출력되게 설정
struct Lecture: CustomStringConvertible {
    var description: String {
        return "Title: \(name), Instructor: \(instructor)"
    }
    let name: String
    let instructor: String
    let studentsNumber: Int
}

//2. 강의 array와 강사 이름을 받아서 해당 강사의 강의 이름을 출력하는 함수 만들기
func printLectureName(lects: [Lecture], instructor: String) {
    //1. 일반적인 for문을 통한 방법
    var result = ""
    for lecture in lects {
        if lecture.instructor == instructor {
            result = lecture.name
        }
    }
    print("--> Lecture Name : \(result)")
    
    //2. closure, optional 사용한 방법
    let lectureName = lects.first { lec in
        return lec.instructor == instructor
    }?.name ?? ""
    print("--> Lecture Name : \(lectureName)")
}

//3. 강의 3개를 만들고 강사 이름으로 강의 찾기
let Lecture1 = Lecture(name: "iOSStudy", instructor: "FastCampus", studentsNumber: 500)
let Lecture2 = Lecture(name: "iOS", instructor: "FC", studentsNumber: 500)
let Lecture3 = Lecture(name: "ios", instructor: "fc", studentsNumber: 500)
let Lectures = [Lecture1, Lecture2, Lecture3]

printLectureName(lects: Lectures, instructor: "FC")

// 프로토콜 내용 출력
print(Lecture1)
