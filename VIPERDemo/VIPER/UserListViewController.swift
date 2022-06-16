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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(tableview)
        self.view.backgroundColor = .white
        tableview.delegate = self
        tableview.dataSource = self
        
        tableview.register(UINib(nibName: kIdentifier, bundle: nil), forCellReuseIdentifier: kIdentifier)
    }
    
}


extension UserListViewController {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: kIdentifier) as! UserTableViewCell
        cell.nameLabelOutlet.text = "Name"
        cell.descriptionLabelOutlets.text = "Descriptions"
        return cell
    }
    
}
