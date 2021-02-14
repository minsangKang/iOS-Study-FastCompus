import UIKit

/* set 집합 */
var someArray: Array<Int> = [1, 2, 3, 1]
var someSet: Set<Int> = [1, 2, 3, 1]

//비었는지 여부
someSet.isEmpty
//개수
someSet.count
//포함여부
someSet.contains(4)
someSet.contains(1)
//새로운값 추가
someSet.insert(5)
someSet
//값 삭제
someSet.remove(1)
someSet
