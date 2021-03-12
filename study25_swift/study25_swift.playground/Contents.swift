import UIKit

//Queue - Main, Global, Custom

//Main
DispatchQueue.main.async {
    //UI update
    let view = UIView()
    view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
}

//Global
DispatchQueue.global(qos: .userInteractive).async {
    // 당장 필요한 작업
}

DispatchQueue.global(qos: .userInitiated).async {
    // 거의 바로 해줘야 할것, 사용자가 결과를 기다리는 경우
}

DispatchQueue.global(qos: .default).async {
    // global() 과 거의 유사하기에 굳이?
}

DispatchQueue.global(qos: .utility).async {
    // 시간이 좀 걸리는 일들, 사용자가 당장 기다리지 않는것, 네트워킹, 큰파일 불러올때
}

DispatchQueue.global(qos: .background).async {
    // 사용자한테 당장 인식될 필요가 없는것들, 뉴스데이터 미리 받기, 위치 업데이트, 영상 다운로드
}

//Custom Queue
let concurentQueue = DispatchQueue(label: "concurrent", qos: .background, attributes: .concurrent)
let serialQueue = DispatchQueue(label: "serial", qos: .background)




//복합적인 상황
func downloadImageFromeServer() -> UIImage {
    //Heavy Task
    return UIImage()
}

func updateUI(image: UIImage) {
    
}
DispatchQueue.global(qos: .background).async {
    //오래 걸리는 작업을 수행한다
    let image = downloadImageFromeServer()
    //즉시 화면을 업데이트 하는 작업을 수행한다
    DispatchQueue.main.async {
        updateUI(image: image)
    }
}

//Sync, Async

//Async
DispatchQueue.global(qos: .background).async {
    for i in 0...5 {
        print("😈 \(i)")
    }
}
DispatchQueue.global(qos: .userInteractive).async {
    for i in 0...5 {
        print("😎 \(i)")
    }
}

//Sync
DispatchQueue.global(qos: .background).sync {
    for i in 0...5 {
        print("😈 \(i)")
    }
}
DispatchQueue.global(qos: .userInteractive).async {
    for i in 0...5 {
        print("😎 \(i)")
    }
}
