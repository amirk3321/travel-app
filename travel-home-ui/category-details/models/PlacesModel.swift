//
//  PlacesModel.swift
//  travel-home-ui
//
//  Created by MA on 03/11/2023.
//

import Foundation


struct PlacesModel : Hashable, Decodable, Identifiable{
    var id: Int

    let name,country,description,thumbnail : String;
    
    let photos : [String]
    
    
    
    
    
}
