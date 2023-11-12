//
//  ResturantDetailsView.swift
//  travel-home-ui
//
//  Created by MA on 09/11/2023.
//

import Kingfisher
import SwiftUI




struct ResturantDetailsView: View {
    
 
    
    
    @ObservedObject private var vm = ResturantDetailsViewMode()
    
    
    var body: some View {
    
        
        ZStack {
            
            if (vm.isLoading == true) {
                
                VStack {
                    ProgressView().progressViewStyle(.circular)
                        .foregroundColor(.orange)
                    Text("Loading...").padding(.top,10)
                }
                
            }else{
                ScrollView {
                    VStack(alignment:.leading) {
                        ResturantHeaderSectionView()
                        ResturantDetailsBodyContentView()
                        PopularDisesView()
                        CustomerReviewView()
                    }
            }
            
            
        }
        
    }.navigationBarTitle("Resturent Details", displayMode: .inline).onAppear {
        vm.fetchResturentDetails()
    }.environmentObject(vm)
}
    
    struct CustomerReviewView : View {
        
        @EnvironmentObject var vm : ResturantDetailsViewMode
        
        
        var body: some View {
            VStack {
                ForEach (vm.resturantModel?.reviews ?? [], id : \.self ) {
                    reviewUser in
                    CustomerReviewSingleUserView(reviewsUser: reviewUser)
                }
            }
        }
    }
    
    struct CustomerReviewSingleUserView : View {
        
        let reviewsUser : ReviewsModel
       
      
        
       
        var body: some View {
            VStack(alignment:.leading,spacing: 0) {
                Text("Customer Review").font(.system(size: 18,weight: .semibold)).padding(.bottom,10)
                
                
                VStack(alignment:.leading) {
                    
                    HStack {
                        KFImage(URL(string: "\(reviewsUser.user.profileImage)"))
                            .resizable()
                            .frame(width: 60,height: 60)
                            .scaledToFit()
                            .cornerRadius(100)
                            .overlay(RoundedRectangle(cornerRadius: 100).stroke(Color(.black)))
                        VStack(alignment:.leading) {
                            Text(reviewsUser.user.username).font(.system(size: 14,weight: .semibold))
                            HStack {
                                ForEach (0..<reviewsUser.rating, id: \.self ) {
                                    index in
                                    Image(systemName: "star.fill")
                                        .foregroundColor(.orange)
                                }
                                ForEach (0..<5 - reviewsUser.rating, id: \.self ) {
                                    index in
                                    Image(systemName: "star.fill")
                                        .foregroundColor(.gray)
                                }
                                
                            }
                        }
                        Spacer()
                        Text("Dec 2023")
                    }
                    Text(reviewsUser.text)
                }
                
                
            }.padding()
        }
    }
    
    struct PopularDisesView : View {
        
        @EnvironmentObject var vm : ResturantDetailsViewMode
        
        var body: some View {
            VStack(alignment:.leading,spacing: 0) {
                Text("Popular Dishes").font(.system(size: 18,weight: .semibold))
                    .padding(.bottom,10)
                
                ScrollView(.horizontal,showsIndicators: false) {
                    
                    HStack {
                        ForEach (vm.resturantModel?.popularDishes ?? [], id : \.self){
                            dish in
                            
                            VStack(alignment:.leading,spacing:0) {
                                ZStack(alignment:.bottom) {
                                    
                                    
                                    KFImage(URL(string: dish.photo))
                                        .resizable()
                                        .frame(width: 140,height: 120)
                                        .scaledToFill()
                                        .cornerRadius(8)
                                    
                                    
                                    
                                    LinearGradient(gradient: Gradient(colors: [Color.clear, Color.black]), startPoint: .center, endPoint: .bottom).cornerRadius(8)
                                    
                                    HStack {
                                        Text(dish.price).font(.system(size: 15,weight: .semibold)).lineLimit(1).padding(.top,5)
                                            .foregroundColor(.white)
                                        Spacer()
                                    }.padding(.horizontal,10)
                                        .padding(.bottom,8)
                                }
                                  
                                
                                Text(dish.name).font(.system(size: 15,weight: .semibold)).lineLimit(1).padding(.top,5)
                                
                                Text("\(dish.numPhotos) photos").font(.system(size: 14,weight: .regular)).lineLimit(1).padding(.top,3).foregroundColor(.gray)
                            }.frame(width: 140)
                            
                        }
                    }
                }
                
            }.padding()
        }
    }

    struct ResturantDetailsBodyContentView : View {
        
        @EnvironmentObject var vm : ResturantDetailsViewMode
        
        var body: some View {
            
            VStack(alignment:.leading) {
                Text(vm.resturantModel?.name ?? "").font(.system(size: 18,weight: .semibold))
                Text("\(vm.resturantModel?.city ?? "") , \(vm.resturantModel?.country ?? "") , \(vm.resturantModel?.category ?? "")").font(.system(size: 14,weight: .semibold)).padding(.top,5)
                
                
                HStack {
                    ForEach (0..<3, id : \.self) {
                        index in
                        
                        Image(systemName: "dollarsign.circle.fill")
                            .foregroundColor(.orange)
                    }
                }.padding(.top,10)
                
                Text(vm.resturantModel?.description ?? "").font(.system(size: 14,weight: .semibold)).padding(.top,5)
                
                
            }.padding()

        }
        }
    }
    
struct ResturantHeaderSectionView : View {
    
    @EnvironmentObject var vm : ResturantDetailsViewMode
    
  
    
    var body: some View {
        ZStack(alignment: .bottom) {
            
            KFImage(URL(string: vm.resturantModel?.thumbnail ?? ""))
                .resizable()
                .scaledToFit()
            
            
            LinearGradient(gradient: Gradient(colors: [Color.clear, Color.black]), startPoint: .center, endPoint: .bottom)
            
            HStack {
                VStack(alignment:.leading) {
                    Text(vm.resturantModel?.name ?? "").font(.system(size: 18,weight: .semibold))
                        .foregroundColor(.white)
                    
                    HStack {
                        
                        ForEach (0..<5 , id: \.self) {
                            index in
                            Image(systemName: "star.fill")
                                .foregroundColor(.orange)
                            
                        }
                    }
                }
                Spacer()
                
                VStack {
                    
                    NavigationLink(destination: DifferView {
                        
                        GridPhotosView(vm: vm.resturantModel!)
                        
                    }) {
                        VStack {
                            Text("See More").font(.system(size: 18,weight: .semibold))
                                .foregroundColor(.white)
                            Text("Best").font(.system(size: 18,weight: .semibold))
                                .foregroundColor(.white)
                        }
                    }
                    
                    
                  
                    
                }.frame(width: 150)
                
            }.padding()
            
            
        }.environmentObject(vm)
    }
}

#Preview {
    NavigationView {
        ResturantDetailsView()
    }
    
}
