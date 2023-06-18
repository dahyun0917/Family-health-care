//
//  SnsView.swift
//  Family-health-care
//
//  Created by 이다현 on 2023/05/07.
//

import SwiftUI
import UIKit
import Kingfisher

struct SnsView: View {
    @EnvironmentObject private var family : Family
    @EnvironmentObject private var userLoader : UserLoader
    @State var isWrite:Bool = false
    @State var isClick:Int = 1
    @State private var date = Date()
    
    var body: some View {
        if let user = userLoader.user{
            VStack{
                NavigationView{
                    
                    //                Color.mainGrey.edgesIgnoringSafeArea(.all)  // 전체배경색 변화
                    
                    VStack {
                        ScrollView(.horizontal,showsIndicators: false){
                            HStack{
                                ForEach(family.storys.reversed(), id: \.id) { story in
                                    NavigationLink(destination: SnsStoryView(user:user,story: story)) {
                                        storyView(story: story)
                                    }
                                    
                                }
                                .buttonStyle(PlainButtonStyle())
                            }
                            .frame(maxHeight: .infinity)
                        }
                        .frame(height: 30)
                        .padding()
                        .padding(.top,20)
                        
                        
                        postMenu(isClick: $isClick)
                        if (isClick == 1 ){
                            ZStack(alignment: .bottomTrailing){
                                ScrollView{
                                    LazyVStack{
                                        ForEach(family.posts.reversed(), id: \.id) { post in
                                            NavigationLink(destination: SnsPostDetailView(post:post,user:user).environmentObject(family)) {
                                                SnsPostRow(post:post,user:user)
                                            }
                                            .buttonStyle(PlainButtonStyle())
                                        }
                                    }
                                }
                                VStack{
                                    if isWrite {
                                        NavigationLink(destination: SnsPostWriteView(user:user).environmentObject(family)) {
                                            Image("postWrite")
                                                .padding(13)
                                                .background(Color.mainBlue)
                                                .foregroundColor(.white)
                                                .clipShape(Circle())
                                        }
                                        NavigationLink(destination: SnsStoryWriteView(user:user).environmentObject(family)) {
                                            Image("storyWrite")
                                                .padding(13)
                                                .background(Color.mainBlue)
                                                .foregroundColor(.white)
                                                .clipShape(Circle())
                                        }
                                    }
                                    Button {
                                        if isWrite {
                                            isWrite = false
                                        }
                                        else {
                                            isWrite = true
                                        }
                                    } label: {
                                        Image(systemName: "plus")
                                            .foregroundColor(.white)
                                            .padding()
                                    }
                                    .background(Color.mainBlue)
                                    .foregroundColor(.white)
                                    .clipShape(Circle())
                                    .padding()
                                }.animation(.easeInOut, value: true)
                            }
                            .padding()
                            
                            //                MyView()
                            
                        }
                        else if (isClick == 2) {
                            VStack{
                                DatePicker("추억", selection: $date)
                                    .datePickerStyle(GraphicalDatePickerStyle())
                                //달력과 텍스트의 위치를 지정하는 프레임
                                    .frame(maxHeight: 700)
                            }
                        }
                    }
                }
            }
        }
    }
    }


struct storyView : View {
    var story : Story
    var body : some View {
        let url:URL = URL(string: story.createdByImg)!
        VStack{
            KFImage(url)
                  .placeholder { //플레이스 홀더 설정
                      Image(systemName: "person")
                  }.retry(maxCount: 3, interval: .seconds(5)) //재시도
                  .onFailure { e in //실패
                      print("failure_SnsView: \(e)")
                  }
                  .resizable()
                  .scaledToFill()
                  .frame(width: 50, height: 50)
                  .cornerRadius(30)
                  .overlay(RoundedRectangle(cornerRadius: 30)
                  .stroke(Color.black, lineWidth: 0.2))
//            Image(systemName: "person")
//                .resizable()
//                .frame(width: 50, height: 50)
//                .cornerRadius(30)
//                .overlay(RoundedRectangle(cornerRadius: 30)
//                    .stroke(Color.black, lineWidth: 0.5))
            Text("\(story.createdBy)")
                .font(.caption)
                .fontWeight(.thin)
                .padding(.bottom, 6)
        }
    }
}
struct postMenu : View {
    @Binding var isClick : Int
    var body : some View {
        HStack{
            Button(action: { isClick=1 }) {
              Capsule()
                .fill(Color.mainBlue)
                .frame(maxWidth: 100, minHeight: 30, maxHeight: 45)
                .overlay(Text("Family")
                  .font(.system(size: 20)).fontWeight(.medium)
                  .foregroundColor(Color.white))
                .padding(.vertical, 8)
                .padding(.horizontal, 10)
            }
            Button(action: { isClick=2 }) {
              Capsule()
                .fill(Color.mainBlue)
                .frame(maxWidth: 100, minHeight: 30, maxHeight: 45)
                .overlay(Text("Memory")
                  .font(.system(size: 20)).fontWeight(.medium)
                  .foregroundColor(Color.white))
                .padding(.vertical, 8)
                .padding(.horizontal, 10)
            }
                
        }
        .padding(.top,10)
    }
}
struct SnsView_Previews: PreviewProvider {
    static var previews: some View {
        SnsView()
    }
}
