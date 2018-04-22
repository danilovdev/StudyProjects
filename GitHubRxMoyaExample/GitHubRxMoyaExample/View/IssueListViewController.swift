//
//  IssueListViewController.swift
//  GitHubRxMoyaExample
//
//  Created by Alexey Danilov on 22.04.2018.
//  Copyright © 2018 danilovdev. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift
import Moya

class IssueListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    // MARK: - Properties
    let cellId = "IssueCell"
    
    let disposeBag = DisposeBag()
    
    var provider: MoyaProvider<GitHubEndPoint>!
    
    var issueTrackerViewModel: IssueTrackerViewModel!
    
    var latestRepositoryName: Observable<String> {
        return searchBar
            .rx
            .text
            .orEmpty
            .debounce(0.5, scheduler: MainScheduler.instance)
            .distinctUntilChanged()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupRx()
    }
    
    private func setupRx() {
        provider = MoyaProvider<GitHubEndPoint>()
        
        issueTrackerViewModel = IssueTrackerViewModel(provider: provider, reposytoryName: latestRepositoryName)
        
        issueTrackerViewModel
            .trackIssues()
            .bind(to: tableView.rx.items) { [unowned self] (tableView, row, item) in
                let indexPath = IndexPath(row: row, section: 0)
                let cell = tableView.dequeueReusableCell(withIdentifier: self.cellId, for: indexPath)
                cell.textLabel?.text = item.title
                
                return cell
        }
        .disposed(by: disposeBag)
        
        tableView
            .rx
            .itemSelected
            .subscribe(onNext: { [unowned self] indexPath in
                if self.searchBar.isFirstResponder {
                    self.view.endEditing(true)
                }
            })
            .disposed(by: disposeBag)
        
    }
}
