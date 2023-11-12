//
//  ResturantModel.swift
//  travel-home-ui
//
//  Created by MA on 09/11/2023.
//

import Foundation


struct ResturantDetailsModel : Hashable, Decodable, Identifiable {
    
    var id : Int
    
    let name : String
    let city : String
    let country : String
    let category : String
    let description : String
    let photos : [String]
    let thumbnail : String
    let popularDishes : [PopularDishesModel]
    let reviews : [ReviewsModel]
    
    
    
    
}


struct ReviewsModel : Hashable , Decodable {
    
    let user : UserReviewModel
    let rating : Int
    let text : String
    
}

struct UserReviewModel : Hashable , Decodable {
    
    var id : Int
    let username : String
    let firstName : String
    let lastName : String
    let profileImage : String
    let followers : Int
    let following : Int
    let posts : [PostModel]
   
    
    
}

struct PostModel : Hashable , Decodable  {
    let title : String;
    let imageUrl : String;
    let views : String;
    let hashtags : [String];
}

struct PopularDishesModel : Hashable , Decodable {
    
    let name : String
    let price : String
    let numPhotos : Int
    let photo : String
    
}
