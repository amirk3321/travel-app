//
//  CategoryViewModel.swift
//  travel-home-ui
//
//  Created by MA on 03/11/2023.
//

import Foundation





class CategoryViewModel : ObservableObject {
    
    
    @Published var isLoading  : Bool = true;
    @Published var places : [PlacesModel] = [PlacesModel]()
    @Published var errorMessage  : String = ""
    
    
//    init(name : String) {
//        
//        //fetchCateogies(categoryName: name)
//
//    }
    

    
    func fetchCateogies(categoryName : String) {
        
  
        
        
        print("fetchCateogies call multiple time")
        guard let url = URL(string: "https://travel.letsbuildthatapp.com/travel_discovery/category?name=\(categoryName.lowercased())".addingPercentEncoding(withAllowedCharacters:.urlQueryAllowed) ?? "") else {
            DispatchQueue.main.async {
                self.isLoading = false
            }
            return
        }
        
        
        URLSession.shared.dataTask(with: url) {
            data,urlResource,err in
            
            
            
            let statusCode = (urlResource as? HTTPURLResponse)?.statusCode;
            print("CheckStatus Cocde \(statusCode!)")
            
            
            if (statusCode! >= 400){
                
                print("Bad Status \(statusCode!)")
             
                DispatchQueue.main.async {
                    self.errorMessage = "Bad Status \(statusCode!)"
                    self.isLoading = false
                }
                return
            }
            
            
            if let err = err {
                
                
                print("Fatching subcategories error \(err)")
                
                DispatchQueue.main.async {
                    self.errorMessage = "Fatching subcategories error \(err)"
                    self.errorMessage = "Fatching subcategories error \(err)"
                }
                return
            }
            
            
            do {
                
                let response = try? JSONDecoder().decode([PlacesModel].self, from: data!)
                 
                 
                DispatchQueue.main.async {
                    self.places = response!
                    self.isLoading = false
                }
                
            } catch {
                self.errorMessage = "Fatching subcategorieserror \(err!)"
            }
            
            
        }.resume()
        
        
        
    }
    
    
}
