//
//  CatInfoManager .swift
//  Cat App
//
//  Created by DWizard11 on 18/7/22.
//

import Foundation

class CatInfoManager: ObservableObject {
    
    @Published var catInfo: CatInfo?
    @Published var catIG: CatIG?
    
    func getInfo() {
        Task(priority: .high) {
            let decoder = JSONDecoder()
            let baseURL = "https://345e7f6b-8b8c-4cf5-abca-21a55d206b81.mock.pstmn.io"
            
            do {
                let catIDRequest = URLRequest(url: URL(string: "\(baseURL)/random")!)
                let (catIDData, _) = try await URLSession.shared.data(for: catIDRequest)
                
                let catID = try decoder.decode(CatID.self, from: catIDData).catID
                
                let catInfoRequest = URLRequest(url: URL(string: "\(baseURL)/info/\(catID)")!)
                let (catInfoData, _) = try await URLSession.shared.data(for: catInfoRequest)
                
                let catInfo = try decoder.decode(CatInfo.self, from: catInfoData)
                
                let catIGRequest = URLRequest(url: URL(string: "\(baseURL)/ig/\(catID)")!)
                let (catIGData, _) = try await URLSession.shared.data(for: catIGRequest)
                
                let catIG = try decoder.decode(CatIG.self, from: catIGData)
                                                         
            } catch {
                print(error.localizedDescription)
            }
        }
        
        
    }
}
