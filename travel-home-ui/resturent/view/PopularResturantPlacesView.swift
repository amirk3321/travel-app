//
//  PopularResturantPlacesView.swift
//  travel-home-ui
//
//  Created by MA on 03/11/2023.
//

import SwiftUI

struct PopularResturantPlacesView : View {
    
    
    let restorentList : [PopularResturent] = [
        PopularResturent(name: "Japan, Tokyo tapas", imageUrl: "japan"),
            .init(name: "US, Tokyo tapas", imageUrl: "tokyo")
    ]
    
    var body : some View {
        VStack(alignment:.leading,spacing: 4) {
            HStack {
                Text("Popular Places to eat")
                    
                    
                    
                Spacer()
                Text("see all").font(.system(size: 12,weight: .semibold))
            }.padding(.horizontal)
            
            ScrollView(.horizontal,showsIndicators: false) {
                HStack(spacing:15) {
                    ForEach (restorentList, id:\.self) {
                        resturent in
                        
                        
                        NavigationLink(
                            destination: DifferView {
                                ResturantDetailsView()
                            },
                            label: {
                                PopularResturantItem(resturent: resturent)
                            })
                        
                    }
                }.padding(.horizontal)
            }
        }
    }
}

struct PopularResturantItem : View {
    
    let resturent : PopularResturent
    
    
    var body: some View {
        HStack(alignment: .top) {
            
            Image(resturent.imageUrl)
                .frame(width: 64,height: 54)
                .background(.gray)
                .cornerRadius(10)
                .padding(.horizontal,4)
                .padding(.vertical,4)
         
            VStack(alignment: .leading) {
                HStack {
                    Text(resturent.name)
                        .lineLimit(1)
                        .foregroundColor(.black)
                    Spacer()
                    Button {
                        print("More")
                    } label: {
                        Image(systemName: "ellipsis")
                            .foregroundColor(.gray)
                    }
                    
                    

                    
                }
                
                HStack{
                    Image(systemName: "star")
                    Text("4.7 ➤ Sushi ➤ $$")
                }.foregroundColor(.black)
                
                Text("Japan, Tokyo").foregroundColor(.gray)
            
            }.font(.system(size: 12,weight: .semibold))
                .padding(.vertical,8)
                .padding(.horizontal,1)
            Spacer()
            
        }
            .frame(width: 240)
            .toTileModifer()
            .padding(.bottom)
    }
    
}


#Preview {
    PopularResturantPlacesView()
}


#Preview {
    DiscoverView()
}



