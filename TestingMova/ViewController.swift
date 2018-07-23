//
//  ViewController.swift
//  TestingMova
//
//  Created by Hiem Seyha on 7/23/18.
//  Copyright © 2018 Hiem Seyha. All rights reserved.
//

import UIKit
import Moya
import Result


class ViewController: UIViewController {

   override func viewDidLoad() {
      super.viewDidLoad()
     
      
      let provider = MoyaProvider<MyService>()
      provider.request(.commit) { (response) in

         let users : [ResponseUser] = response.results()
         _ = users.map { debugPrint($0.user.subscriptionsURL) }
         
         
      }
      
   }


}


extension Result where T: Moya.Response {
   
   
   func results<U: Decodable>() -> [U] {
      
      switch self {
         
      case let .success(moyaResponse):
         let objects: [U] = TranslationLayer.decodes(data: moyaResponse.data)
         return objects
         
      case .failure(let error):
         debugPrint("Response Errro: ========> ", error.localizedDescription)
         return []
      }
   }
}


