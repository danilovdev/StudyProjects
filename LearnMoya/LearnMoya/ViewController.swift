//
//  ViewController.swift
//  LearnMoya
//
//  Created by Alexey Danilov on 22.04.2018.
//  Copyright © 2018 danilovdev. All rights reserved.
//

import UIKit
import Moya

class ViewController: UIViewController {
    
    let cellId = "UserCell"

    var users = [User]()
    
    let userProvider = MoyaProvider<UserService>()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        userProvider.request(.readUsers) { [unowned self] result in
            switch result {
            case .success(let response):
                do {
                    let users = try JSONDecoder().decode([User].self, from: response.data)
                    self.users = users
                    self.tableView.reloadData()
                } catch let error as NSError {
                    print(error)
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    @IBAction func addBarButtonItemTapped(sender: UIBarButtonItem) {
        let user = User(id: 55, name: "Aleksei Danilov")
        
        userProvider.request(.createUser(name: user.name)) { [unowned self] result in
            switch result {
            case .success(let response):
                do {
                    let newUser = try JSONDecoder().decode(User.self, from: response.data)
                    self.users.insert(newUser, at: 0)
                    self.tableView.reloadData()
                } catch let error as NSError {
                    print(error)
                }
            case .failure(let error):
                print(error)
            }
        }
    }

}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        let user = users[indexPath.row]
        cell.textLabel?.text = user.name
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        guard editingStyle == .delete else { return }
        
        let user = users[indexPath.row]
        
        userProvider.request(.deleteUser(id: user.id)) { [unowned self] result in
            switch result {
            case .success:
                self.users.remove(at: indexPath.row)
                self.tableView.reloadData()
            case .failure(let error):
                print(error)
            }
        }
    }
}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let user = users[indexPath.row]
        
        userProvider.request(.updateUser(id: user.id, name: "[Modified] " + user.name)) { [unowned self] result in
            switch result {
            case .success(let response):
                do {
                    let modifiedUser = try JSONDecoder().decode(User.self, from: response.data)
                    self.users[indexPath.row] = modifiedUser
                    self.tableView.reloadData()
                } catch let error as NSError {
                    print(error)
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}

