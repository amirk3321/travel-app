//
//  CorouselSliderView.swift
//  travel-home-ui
//
//  Created by MA on 07/11/2023.
//

import SwiftUI
import Kingfisher

struct CorouselSliderView: View {
    
    
    
    let images : [String]
    @State var pageViewIndex : Int
 
    init(images: [String],pageViewIndex : Int) {
        self.images = images
        self.pageViewIndex = pageViewIndex
        
    }
    
    
 
    
    var body: some View {
        GeometryReader {
            proxy in
            ZStack {
                TabView(selection: $pageViewIndex) {
                    
                    
                    ForEach (0..<images.count, id: \.self) {
                        image in
                        
                        
                        
                        KFImage(URL(string: images[image]))
                            .resizable()
                            .frame(width: proxy.size.width,height: 250)
                            .scaledToFill()
                            .cornerRadius(8)
                            .padding(.vertical,8)
                            .padding(.horizontal,8)
                            .tag(image)
                        
                    }
                    
                }.tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            
                HStack {
                    ForEach (0..<images.count, id : \.self) {
                        index in
        
                        Circle().frame(width: 10,height: 10)
                            .foregroundColor(pageViewIndex == index ? .red : .gray)
                        
                    }
                }.padding(.top,280)
                    
                
                
               
                
            }
        }
    }
}

#Preview {
    CorouselSliderView(images: [],pageViewIndex: 0)
}
