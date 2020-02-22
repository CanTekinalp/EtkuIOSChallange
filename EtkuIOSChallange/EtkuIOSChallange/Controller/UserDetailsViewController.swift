//
//  UserDetailsViewController.swift
//  EtkuIOSChallange
//
//  Created by mac on 22.02.2020.
//  Copyright © 2020 cantekinalp. All rights reserved.
//

import UIKit

class UserDetailsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var userViewModel: UserViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableViewSetup()
        self.title = self.userViewModel.navigationTitle
    }


    func tableViewSetup() {
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.register(UINib(nibName: "UserDetailsCell", bundle: nil), forCellReuseIdentifier: "UserDetailsCell")
        self.tableView.register(UINib(nibName: "MapCell", bundle: nil), forCellReuseIdentifier: "MapCell")
    }
}


extension UserDetailsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "MapCell", for: indexPath) as! MapCell
            cell.configureMap(coordinate: self.userViewModel.mapCoordinates)
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "UserDetailsCell", for: indexPath) as! UserDetailsCell
            cell.configure(viewModel: self.userViewModel)
            return cell
        }
    }
}

extension UserDetailsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 { return UIScreen.main.bounds.width }
        return UITableView.automaticDimension
    }
}
