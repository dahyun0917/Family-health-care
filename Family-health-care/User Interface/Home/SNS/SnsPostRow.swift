//
//  SnsPostRow.swift
//  Family-health-care
//
//  Created by 이다현 on 2023/05/08.
//

import SwiftUI
import Kingfisher

struct SnsPostRow: View {
    @ObservedObject var post : Post
    var user:User
    var body: some View {
        VStack{
            SnsUserProfile(createdBy: "\(post.createdBy)", createdAt: post.createdAt,createdByImg: post.createdByImg)
            postContent
        }
//        .padding(30)
        .background(Color.primary.colorInvert())
//        .background(Color.mainGrey)
        .cornerRadius(15)
        .overlay(RoundedRectangle(cornerRadius: 15)
            .stroke(Color.black, lineWidth: 0.2))
        .shadow(color: .mainBeige, radius: 1, x: 2, y: 2)
        .padding(25)
    }
    
}
private extension SnsPostRow{
    var postContent: some View {
        VStack(alignment: .leading){
            if (post.img != ""){
                KFImage(URL(string: post.img)!)
                    .placeholder { //플레이스 홀더 설정
                        //                                  Image(systemName: "person")
                    }.retry(maxCount: 3, interval: .seconds(5)) //재시도
                    .onFailure { e in //실패
                          print("failure_SnsPostRow: \(e)")
                    }
                    .resizable()
                    .scaledToFill()
//                    .frame(width: 300, height: 150,alignment: .center)
                    .padding([.bottom, .trailing],10)
                    .padding(.leading,20)
            }
                
            Text(post.title)
                .font(.headline)
                .padding(.leading,20)
            Text(post.content)
                .font(.caption)
                .frame(width: 300,height: 50,alignment: .leading)
                .padding(.horizontal,20)
                .padding(.top,1)
                .padding(.bottom,5)
            
            HStack(spacing: 0){
                Image(systemName: "ellipsis.message")
                    .imageScale(.large)
                    .frame(width: 25, height: 25)
                Text("\(post.comment.count)")
                    .font(.caption)
                    .frame(width: 32, height: 32)
            }
            .padding(.leading,20)
            .padding(.bottom,20)
                
        }
    }
}

//struct SnsPostRow_Previews: PreviewProvider {
//    static var previews: some View {
//        Group {
//            ForEach(PostSamples) {
//                SnsPostRow(post:$0)
//            }
//        }
//        
//    }
//}
