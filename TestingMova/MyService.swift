//
//  MyService.swift
//  TestingMova
//
//  Created by Hiem Seyha on 7/23/18.
//  Copyright © 2018 Hiem Seyha. All rights reserved.
//

import Foundation
import Moya

enum MyService {
   case commit
}

extension MyService: TargetType {
   
   var method: Moya.Method {
      switch self {
      case .commit:
         return .get
      }
   }
 
   
   var task: Task {
      return .requestPlain
   }
   
   
   var sampleData: Data {
      return Data()
   }
   
   
   var headers: [String : String]? {
       return ["Content-type": "application/json"]
   }
   
   var baseURL: URL {
      return URL(string: "https://api.github.com/repos/apple/swift/comments")!
   }
   
   var path: String {
      switch self {
      case .commit:
         return ""
      }
   }
   
   
}


































