//
//  TravelDiscoveryModel.swift
//  travel-home-ui
//
//  Created by MA on 08/11/2023.
//

import Foundation


struct TravelDiscoveryModel : Hashable, Decodable , Identifiable {
  
  
    
    var id : Int
    
    let name : String
    
    let description : String
    
    let photos : [String]
    
    
    let thumbnail : String
    
    let latitude : Double
    
    let longitude : Double
    
    
    
    
    
    
}
