//
//  PopularDestinationsView.swift
//  travel-home-ui
//
//  Created by MA on 03/11/2023.
//

import Foundation
import SwiftUI








struct PopularDestinationsView : View {
    
    
    let popularDistination : [PopularDestinationHash] = [
        .init(name: "Tokyo", country: "Japan", imageUrl: "japan",latitude: 44.2234234,longitude: 23.234231),
        .init(name: "Paris", country: "France", imageUrl: "arizona",latitude: 23.123123,longitude: 41.12314),
        .init(name: "New York", country: "US", imageUrl: "tokyo",latitude: 22.23411,longitude: 25.23422)
    ]
    
    
    
    
    var body : some View {
        
        
     
        
        
        
        VStack(alignment:.leading,spacing: 2) {
            HStack {
                Text("Popular Destination")
                    
                    
                    
                Spacer()
                Text("see all").font(.system(size: 12,weight: .semibold))
            }.padding()
            ScrollView(.horizontal,showsIndicators: false) {
                HStack(spacing:15) {
                    ForEach (popularDistination, id:\.self) {
                        distination in
                        
                        
                        NavigationLink(destination: DifferView {
                            DistinationDetailsView(distination: distination)
                        }) {
                            
                            DestinationPlaceItem(distination: distination)
                                .padding(.bottom)
                        }
                       

                         
                    }
                }.padding(.horizontal)
            }
        }
    }
}





struct PopularPreviewBuilderPreview : PreviewProvider {
    
    
    static var previews: some View {
        NavigationView {
            DistinationDetailsView(distination: .init(name: "Japan", country: "Tokyo", imageUrl: "japan",latitude: 43.234234,longitude:21.234223))
        }
        PopularDestinationsView()
        DiscoverView()
    }
    
}

