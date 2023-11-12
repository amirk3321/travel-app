//
//  ResturantDetailsViewMode.swift
//  travel-home-ui
//
//  Created by MA on 12/11/2023.
//

import Foundation


class ResturantDetailsViewMode : ObservableObject {
    
    
    @Published var errorMessage : String = ""
    @Published var resturantModel : ResturantDetailsModel?
    @Published var isLoading : Bool = true
    
    

    
    
    func fetchResturentDetails() {
        
        
        guard let url  = URL(string: "https://travel.letsbuildthatapp.com/travel_discovery/restaurant?id=0") else {return}
        
        
        URLSession.shared.dataTask(with: url) {
            data , urlResponse , err in
            
            
            let statusCodeRes = (urlResponse as? HTTPURLResponse)?.statusCode
            
            
            if (statusCodeRes! >= 400){
                
                
                print("\(statusCodeRes!) server err")
                
                DispatchQueue.main.async {
                    self.isLoading = false
                    self.errorMessage = "\(statusCodeRes!) server err"
                }
                
                return
            }
            
            
            if let err = err {
                
                DispatchQueue.main.async {
                    self.isLoading = false
                    self.errorMessage = "\(err) server err"
                }
                
                return
            }
            
            
            do {
                
                let res = try? JSONDecoder().decode(ResturantDetailsModel.self, from: data!)
                
                DispatchQueue.main.async {
                    self.resturantModel = res!
                    self.isLoading = false
                }
                
                
            } catch {
                print("Catch error Servicer \(err!)")
            }
            
            
        }.resume()
        
        
    }
    
    
    
    
    
}
