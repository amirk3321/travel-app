//
//  CategoryDetailsView.swift
//  travel-home-ui
//
//  Created by MA on 03/11/2023.
//

import Foundation
import SwiftUI
import Kingfisher


struct LoadingIndicatorView : UIViewRepresentable {
    func makeUIView(context: Context) -> UIActivityIndicatorView {
        let aiv = UIActivityIndicatorView(style: .large)
        aiv.startAnimating()
        return aiv
    }
    
    func updateUIView(_ uiView: UIActivityIndicatorView, context: Context) {
        
    }
    
    
    
    typealias UIViewType = UIActivityIndicatorView
    
    
   
    
    
}



struct CategoryDetailsView : View {
    
    private let category : Category
    @ObservedObject var vm : CategoryViewModel = CategoryViewModel()
    
    init(category: Category) {
        self.category = category
//        self.vm = .init(name: category.name)
    }
    
   
    
    
    var body: some View {
        
        VStack {
            
            if (vm.isLoading){
                
                VStack {
                    LoadingIndicatorView()
                    Text("Loading")
                }
                
            }else{
                
                ZStack {
                    
                    if (!vm.errorMessage.isEmpty){
                        VStack(spacing:10) {
                            Image(systemName: "xmark.seal.fill").font(.system(size: 40)).foregroundColor(.red)
                            Text(vm.errorMessage)
                                .font(.system(size: 16,weight: .semibold))
                        }
                    }
                    
                    ScrollView {
                        
                        ForEach (vm.places, id: \.self) {
                            place in
                            VStack(alignment: .leading,spacing: 0) {
                                
                                HStack {
                                    Spacer()
                                }
                                
                                KFImage(URL(string:
                                                place.thumbnail))
                                    .resizable()
                                    .scaledToFill()
                                
                                
                                Text(place.name)
                                    .padding()
                                
                                
                            }.toTileModifer()
                                .padding()
                        }
                    
                        
                    }
                }
            }
            
          
        }.navigationBarTitle(category.name, displayMode: .inline).onAppear {
            vm.fetchCateogies(categoryName: category.name)
        }
          
           
        
    }
}

#Preview {
    
//    NavigationView {
//        CategoryDetailsView(category: Category(name: "Category view", imageName: "japan"))
//    }
   DiscoverView()
}
