//
//  WikipwdiaSearchAPIViewController.swift
//  RxWikipwdiaAPI
//
//  Created by 優樹永井 on 2019/08/04.
//  Copyright © 2019 com.nagai. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class WikipediaSearchAPIViewController: UIViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    private let disposeBag    = DisposeBag()
    private let viewModel     = WikipwdiaSearchAPIViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 検索欄の入力値とViewModelのsearchWordをbind
        self.searchBar.rx.text.orEmpty
            .bind(to: self.viewModel.searchWord)
            .disposed(by: self.disposeBag)
        
        // 検索結果とテーブルのセルをbind
        self.viewModel.items.asObservable()
            .bind(to: self.tableView.rx.items(cellIdentifier: "Cell")) { index, result, cell in
                cell.textLabel?.text = result.title
                cell.detailTextLabel?.text = "https://ja.wikipedia.org/w/index.php?curid=＼(result.pageid)"
            }
            .disposed(by: self.disposeBag)
    }
    
}
