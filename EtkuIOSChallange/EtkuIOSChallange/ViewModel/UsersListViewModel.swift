//
//  UsersListViewModel.swift
//  EtkuIOSChallange
//
//  Created by mac on 22.02.2020.
//  Copyright © 2020 cantekinalp. All rights reserved.
//

import Foundation

class UsersListViewModel {
    var userViewModels: [UserViewModel]?
    private var service: Service<User>
    
    init(service: Service<User>) {
        self.service = service
    }
    
    func getUsers(handler: @escaping () -> ()) {
        self.service.getDecodedData(url: AppConstants.url) { (users, error) in
            guard error == nil else {
                return
            }
            
            self.userViewModels = users?.compactMap { user in
                return UserViewModel(user: user)
            }
            handler()
        }
    }
}
