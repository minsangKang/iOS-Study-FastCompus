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



//목표 : 트랙리스트 오브젝트로 가져오기

//하고 싶은 욕구 목록
//- Data -> Track 목록으로 가져오고 싶다 [Track]
//- Track 오브젝트를 만들어야겠다
//- Data에서 struct로 파싱하고 싶다 : Codable 이용해서 만들자
//- Json 파일, 데이터 -> 오브젝트 (Codable 이용)
//- Response, Track 이렇게 두개 만들어야겠다

//해야할일
//- Response, Track struct
//- struct의 프로퍼티 이름과 실제 데이터의 키와 맞추기 (Codable 디코딩하게 하기 위해서)
//- 파싱하기 (Decoding)
//- 트랙리스트 가져오기

// Task를 실행하기에 앞서 데이터를 저장하기 위한 구조 struct 작성
struct Response: Codable {
    let resultCount: Int
    let tracks: [Track]
    //실제 키와 맞추는 작업
    enum CodingKeys: String, CodingKey {
        case resultCount
        case tracks = "results"
    }
}

struct Track: Codable {
    let title: String
    let artistName: String
    let thumbnailPath: String
    //실제 키와 맞추는 작업
    enum CodingKeys: String, CodingKey {
        case title = "trackName"
        case artistName
        case thumbnailPath = "artworkUrl100"
    }
}



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
//    let resultString = String(data: resultData, encoding: .utf8)
    
    //파싱 및 트랙 가져오기
    do {
        let decoder = JSONDecoder()
        let response = try decoder.decode(Response.self, from: resultData)
        let tracks = response.tracks
        
        print("--> tracks count: \(tracks.count)")
        for i in 0...tracks.count-1 {
            print("--> Track[\(i)]")
            print("--> title: \(tracks[i].title)")
            print("--> artistName: \(tracks[i].artistName)")
            print("--> thumbnailPath: \(tracks[i].thumbnailPath)")
            print()
        }
        
    } catch let error {
        print("--> error: \(error.localizedDescription)")
    }
}
//task 실행
dataTask.resume()
