//
//  ContentView.swift
//  travel-home-ui
//
//  Created by MA on 02/11/2023.
//

import SwiftUI

struct DiscoverView: View {
    
    
    
    
    
    @ObservedObject var vm  = ResturantDetailsViewMode()
    
    init() {
        
        UINavigationBar.appearance().largeTitleTextAttributes = [
            .foregroundColor : UIColor.white
        ]
        
    }
    
    var body: some View {
        
        
      
        NavigationView {
            
            ZStack {
                
                LinearGradient(
                    gradient: Gradient(colors: [Color(#colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)), Color(#colorLiteral(red: 0.9411764741, green: 0.4980392158, blue: 0.3529411852, alpha: 1))]),
                    startPoint: .top,
                    endPoint: .center).ignoresSafeArea()
                
                
                Color.white.offset(y:400)
                
                ScrollView {
                    
                    
                    HStack {
                        Image(systemName: "magnifyingglass")
                        Text("Where do you want to go?")
                        Spacer()
                        
                    }
                    .padding()
                    .foregroundColor(.white)
                    .background(Color(.init(white:0.9,alpha: 0.3)))
                    .cornerRadius(20)
                    .padding(16)
                    
                    HeaderSectionView()
               
                    VStack {
                        PopularDestinationsView()
                        PopularResturantPlacesView()
                        TrendingCreatorView(user: vm.resturantModel)
                        
                    }.background(Color(.init(white:0.95,alpha:1)))
                        .cornerRadius(16)
                        .padding(.top,35)
               
                    
                    
                }
            
            }.navigationTitle("Discover")
        
            
            
        }
        
        
    }
    
}






#Preview {
    DiscoverView()
}
