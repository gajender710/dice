//
//  VListView.swift
//  dice
//
//  Created by Gajender Jangir on 21/04/22.
//

import SwiftUI
import MapKit

struct VListView: View {
    
   // @State private var model = StarWar.all()
    var heroes : [Video] = VideoList.topTen
    var body: some View {
        
        
       
            List(heroes,id: \.id) { item in
                
                Cell(item: item)
            }.navigationTitle("Stars")
        
        
            
//            List{
//                    ForEach (model){ star in
//
//                            HStack {
//                                Image(star.imageURL).resizable()
//                                    .aspectRatio(1, contentMode: .fit)
//                                .frame(width: 50, height: 50, alignment: .leading)
//                                Spacer()
//                                Text(star.name)
//                                Spacer()
//                            }
//
//
//
//                    }
//            }
            
            //.offset(y: -130)
            
            //.navigationTitle(Text("War Hero"))
        
        
            
        
        
    }
}

struct secondView_Previews: PreviewProvider {
    static var previews: some View {
        VListView()
    }
}

struct Cell: View {
    var item:Video
    var body: some View {
        HStack{
            NavigationLink(destination: DetailView(video: item), label: {
                Image(item.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 100)
                    .cornerRadius(6)
                VStack (alignment: .leading,spacing: 6){
                    Text(item.title)
                        .fontWeight(.semibold)
                        .lineLimit(2)
                        .minimumScaleFactor(0.5)
                    
                    Text(item.uploadDate )
                        .font(.subheadline)
                        .foregroundColor(.secondary )
                }
            })
            
        }
    }
}
