//
//  FollowerListVC.swift
//  GH Followers
//
//  Created by Vadim Archer on 13.08.2022.
//

import UIKit

class FollowerListVC: UIViewController {

    var username: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationController?.isNavigationBarHidden = false
        navigationController?.navigationBar.prefersLargeTitles = true
        
        NetworkManager.shared.getFollowers(for: username, page: 1) { followers, errorrMessage in
            guard let followers = followers else {
                self.presentGFAlertOnMainThread(title: "Bad Thing Happend", message: errorrMessage!.rawValue, buttonTitle: "Ok")
                return
            }
            print("followers.count = \(followers.count)")
            print(followers)
        }

    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
}
