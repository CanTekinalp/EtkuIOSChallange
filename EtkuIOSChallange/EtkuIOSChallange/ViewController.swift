//
//  ViewController.swift
//  EtkuIOSChallange
//
//  Created by mac on 22.02.2020.
//  Copyright © 2020 cantekinalp. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!

    private var usersListViewModel: UsersListViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableViewSetup()
        self.title = "Users"
        self.usersListViewModel = UsersListViewModel(service: Service<User>())
        self.usersListViewModel?.getUsers(handler: {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        })
    }
    
    func tableViewSetup() {
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.register(UINib(nibName: "UserCell", bundle: nil), forCellReuseIdentifier: "UserCell")
        self.tableView.estimatedRowHeight = 100
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.usersListViewModel?.userViewModels?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let userViewModel = self.usersListViewModel?.userViewModels?[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserCell", for: indexPath) as! UserCell
        cell.configure(userViewModel: userViewModel)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "toUserDetailsVC", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let indexPath = self.tableView.indexPathForSelectedRow!
        let userDetailsVC = segue.destination as! UserDetailsViewController
        let viewModel = self.usersListViewModel!.userViewModels![indexPath.row]
        userDetailsVC.userViewModel = viewModel
    }
}


