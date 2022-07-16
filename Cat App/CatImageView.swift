//
//  CatImageView.swift
//  Cat App
//
//  Created by DWizard11 on 16/7/22.
//

import SwiftUI

struct CatImageView: View {
    var body: some View {
        AsyncImage(url: URL(string: "https://cataas.com/c")!) { image in image
            .resizable()
            .scaledToFit()
        } placeholder: {
            ProgressView()
            
        }
    }
}

struct CatImageView_Previews: PreviewProvider {
    static var previews: some View {
        CatImageView()
    }
}
