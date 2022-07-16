//
//  CatFactView.swift
//  Cat App
//
//  Created by DWizard11 on 16/7/22.
//

import SwiftUI

struct CatFactView: View {
    
    @StateObject var catFactManager = CatFactManager()
    
    var body: some View {
        VStack {
            if let fact = catFactManager.fact {
                Text(fact.fact)
                    .padding()
            } else {
                ProgressView()
                    .progressViewStyle(.circular)
            }
        }
            .onAppear{
                catFactManager.getCatFact()
            }
    }
}

struct CatFactView_Previews: PreviewProvider {
    static var previews: some View {
        CatFactView()
    }
}
