//
//  Translation.swift
//  TestingMova
//
//  Created by Hiem Seyha on 7/23/18.
//  Copyright © 2018 Hiem Seyha. All rights reserved.
//

import Foundation
import Result

enum APIClientError: Error {
   case CouldNotDecodeJSON
   case BadStatus(status: Int)
   case Other(Error)
}

protocol TranslationLayerType {
   static func decodes<E: Decodable>(data: Data) -> [E]
   static func decode<E: Decodable>(data: Data) -> E?
}


class TranslationLayer: TranslationLayerType {
   
   static func decodes<E: Decodable>(data: Data) -> [E] {
      do {
         guard let json = try? JSONDecoder().decode([E].self, from: data)
            else { throw APIClientError.CouldNotDecodeJSON  }
         return json
      } catch (let error) {
         debugPrint(error)
      }
      return []
   }
   
   static func decode<E: Decodable>(data: Data) -> E? {
      do {
         guard let jsonData = try? JSONDecoder().decode(E.self, from: data) else { throw APIClientError.CouldNotDecodeJSON }
         return jsonData
      } catch (let error) {
         debugPrint(error)
      }
      return nil
   }
   
   
}
