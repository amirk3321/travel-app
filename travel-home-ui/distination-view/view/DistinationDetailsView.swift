//
//  DistinationDetailsView.swift
//  travel-home-ui
//
//  Created by MA on 08/11/2023.
//

import SwiftUI

struct DistinationDetailsView : View {
    
    
    let distination : PopularDestinationHash
    

    
    @ObservedObject var vm : PopularDistinationViewMode = PopularDistinationViewMode()
    
    init(distination : PopularDestinationHash){
        self.distination = distination
      
    }
    
    var body: some View {
        
        ZStack {
            
            if (vm.isLoading) {
                
                
                VStack {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle(tint: .blue)).scaleEffect(2)
                
                    Text("Loading..").padding(.top,20)
                    
                }
                
            }else {
             
                ScrollView {
                    
                    VStack(alignment:.leading,spacing:8) {
                        
                        CorouselSliderView(images: vm.travelDiscoveryModel?.photos ?? [],pageViewIndex: 0)
                        
                        
                        VStack(alignment:.leading,spacing:0) {
                            Text(distination.name)
                                .font(.system(size: 16,weight: .semibold))
                            Text(distination.country)
                                .font(.system(size: 14,weight: .semibold))
                                .foregroundColor(.gray)
                            
                            
                            HStack {
                                ForEach (1..<5,id: \.self) {
                                    num in
                                    Image(systemName: "star.fill")
                                    
                                }
                            }.padding(.top,8)
                            
                            
                            Text(vm.travelDiscoveryModel?.description ?? "")
                            
                            Divider()
                                .padding()
                            
                           
            
                            
                        }.padding()
                        
                        
                        MapKitUIView()
                        
                       
                    }
                    
             
                    
                }
                
                
            }
            
            
        }.navigationBarTitle("Destiantion View", displayMode: .inline).onAppear {
            
            vm.fatchDistinationDetails(destinationName: distination.name)
        }
        
    
        
        
    }
}


#Preview {
//    DistinationDetailsView(distination: PopularDestinationHash(name: "Paris", country: "France", imageUrl: "japan", latitude: 0.0, longitude: 0.0))
    
    DiscoverView()
}
