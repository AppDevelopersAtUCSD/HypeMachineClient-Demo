//
//  HypeMClient.swift
//  HypeMachineMusic
//
//  Created by Nick McDonald on 2/20/17.
//  Copyright © 2017 Nick McDonald. All rights reserved.
//

import UIKit

class HypeMClient: NSObject {
    
    private static let baseHypeMEndpoint: String = "https://api.hypem.com/v2/popular?key=swagger"
    
    // A single(ton) HypeMClient object.
    static let sharedInstance: HypeMClient = HypeMClient()
    
    // Override the public init so we can ensure a singleton SpotifyClient object.
    private override init() { /* Don't need to do anything */ }
    
    // TODO: - Uncomment the following block of code when done making Posting data model!
    /*
    func getPostings(success: @escaping ([Posting])->(), failure: @escaping (Error?)->()) {
        let requestURL: URL? = URL(string: HypeMClient.baseHypeMEndpoint)
        guard let reqURL: URL = requestURL else {
            print("Error making request URL")
            return
        }
        var request: URLRequest = URLRequest(url: reqURL)
        request.httpMethod = "GET"
        let session: URLSession = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        let task: URLSessionDataTask = session.dataTask(with: request) { (data: Data?, response: URLResponse?, error: Error?) in
            
            guard error == nil else {
                failure(error)
                return
            }
            
            guard let data: Data = data else {
                return
            }
            if let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as? [[String: Any?]] {
                let people: [Posting] = Posting.peopleFromDictionaryArray(dataDictionary)
                
                success(people)
            }
        }
        task.resume()
    }
 */
}
