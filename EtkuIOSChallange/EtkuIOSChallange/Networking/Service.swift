//
//  Service.swift
//  EtkuIOSChallange
//
//  Created by mac on 22.02.2020.
//  Copyright © 2020 cantekinalp. All rights reserved.
//

import Foundation
import KRProgressHUD

struct Error {
    let errorMessage: String
}


class Service<T: Codable> {
    //TODO: GenericTypeAlias
    typealias Result = ([T]?, Error?) -> ()
    
    private var decodedData: [T]?
    private var error: Error?
    
    func getDecodedData(url: String, completionHandler: @escaping Result) {
        if let url = URL(string: url) {
            HUD.show()
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                if let data = data {
                    do {
                        self.decodedData = try JSONDecoder().decode([T].self, from: data)
                    } catch let error {
                        self.error = Error(errorMessage: error.localizedDescription)
                    }
                    HUD.hide()
                    completionHandler(self.decodedData, self.error)
                }
            }.resume()
        }
        
    }
}


class HUD {
    class func show() {
        KRProgressHUD.show()
    }
    class func hide() {
        KRProgressHUD.dismiss()
    }
}
