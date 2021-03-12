import UIKit

//URL
let urlString = "https://itunes.apple.com/search?media=music&entity=song&term=Gdragon"
let url = URL(string: urlString)

url?.absoluteString
url?.scheme
url?.host
url?.path
url?.query
url?.baseURL
// scheme + host + path + query

let baseURL = URL(string: "https://itunes.apple.com")
let relativeURL = URL(string: "search?media=music&entity=song&term=Gdragon", relativeTo: baseURL)

relativeURL?.absoluteString
relativeURL?.scheme
relativeURL?.host
relativeURL?.path
relativeURL?.query
relativeURL?.baseURL //baseURL을 설정하였기 때문에 nil 값이 아니다

//URLComponents : URL를 복합적으로 구성하는 방법
//-> 한글, 또는 띄어쓰기을 포함해야 하는 경우 사용(%인코딩)
var urlComponents = URLComponents(string: "https://itunes.apple.com/search?")

let mediaQuery = URLQueryItem(name: "media", value: "music")
let entityQuery = URLQueryItem(name: "entity", value: "song")
let termQuery = URLQueryItem(name: "term", value: "지드래곤")

urlComponents?.queryItems?.append(mediaQuery)
urlComponents?.queryItems?.append(entityQuery)
urlComponents?.queryItems?.append(termQuery)

urlComponents?.url
urlComponents?.url?.scheme
urlComponents?.string
urlComponents?.queryItems

urlComponents?.queryItems?.last?.value //value 값에 따로 접근이 편하다
