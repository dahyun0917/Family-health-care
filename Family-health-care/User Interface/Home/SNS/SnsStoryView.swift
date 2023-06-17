//
//  SnsStoryView.swift
//  Family-health-care
//
//  Created by 이다현 on 2023/05/08.
//

import SwiftUI
import Kingfisher

struct SnsStoryView: View {
    @State var progress : Double = 0.3
    var user:User
    var story:Story
    var body: some View {
        VStack{
            SnsUserProfile(createdBy: story.createdBy, createdAt: story.createdAt,createdByImg: story.createdByImg)
            ProgressView(value: progress)
                .progressViewStyle(LinearProgressViewStyle(tint: Color.mainBlue))
                .padding(.horizontal,15)
            VStack{
                if (story.img != ""){
                    KFImage(URL(string: story.img)!)
                        .placeholder { //플레이스 홀더 설정
                            //                      Image(systemName: "person")
                        }.retry(maxCount: 3, interval: .seconds(5)) //재시도
                        .onFailure { e in //실패
                            print("failure_SnsStoryView: \(e)")
                        }
                        .resizable()
                        .padding(20)
                        .frame(width: .infinity, height: .infinity,alignment: .center)
                }
                
                Spacer()
                Text(story.content)
                    .padding(20)
                Spacer()
                
                    
            }
//            .background(Color.primary.colorInvert())
//            .cornerRadius(15)
//            .overlay(RoundedRectangle(cornerRadius: 15)
//            .stroke(Color.black, lineWidth: 0.2))
//            .padding(25)
        }
        .background(Color.primary.colorInvert())
        .cornerRadius(15)
        .overlay(RoundedRectangle(cornerRadius: 15)
        .stroke(Color.black, lineWidth: 0.2))
        .padding(25)
        .padding(.top,5)
        
    }
}
//struct SnsStoryView_Previews: PreviewProvider {
//    static var previews: some View {
//        SnsStoryView(story: StorySamples[0])
//    }
//}
