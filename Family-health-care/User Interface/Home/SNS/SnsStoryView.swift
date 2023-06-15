//
//  SnsStoryView.swift
//  Family-health-care
//
//  Created by 이다현 on 2023/05/08.
//

import SwiftUI

struct SnsStoryView: View {
    @State var progress : Double = 0.3
    var story:Story
    var body: some View {
        VStack{
            SnsUserProfile(createdBy: story.createdBy, createdAt: story.createdAt)
            ProgressView(value: progress)
                .progressViewStyle(LinearProgressViewStyle(tint: Color.mainBlue))
                .padding(.horizontal,15)
            VStack{
                Image("postPicTest")
                    .resizable()
                    .padding(20)
                    .frame(width: .infinity, height: .infinity,alignment: .center)
                    
            }
            .background(Color.primary.colorInvert())
            .cornerRadius(15)
            .overlay(RoundedRectangle(cornerRadius: 15)
            .stroke(Color.black, lineWidth: 0.2))
            .padding(25)
        }
        
    }
}
struct SnsStoryView_Previews: PreviewProvider {
    static var previews: some View {
        SnsStoryView(story: StorySamples[0])
    }
}
