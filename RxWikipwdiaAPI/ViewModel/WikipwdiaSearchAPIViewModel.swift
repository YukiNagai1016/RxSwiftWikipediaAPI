//
//  WikipwdiaSearchAPIViewModel.swift
//  RxWikipwdiaAPI
//
//  Created by 優樹永井 on 2019/08/04.
//  Copyright © 2019 com.nagai. All rights reserved.
//

import RxSwift
import RxCocoa
import Alamofire

class WikipwdiaSearchAPIViewModel{
    
    var searchWord   = Variable<String>("")
    var items = Variable<[Result]>([])
    private let model = WikipediaSearchAPIModel()
    private var disposeBag = DisposeBag()
    
    init() {
        // searchWordからWikipedia APIの検索結果を得てitemsにbind
        searchWord.asObservable()
            .filter { $0.count >= 3 }
            .debounce(0.5, scheduler: MainScheduler.instance)
            .flatMapLatest { [unowned self] str in
                return self.model.searchWikipedia(["srsearch": str])
            }
            .bind(to: self.items)
            .disposed(by: self.disposeBag)
    }

}
