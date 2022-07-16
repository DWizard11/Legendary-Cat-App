//
//  CatFactManager.swift
//  Cat App
//
//  Created by DWizard11 on 16/7/22.
//

import Foundation
import SwiftUI

class CatFactManager: ObservableObject {
    func getCatFact() {
        let apiURL = URL(string: "https://catfact.ninja/fact")!
        let request = URLRequest(url: apiURL)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                print(String(data: data, encoding: .utf8)!)
            }
        }.resume()
    }
}
