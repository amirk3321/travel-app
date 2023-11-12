//
//  DestinationPlaceItem.swift
//  travel-home-ui
//
//  Created by MA on 08/11/2023.
//

import SwiftUI

struct DestinationPlaceItem : View {
    
    let distination : PopularDestinationHash
    
    var body : some View {
        VStack(alignment: .leading,spacing: 0){
            
            
            Image(distination.imageUrl)
                .resizable()
                .scaledToFill()
                .frame(width: 125,height: 150)
                .cornerRadius(8)
                .padding(.vertical,8)
                .padding(.horizontal,8)
               
                
            
            Text(distination.name).font(.system(size: 12,weight: .semibold))
                .foregroundColor(Color(.label))
               
                .padding(.horizontal,8)
            Text(distination.country).font(.system(size: 12,weight: .semibold))
                .foregroundColor(.gray)
                .padding(.bottom,8)
                .padding(.horizontal,8)
    
            
            
        }

           
    .toTileModifer()
    }
}

#Preview {
    DestinationPlaceItem(distination: PopularDestinationHash(name: "Paris", country: "France", imageUrl: "japan", latitude: 0.0, longitude: 0.0))
}
