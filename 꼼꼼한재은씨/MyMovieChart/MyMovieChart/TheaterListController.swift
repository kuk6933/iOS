//
//  TheaterListController.swift
//  MyMovieChart
//
//  Created by prologue on 2015. 7. 2..
//  Copyright © 2015년 SwiftBook. All rights reserved.
//

import UIKit

class TheaterListController : UITableViewController {
    
    // API를 통해 불러온 데이터를 저장할 배열 변수
    var list = [NSDictionary]()
    
    // 읽어올 데이터의 시작위치
    var startPoint = 0
    
    // 테이블 뷰에 대한 IBOutlet 변수
    @IBOutlet var theaterTable: UITableView!
    
    override func viewDidLoad() {
        self.callTheaterAPI()
    }
    
    func callTheaterAPI() {
        
        // ① URL 및 인자값을 위한 변수를 선언
        let apiURL = "http://api.data.go.kr/openapi/2b429635-443e-4edf-a15e-5c77f932d412" // API 요청 주소
        let serviceKey = "W3EFuhgvsOJwC1M9f8lpkjj1391s35DUHrb97uW%2FwL39G8PvVbda7JDRaF73v6f6ALcH%2BZFLomajT%2BXbq3UcSA%3D%3D" // API 인증키
        let sList = 100 // 불러올 데이터 갯수
        let type = "json" // 데이터 형식
        
        // ② 인자값들을 요청 URL로 구성하여 NSURL 객체로 생성한다.
        if let urlObj = NSURL(string: "\(apiURL)?serviceKey=\(serviceKey)&s_page=\(self.startPoint)&s_list=\(sList)&type=\(type)") {
        
            do {
                // ③ NSString 객체를 이용하여 API를 호출하고 그 결과값을 인코딩된 문자열로 받아온다.
                let stringdata = try NSString(contentsOfURL: urlObj, encoding: 0x80000422)
            
                // ④ 문자열로 받은 데이터를 UTF-8로 인코딩처리한 NSData로 변환한다.
                let encdata = stringdata.dataUsingEncoding(NSUTF8StringEncoding)

                do {
                    // ⑤ NSData 객체를 파싱하여 NSArray 객체로 변환한다.
                    let apiArray = try NSJSONSerialization.JSONObjectWithData(encdata!, options:[]) as? NSArray
            
                    // ⑥ 읽어온 데이터를 순회하면서 self.list 배열에 추가한다
                    for obj in apiArray! {
                        self.list.append(obj as! NSDictionary)
                    }
                } catch { // 데이터를 파싱하지 못했을 경우

                    // 경고창 형식으로 오류 메세지를 표시해준다.
                    let alert = UIAlertController(title: "실패", message: "데이터 분석이 실패하였습니다", preferredStyle: .Alert)
                    alert.addAction(UIAlertAction(title: "확인", style: .Cancel, handler:nil))
                    self.presentViewController(alert, animated: false, completion: nil)
                }
            
                // ⑦ 읽어와야 할 다음 페이지의 데이터 시작 위치를 구해 저장해둔다.
                self.startPoint += sList
                
            } catch { // 데이터를 읽어오지 못했을 경우
                
                // 경고창 형식으로 오류 메세지를 표시해준다.
                let alert = UIAlertController(title: "실패", message: "데이터를 불러오는데 실패하였습니다", preferredStyle: .Alert)
                alert.addAction(UIAlertAction(title: "확인", style: .Cancel, handler:nil))
                self.presentViewController(alert, animated: false, completion: nil)
            }
        } else { // URL 정보가 잘못되어 URL 객체를 생성하지 못했을 경우

            // 경고창 형식으로 오류 메세지를 표시해준다.
            let alert = UIAlertController(title: "실패", message: "잘못된 URL입니다.", preferredStyle: .Alert)
            alert.addAction(UIAlertAction(title: "확인", style: .Cancel, handler:nil))
            self.presentViewController(alert, animated: false, completion: nil)
        }
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.list.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        // self.list 배열에서 행에 맞는 데이터를 꺼냄
        let obj = self.list[indexPath.row]
        
        // 재사용 큐로부터 tCell 식별자에 맞는 셀 객체를 전달받음
        let cell = tableView.dequeueReusableCellWithIdentifier("tCell") as! TheaterCell
        
        cell.name?.text = obj["상영관명"] as? String
        cell.tel?.text = obj["연락처"] as? String
        cell.addr?.text = obj["소재지도로명주소"] as? String
        
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if (segue.identifier=="segue_map") { // 실행된 세그웨이의 식별자가 viewDetail이라면
            
            // 선택된 셀의 행 정보
            let path = self.theaterTable.indexPathForCell(sender as! UITableViewCell)
            
            // 선택된 셀에 사용된 데이터
            let data = self.list[path!.row]
            
            // 세그웨이가 이동할 목적지 뷰 컨트롤러 객체를 구하고, 선언된 param 변수에 데이터를 연결해준다.
            (segue.destinationViewController as? TheaterViewController)?.param = data;
        }
    }
}