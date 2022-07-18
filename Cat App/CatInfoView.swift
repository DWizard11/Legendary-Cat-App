//
//  CatInfoView.swift
//  Cat App
//
//  Created by DWizard11 on 18/7/22.
//

import SwiftUI

struct CatInfoView: View {
    
    @StateObject var catInfoManager = CatInfoManager()
    
    var body: some View {
        VStack {
            if let catInfo = catInfoManager.catInfo,
               let catIG = catInfoManager.catIG {
                
                AsyncImage(url: URL(string: catInfo.imageURL)!) { image in image
                        .resizable()
                        .scaledToFit()
                        .mask(Circle())
                } placeholder: {
                    ProgressView()
                }
                
                Text(catInfo.name)
                    .bold()
                
                Text(catInfo.description)
                
                Link(destination: URL(string: catIG.url)!) {
                    Text("Follow @\(catIG.username)")
                        .padding()
                        .background(.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                
            } else {
                ProgressView()
            }
        }
        .onAppear {
            catInfoManager.getInfo()
        }
    }
}

struct CatInfoView_Previews: PreviewProvider {
    static var previews: some View {
        CatInfoView()
    }
}
