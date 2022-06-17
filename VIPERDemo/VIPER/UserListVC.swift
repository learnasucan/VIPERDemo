//
//  UserListViewController.swift
//  VIPERDemo
//
//  Created by Prachit on 2022-06-16.
//

import UIKit

let kIdentifier = "UserTableViewCell"

class UserListVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableview: UITableView!
        
    var presenter: (ViewToPresenterProtocol & InteractorToPresenterProtocol)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        presenter?.viewDidLoad()
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


extension UserListVC {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.numberOfRowsInSection() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return presenter?.cellForRowAt(tableView, indexPath) ?? UITableViewCell()
    }
    
}


extension UserListVC: PresenterToViewProtocol {
    func onFetchUserListSuccess() {
        tableview.reloadData()
    }
    
    
    func onFetchUserListFailure(error: String) {
        print(error)
    }
    
    func showActivity() {
        print("..........Show Indicator...............")
    }
    
    func hideActivity() {
        print("..........Hide Indicator...............")
    }
    
}
