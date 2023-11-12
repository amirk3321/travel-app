//
//  MapKitUIView.swift
//  travel-home-ui
//
//  Created by MA on 04/11/2023.
//

import SwiftUI
import MapKit

struct MapKitUIView: View {
    
    @State private var cameraPosition : MapCameraPosition = .region(.userLocationRegion)
    
    @State private var isHideMap : Bool = false
    
    
    var body: some View {
        
        VStack {
            
            HStack {
                Text("Location").font(.system(size: 16,weight: .semibold))
                Spacer()
                Button {
                    isHideMap.toggle()
                } label: {
                    Text("\(isHideMap==false ? "Show" : "Hide") Map")
                }
                Toggle(isOn: $isHideMap, label: {
                    Text("Label")
                }).labelsHidden()
            }

            if isHideMap == false {
                Map(position:$cameraPosition) {
                    Marker("My Location",systemImage: "location.circle", coordinate: .userLocation)
                        .tint(.blue)
                    Annotation("My Location", coordinate: .userLocation) {
                        
                        ZStack {
                            Circle().frame(width: 50,height: 50).foregroundColor(.blue.opacity(0.5))
                                .overlay {
                                    RoundedRectangle(cornerRadius: 90).stroke(Color(.orange))
                                }
                            
                            Circle().frame(width: 35,height: 35).foregroundColor(.blue.opacity(0.6))
                                .overlay {
                                    RoundedRectangle(cornerRadius: 90)
                                        .stroke(Color(.black))
                                }
                            
                            Circle().frame(width: 20,height: 20).foregroundColor(.blue)
                                .overlay {
                                    
                                    RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/).stroke(Color(.green))
                                    
                                }
                        }
                      
                    }
                }.mapControls {
                    MapCompass()
                    MapPitchToggle()
                    MapUserLocationButton()
                }
            }
            else {
                Spacer()
            }
            
           
        }.frame(height:250).padding()
        
    }
}

//extension CLLocationCoordinate2D {
//    static var userLocation = CLLocationCoordinate2D(
//        latitude: 48.858605, longitude: 2.2946
//    )
//}
//
//
//extension MKCoordinateRegion {
//    static var userLocationRegion : MKCoordinateRegion {
//        .init(center: .userLocation, latitudinalMeters: 1000, longitudinalMeters: 1000)
//    }
//}

#Preview {
    MapKitUIView()
}
