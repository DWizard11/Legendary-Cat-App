//
//  CatFactManager.swift
//  Cat App
//
//  Created by DWizard11 on 16/7/22.
//

import Foundation
import SwiftUI

class CatFactManager: ObservableObject {
    
    @Published var fact: CatFact?
    @Published var catFactManagerShown = false
    @Published var catFactManagerDescription = ""
    
    func getCatFact() {
        let apiURL = URL(string: "https://catfact.ninja/fact")!
        let request = URLRequest(url: apiURL)
        
        fact = nil 
        
        URLSession.shared.dataTask(with: request) { [self] data, response, error in
            if let data = data {
                let decoder = JSONDecoder()
                DispatchQueue.main.async {
                    self.fact = try? decoder.decode(CatFact.self, from: data)
                }
            } else if let error = error {
                self.catFactManagerDescription = error.localizedDescription
            }
        }.resume()
    }
}
