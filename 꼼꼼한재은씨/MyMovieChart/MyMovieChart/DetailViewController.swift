//
//  DetailViewController.swift
//  MyMovieChart
//
//  Created by prologue on 2015. 7. 2..
//  Copyright © 2015년 SwiftBook. All rights reserved.
//

import UIKit

class DetailViewController : UIViewController, UIWebViewDelegate {
    
    @IBOutlet var navibar: UINavigationItem!
    
    @IBOutlet var wv: UIWebView!
    
    @IBOutlet var spinner: UIActivityIndicatorView!
    
    // 목록에서 넘겨주는 영화 데이터를 받을 변수
    var mvo : MovieVO? = nil
    
    override func viewDidLoad() {
        self.wv.delegate = self
        
        NSLog("linkurl = \(self.mvo?.detail), title=\(self.mvo?.title)")
        
        // 내비게이션 바의 타이틀에 영화명을 출력해준다.
        self.navibar.title = self.mvo?.title // 옵셔널 체인으로 처리되어 있으므로 예외처리에서 제외
        
        if let url = self.mvo?.detail {
            if let urlObj = NSURL(string: url) {
                let req = NSURLRequest(URL:urlObj)
                self.wv.loadRequest(req)
            } else { // URL 형식이 잘못되었을 경우에 대한 예외처리
                
                // 경고창 형식으로 오류 메세지를 표시해준다.
                let alert = UIAlertController(title: "오류", message: "잘못된 URL입니다", preferredStyle: .Alert)
                let cancelAction = UIAlertAction(title: "확인", style: .Cancel) { (_) in
                    // 이전 페이지로 되돌려보낸다.
                    self.navigationController?.popViewControllerAnimated(true)
                }
                
                alert.addAction(cancelAction)
                self.presentViewController(alert, animated: false, completion: nil)
            }
        } else { // URL 값이 전달되지 않았을 경우에 대한 예외처리
            
            // 경고창 형식으로 오류 메세지를 표시해준다.
            let alert = UIAlertController(title: "오류", message: "필수 파라미터가 누락되었습니다.", preferredStyle: .Alert)
            let cancelAction = UIAlertAction(title: "확인", style: .Cancel) { (_) in
                // 이전 페이지로 되돌려보낸다.
                self.navigationController?.popViewControllerAnimated(true)
            }
            
            alert.addAction(cancelAction)
            self.presentViewController(alert, animated: false, completion: nil)

        }
    }
    
    // 웹 뷰가 웹페이지를 로드하기 시작할 때
    func webViewDidStartLoad(webView: UIWebView) {
        self.spinner.startAnimating() // 인디케이터 뷰의 애니메이션을 실행
    }
    
    // 웹 뷰가 웹페이지 로드를 완료했을 때
    func webViewDidFinishLoad(webView: UIWebView) {
        self.spinner.stopAnimating() // 인디케이터 뷰의 애니메이션을 중지
    }

    // 웹 뷰가 웹페이지 로드를 실패했을 때
    func webView(webView: UIWebView, didFailLoadWithError error: NSError?) {
        self.spinner.stopAnimating() // 인디케이터 뷰의 애니메이션을 중지

        // 경고창 형식으로 오류 메세지를 표시해준다.
        let alert = UIAlertController(title: "오류", message: "상세페이지를 읽어오지 못했습니다", preferredStyle: .Alert)
        let cancelAction = UIAlertAction(title: "확인", style: .Cancel) { (_) in
            // 이전 페이지로 되돌려보낸다.
            self.navigationController?.popViewControllerAnimated(true)
        }
        
        alert.addAction(cancelAction)
        self.presentViewController(alert, animated: false, completion: nil)
    }
}
