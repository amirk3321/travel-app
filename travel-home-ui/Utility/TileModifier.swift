//
//  TileModifier.swift
//  travel-home-ui
//
//  Created by MA on 03/11/2023.
//

import Foundation
import SwiftUI



extension View {
    
    func toTileModifer() -> some View {
        modifier(TileModifier())
    }
}


struct TileModifier : ViewModifier {
   
    func body(content: Content) -> some View {
        
        content.background(.white)
            .cornerRadius(15)
            .shadow(color: .init(.sRGB,white: 0.9,opacity: 1), radius: 4,x: 0.0,y: 2)
    }
    
    
}
