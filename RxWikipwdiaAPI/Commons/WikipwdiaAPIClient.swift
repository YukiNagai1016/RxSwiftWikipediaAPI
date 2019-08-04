//
//  WikipwdiaAPIClient.swift
//  RxWikipwdiaAPI
//
//  Created by 優樹永井 on 2019/08/04.
//  Copyright © 2019 com.nagai. All rights reserved.
//
import Alamofire

protocol APIClient {
    var url: String { get }
    func getRequest(_ parameters: [String : String]) -> DataRequest
}

// Wikipedia APIを呼び出すクラス
class WikipediaAPIClient: APIClient {
    // Wikipedia APIのエンドポイント
    var url = "https://ja.wikipedia.org/w/api.php?format=json&action=query&list=search"
    
    // Wikipedia APIに向けてHTTPリクエストを実行
    func getRequest(_ parameters: [String : String]) -> DataRequest
    {
        return Alamofire.request(URL(string:"https://ja.wikipedia.org/w/api.php?format=json&action=query&list=search")!,
                                 method: .get, parameters: parameters, encoding: URLEncoding.default, headers: nil)
    }
    
}
