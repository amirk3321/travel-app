//
//  DifferView.swift
//  travel-home-ui
//
//  Created by MA on 04/11/2023.
//

import Foundation
import SwiftUI


struct DifferView<Content:View> : View {

    
    let content: () -> Content
    
    
    init(@ViewBuilder content : @escaping () -> Content) {
        self.content = content
    }
    
    var body : some View {
        content()
    }
    
    
}
