//
//  User.swift
//  TestingMova
//
//  Created by Hiem Seyha on 7/23/18.
//  Copyright © 2018 Hiem Seyha. All rights reserved.
//

import Foundation


struct ResponseUser: Decodable {
   let user: User
}

struct User : Decodable {
   
   let login: String
   let id: Int
   let url:String
   let subscriptionsURL: String
   
   enum CodingKeys: String, CodingKey {
      case login
      case id
      case url
      case subscriptionsURL = "subscriptions_url"
   }
   
   init(from decoder: Decoder) throws {
      let values = try decoder.container(keyedBy: CodingKeys.self)
      login = try values.decode(String.self, forKey: .login)
      id = try values.decode(Int.self, forKey: .id)
      url = try values.decode(String.self, forKey: .url)
      subscriptionsURL = try values.decode(String.self, forKey: .subscriptionsURL)
   }
   
}
