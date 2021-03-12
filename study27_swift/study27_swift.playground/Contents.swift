import UIKit

//URLSession

//1. URLSessionConfiguration
//2. URLSession
//3. URLSessionTask 를 이용해서 서버와 네트워킹

//URLSessionTask

//- dataTask
//- uploadTask
//- downloadTask

//1. URLSessionConfiguration
let config = URLSessionConfiguration.default
//2. URLSession
let session = URLSession(configuration: config)

//URL Components
var urlComponents = URLComponents(string: "https://itunes.apple.com/search?")!
let mediaQuery = URLQueryItem(name: "media", value: "music")
let entityQuery = URLQueryItem(name: "entity", value: "song")
let termQuery = URLQueryItem(name: "term", value: "지드래곤")
urlComponents.queryItems?.append(mediaQuery)
urlComponents.queryItems?.append(entityQuery)
urlComponents.queryItems?.append(termQuery)

let requestURL = urlComponents.url!
//3. URLSessionTask 를 이용해서 서버와 네트워킹
let dataTask = session.dataTask(with: requestURL) { (data, response, error) in
    //1. error 풀어보기
    guard error == nil else { return }
    //2. response 풀어보기 -> success 숫자인지 확인
    guard let statusCode = (response as? HTTPURLResponse)?.statusCode else { return }
    let successRange = 200..<300
    guard successRange.contains(statusCode) else {
        // handle response error
        return
    }
    //3. data 풀어보기
    guard let resultData = data else { return }
    let resultString = String(data: resultData, encoding: .utf8)
    
    print("--> result: \(resultString)")
}
//task 실행
dataTask.resume()
