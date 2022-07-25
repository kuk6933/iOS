//
//  ScrumStore.swift
//  Scrumdinger
//
//  Created by ohhyeongseok on 2022/07/19.
//

import Foundation
import SwiftUI

class ScrumStore: ObservableObject {
    @Published var scrums: [DailyScrum] = [] //빈 배열할당
    
    private static func fileURL() throws -> URL {            // 오류가 날 수 있어 throws를 붙임
        try FileManager.default.url(for: .documentDirectory, //default 를 해주면서 싱글톤 인스턴스로 만들고 for로 폴더를정함
                                    in: .userDomainMask, //제한을 둠
                                       appropriateFor: nil, // 환경
                                       create: false) //directory가 없으면 만드는지
            .appendingPathComponent("scrums.data")  //경로 추가
    }
    
    static func load() async throws -> [DailyScrum] { //비동기적으로 작동 DailyScrum을 load해옴.
        try await withCheckedThrowingContinuation{ continuation in // 현재 작업을 잠시 중단하고 closure 실행
            load { result in
                switch result {
                case .failure(let error): //실패시 에러
                    continuation.resume(throwing: error)
                case .success(let scrums): //성공하면 scrums 리턴
                    continuation.resume(returning: scrums)
                }
            }
        }
    }
    
    static func load(completion: @escaping (Result<[DailyScrum], Error>)->Void) {
        DispatchQueue.global(qos: .background).async { //background level을 가지고 비동기적으로 실행.
            do {
                let fileURL = try fileURL()
                guard let file = try? FileHandle(forReadingFrom: fileURL) else {
                    DispatchQueue.main.async {
                        completion(.success([]))
                    }
                    return
                }
                let dailyScrums = try JSONDecoder().decode([DailyScrum].self, from: file.availableData)
                DispatchQueue.main.async {
                    completion(.success(dailyScrums))
                }
            } catch {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            }
        }
    }
    @discardableResult
    static func save(scrums: [DailyScrum]) async throws -> Int {
        try await withCheckedThrowingContinuation{ continuation in
            save(scrums: scrums) { result in
                switch result {
                case .failure(let error):
                    continuation.resume(throwing: error)
                case .success(let scrumsSaved):
                    continuation.resume(returning: scrumsSaved)
                }
            }
        }
    }
    static func save(scrums: [DailyScrum], completion: @escaping (Result<Int, Error>) -> Void) {
        DispatchQueue.global(qos: .background).async { //비동기 작업을하는데 qos는 background level
            do{
                let data = try JSONEncoder().encode(scrums) //Json
                let outfile = try fileURL()
                try data.write(to: outfile)
                DispatchQueue.main.async {
                    completion(.success(scrums.count))
                }
            } catch {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            }
        }
    }
}
