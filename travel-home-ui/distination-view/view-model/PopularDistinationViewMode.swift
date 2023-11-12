//
//  PopularDistinationViewMode.swift
//  travel-home-ui
//
//  Created by MA on 08/11/2023.
//

import Foundation


class PopularDistinationViewMode : ObservableObject {
    
    
    @Published var isLoading  : Bool = true;
    @Published var errorMessage : String = ""
    @Published var travelDiscoveryModel : TravelDiscoveryModel?
    @Published var destinationName : String = "tokyo"
    
    func fatchDistinationDetails(destinationName : String) {
        
        self.destinationName = destinationName
        print("fatchDistinationDetails")
        
        guard let url = URL(string: "https://travel.letsbuildthatapp.com/travel_discovery/destination?name=\(self.destinationName.lowercased())") else  {
            return
        }
        
        
        URLSession.shared.dataTask(with: url) {
            data,urlResponse,err in
            
            
            
            
            let statusCode = (urlResponse as? HTTPURLResponse)?.statusCode
            
            
            print("statusCode \(statusCode!)")
            
            if (statusCode! >= 400){
                
                print("Bad State Stats")
                
                
                DispatchQueue.main.async {
                    self.errorMessage = "Bad State Status \(statusCode!)"
                    self.isLoading = false
                }
                
                
                return
                
            }
            
            
            if let err = err {
                
                
                print("Fatch destination details error \(err)")
                DispatchQueue.main.async {
                    self.isLoading = false
                }
                return
            }
            
            
            do {
                
                let travelDiscoveryRes = try JSONDecoder().decode(TravelDiscoveryModel.self, from: data!)
                
                
                DispatchQueue.main.async {
                    
                    
                    self.travelDiscoveryModel = travelDiscoveryRes
                    self.isLoading = false
                    
                    
                    print(travelDiscoveryRes)
                    
                }
                
            } catch {
                print("checkError Catch \(err)")
            }
            
            
            
            
            
            
            
        }.resume()
        
        
        
        
        
    }
    
    
    
}
