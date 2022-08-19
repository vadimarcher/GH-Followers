//
//  NetworkManager.swift
//  GH Followers
//
//  Created by Vadim Archer on 18.08.2022.
//

import Foundation

class NetworkManager {
     static let shared = NetworkManager()
    let baseURL = "https://api.github.com/users/"
    
    private init(){ }
    
    func getFollowers (for username:String, page:Int, completed: @escaping ([Follower]?, String?) -> Void) {
        let endpoint = baseURL + "\(username)/followers?per_page=100&page=\(page)"
        guard let url = URL(string: endpoint) else {
            completed(nil, "This username created an invalid request. Please try again 😢")
            return
        }
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let _ = error  {
                completed(nil, "Unable to complete request. Please chech your Internet connection")
            }
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(nil, "Invalid response frome server. Please try again 😢")
                return
            }

            guard let data = data else {
                completed(nil,"Data recieved from server was invalid. Please try again")
                return
            }
            
            do  {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let followers = try decoder.decode([Follower].self, from: data)
            } catch  {
                
            }

        }
        task.resume()
    }
    
}
