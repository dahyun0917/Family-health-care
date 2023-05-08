//
//  SnsView.swift
//  Family-health-care
//
//  Created by 이다현 on 2023/05/07.
//

import SwiftUI

struct SnsView: View {
    var body: some View {
        ZStack(alignment: .bottomTrailing){
//            Color.mainGrey.edgesIgnoringSafeArea(.all)  // 전체배경색 변화
            ScrollView{
                LazyVStack {
                    story
                    postMenu
                    ForEach(0...5, id: \.self) { _ in
                        VStack{
                            SnsPostRow()
                        }
                    }
                }
            }
            Button {
//                    showNewTweetView.toggle()
            } label: {
                Image(systemName: "pencil.line")
                    .resizable()
                    .renderingMode(.template)
                    .foregroundColor(.white)
                    .frame(width: 28, height: 28)
                    .padding()
            }
            .background(Color.mainBlue)
            .foregroundColor(.white)
            .clipShape(Circle())
            .padding()
            
        }
    }
}
private extension SnsView {
    var story : some View {
        HStack{
            storyImage
            storyImage
            storyImage
            storyImage
            storyImage
            storyImage
        }
        .frame(width: 350)
        .padding(.top,10)
    }
    var storyImage: some View {
        VStack{
            Image(systemName: "person")
                .resizable()
//                .scaledToFill()
                .frame(width: 50, height: 50)
                .cornerRadius(30)
                .overlay(RoundedRectangle(cornerRadius: 30)
                    .stroke(Color.black, lineWidth: 0.5))
            Text("person")
                .font(.caption)
                .fontWeight(.thin)
                .padding(.bottom, 6)
        }
    }
    var postMenu: some View {
        HStack{
            Button(action: { }) {
              Capsule()
                .fill(Color.mainBlue)
                .frame(maxWidth: 100, minHeight: 30, maxHeight: 55)
                .overlay(Text("Family")
                  .font(.system(size: 20)).fontWeight(.medium)
                  .foregroundColor(Color.white))
                .padding(.vertical, 8)
                .padding(.horizontal, 10)
            }
            Button(action: { }) {
              Capsule()
                .fill(Color.mainBlue)
                .frame(maxWidth: 100, minHeight: 30, maxHeight: 55)
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
