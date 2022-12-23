import UIKit




// Queue - Main, Global, Custom

// -Main
DispatchQueue.main.async {
    // UI 관련
    let view = UIView()
    view.backgroundColor = .white
}

// -Global
DispatchQueue.global(qos: .userInteractive).async {
    //진짜 핵중요, 지금 당장 해야함
}

DispatchQueue.global(qos: .userInitiated).async {
    // 거의 바로 해줘야 할 것. 사용자가 기다림
}

DispatchQueue.global(qos: .default).async {
    // 이건 굳이?
}

DispatchQueue.global(qos: .utility).async {
    // 시간이 좀 걸리는 일들, 사용자가 당장 기다리지 않는것, 네트워킹, 큰 파일 불러올때?
}

DispatchQueue.global(qos: .background).async {
    // 사용자한테 당장 인식될 필요가 없는것들, 뉴스데이터 미리 받기, 위치 업데이트 ,, 영상 다운받는 다던지
}


// -Custom Queue
let concurrentQueue = DispatchQueue(label: "concurrent", qos: .background, attributes: .concurrent)
let serialtQueue = DispatchQueue(label: "serial", qos: .background)


// 복잡한 상황

func downloadImageFromServer() -> UIImage {
    //Heavy Task
    return UIImage()
}

func updateUI(iamge: UIImage) {
    
}
DispatchQueue.global(qos: .background).async {
    let image = downloadImageFromServer()
    
    DispatchQueue.main.async {
        // update UI
        updateUI(iamge: image)
    }
}


