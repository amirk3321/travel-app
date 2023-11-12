
import SwiftUI

struct HeaderSectionView : View {
    var body: some View {
        
        
        let categoryList : [Category] = [
            Category(name: "Art", imageName: "paintpalette"),
            .init(name: "Sports", imageName: "sportscourt"),
            .init(name: "Live Event", imageName: "music.mic"),
            .init(name: "Food", imageName: "takeoutbag.and.cup.and.straw"),
            .init(name: "History", imageName: "chart.bar"),
            .init(name: "Art", imageName: "paintpalette"),
            .init(name: "Art", imageName: "paintpalette"),
            .init(name: "Art", imageName: "paintpalette")
        ]
        
        
        ScrollView(.horizontal,showsIndicators: false) {
            
            
            HStack(alignment: .top, spacing:20) {
                ForEach (categoryList, id: \.self) {
                    category in
                    
                    NavigationLink(
                        destination: CategoryDetailsView(category: category),
                        label: {
                            VStack(alignment: .center, spacing:3) {
                                Image(systemName: category.imageName).frame(width: 68,height: 68)
                                    .font(.system(size: 30))
                                    .background(Color(#colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)))
                                    .cornerRadius(.infinity)
                                .foregroundColor(.white)
                            
                                Text(category.name).foregroundColor(.white)
                            }.frame(width:58)
                        })
                    
               
                }
            }.padding()
          
        }
    }

}


#Preview {
    
        //HeaderSectionView()
        DiscoverView()
        
}
