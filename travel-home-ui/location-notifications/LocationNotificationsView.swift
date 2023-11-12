//
//  LocationNotificationsView.swift
//  travel-home-ui
//
//  Created by MA on 06/11/2023.
//

import SwiftUI
import MapKit







struct LocationNotificationsView: View {
    


    
    
    let centre = UNUserNotificationCenter.current()
    

    
    @ObservedObject var locationVM = LocationManagerViewModel()
    
    

    
    
    var body: some View {
        Map() {
            Marker("My Location",systemImage: "location", coordinate: .userLocation)
                .tint(.blue)
        }
    }
}



extension CLLocationCoordinate2D {
    static var userLocation = CLLocationCoordinate2D(
        latitude: 48.858605, longitude: 2.2946
    )
    
   
}


extension MKCoordinateRegion {
    static var userLocationRegion : MKCoordinateRegion {
        .init(center: .userLocation, latitudinalMeters: 1000, longitudinalMeters: 1000)
    }
    
    static func setRegion(lat: Double , long : Double) ->  MKCoordinateRegion {
        return  .init(center: CLLocationCoordinate2D(latitude: lat, longitude: long), latitudinalMeters: 1000, longitudinalMeters: 1000)
    }
}




#Preview {
    LocationNotificationsView()
}
