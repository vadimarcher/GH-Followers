//
//  File.swift
//  GH Followers
//
//  Created by Vadim Archer on 19.08.2022.
//

import Foundation
enum GFError: String, Error  {
    case invalidUsername = "This username created an invalid request. Please try again 😢"
    case unableToComplete = "Unable to complete request. Please chech your Internet connection"
    case invalidResponse = "Invalid response frome server. Please try again 😢"
    case invalidData = "Data recieved from server was invalid. Please try again"
}
