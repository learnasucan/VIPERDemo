//
//  UserListViewController.swift
//  VIPERDemo
//
//  Created by Prachit on 2022-06-16.
//

import UIKit

let kIdentifier = "UserTableViewCell"

class UserListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    lazy var tableview : UITableView  = {
        let tableview = UITableView()
        tableview.frame = view.bounds
        tableview.translatesAutoresizingMaskIntoConstraints = false
        return tableview
    }()
    
    var users: UserList?
    
    override func viewDidLoad() {
        super.viewDidLoad()
            setup()
        
        users = APIManager.getUserList()
        
        }
    
    //MARK:- Helpers
    
    private func setup() {
        self.view.addSubview(tableview)
        self.view.backgroundColor = .white
        tableview.delegate = self
        tableview.dataSource = self
        
        tableview.register(UINib(nibName: kIdentifier, bundle: nil), forCellReuseIdentifier: kIdentifier)
    }
}


extension UserListViewController {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users?.userList?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: kIdentifier) as! UserTableViewCell
      
        guard let user = users?.userList?[indexPath.row] else { return UITableViewCell()}
        cell.setupCell(with: user)
        return cell
    }
    
}
