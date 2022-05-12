//
//  DetailView.swift
//  dice
//
//  Created by Gajender Jangir on 22/04/22.
//

import SwiftUI

struct DetailView: View {
    var video:Video
    var body: some View {
        
        
        VStack {
            Image(video.imageName)
                .resizable()
                .scaledToFit()
                .frame(width: 260, height: 250, alignment: .center)
                .cornerRadius(10)
            HStack(spacing:40){
                Label("\(video.viewCount)", systemImage: "eye.fill")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                
                Text(video.uploadDate)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                
            }.padding()
            
            Text(video.title)
                .font(.system(size: 24))
                .fontWeight(.semibold)
                .lineLimit(2)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
            
            Divider()
            Text(video.description)
                .padding()
            Spacer()
            Link(destination: video.url, label: {
                Text("Go")
                    .bold()
                    .font(.title)
                    .padding(.horizontal)
                    .background(.blue)
                    .foregroundColor(.white)
                    .cornerRadius(50)
                
            })
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(video: VideoList.topTen.first!)
    }
}
