//
//  UserSessionResponse.swift
//  MVVM-Demo
//
//  Created by Hussein AlRyalat on 10/12/2022.
//

import Foundation

struct UserSessionResponse: Codable {
    let name: String
    let age: Int
    let email: String
    let accessToken: String
}
