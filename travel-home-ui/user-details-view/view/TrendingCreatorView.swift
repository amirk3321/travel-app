//
//  TrendingCreatorView.swift
//  travel-home-ui
//
//  Created by MA on 03/11/2023.
//

import SwiftUI

struct TrendingCreatorView : View {
    
    
    let user : ResturantDetailsModel?
    
    
    let creatorList : [Creators] = [
        .init(name: "jay", imageUrl: "arizona"),
        .init(name: "jayme", imageUrl: "japan"),
        ]
    
    var body: some View {
        ScrollView(.horizontal,showsIndicators: false) {
            
            Text(user?.country ?? "test11")
           
            HStack(alignment: .top, spacing:12) {
                ForEach (creatorList, id: \.self) {
                    creator in
                    
                    VStack(alignment:.center,spacing:3) {
                        Image(creator.imageUrl).frame(width: 50,height: 50)
                            .background(.gray)
                        .cornerRadius(.infinity)
                        .shadow(color: .gray, radius: 4, x: 0.0, y: 2)
                        Text(creator.name).font(.system(size: 14,weight: .semibold))
                    
                   
                    }
                    
                    
                }
            }.padding()
          
        }
    }

}

#Preview {
//    TrendingCreatorView(user: UserReviewModel(id: 0, username: "username", firstName: "bob", lastName: "Floa", profileImage: "", followers: 10, following: 20, posts: []))
    
    DiscoverView()
}


