//
//  LocationManagerViewModel.swift
//  travel-home-ui
//
//  Created by MA on 07/11/2023.
//

import Foundation
import UserNotifications
import CoreLocation
import SwiftUI
import MapKit



class LocationManagerViewModel : NSObject, CLLocationManagerDelegate, ObservableObject {
    
    
    private var locationManager = CLLocationManager()
    
    private let notificationCentre = UNUserNotificationCenter.current()
    
    
    
    @Published var location  : CLLocation?
    
    @Published var userLocationCoordinate : CLLocationCoordinate2D?
    @Published var userRegion : MKCoordinateRegion = MKCoordinateRegion()
    
    
    override init() {
        super.init()
        StartLocationService()
        notificationSetup()
    }
    
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        location = locations.last
    
        
        userLocationCoordinate = CLLocationCoordinate2D(latitude: location?.coordinate.latitude ?? 0.0, longitude: location?.coordinate.longitude ?? 0.0)
        
        
        userRegion = MKCoordinateRegion(
            center: self.userLocationCoordinate!, latitudinalMeters: 1000, longitudinalMeters: 1000)
            
        if (UIApplication.shared.applicationState == .active){
            
            print("Application in foreground")
        }else {
            print("Application in background")
            alertNotification("location: \(String(describing: location?.coordinate.latitude)), \(String(describing: location?.coordinate.longitude))")
        }
        
    }
    
    private func notificationSetup() {
        
        notificationCentre.requestAuthorization(options: [.alert,.sound]) {
            result , err in
            
            if let err = err {
                print("Notification setup Issue \(err)")
            }
            
            
            print("Trigger Notification")
        
            
        }
        
    }
    
    private func alertNotification(_ locationData : String){
        
        
        /// create content
        let content = UNMutableNotificationContent()
        content.title = "Location Update"
        content.body = locationData
        
        
        /// create request
        let req = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: nil)
        
        
        
        notificationCentre.add(req) {
            err in
            
            if let err = err {
                print("Notification Trigger Issue \(err)")
            }
            
            print("Notification Trigger no erro")
        }
        
        
    }
    
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Error getting location \(error)")
    }
    
    func StartLocationService() -> Void {
        print("Location service start")
        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        
        self.locationManager.requestAlwaysAuthorization()
        
        self.locationManager.allowsBackgroundLocationUpdates = true
        
        self.locationManager.pausesLocationUpdatesAutomatically = false
        
        
        locationManager.startUpdatingLocation()
        
    }
    
    
    
    
    
    
}
