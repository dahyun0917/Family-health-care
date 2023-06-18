//
//  SnsPostWriteView.swift
//  Family-health-care
//
//  Created by 이다현 on 2023/05/16.
//

import SwiftUI
import UIKit


struct SnsPostWriteView: View {
    @State var textTitle:String = ""
    @State var textContent:String = ""
    @State var isFocusedTitle:Bool = false
    @State var isFocusedContent:Bool = false
    @State var inputHeightTitle:CGFloat = 40
    @State var inputHeightContent:CGFloat = 40
    @State var imageFile:Bool = false
    @Environment(\.dismiss) private var dismiss
    var user : User
    @EnvironmentObject var family : Family
    var update : Bool = false
    var lastUpdateTime : Date = Date()
    
    
    var body: some View {
        VStack{
            VStack(alignment: .leading) {
                writeAll
            }
            Button {
                if update {
                    for i in 0...family.posts.count-1{
                        if (family.posts[i].createdBy == user.userId && family.posts[i].createdAt == lastUpdateTime){
                            family.posts[i].title = textTitle
                            family.posts[i].content = textContent
                            family.posts[i].img = ""
                            family.setPostData(post: family.posts[i])
                        }
                    }
                }
                else{
                    let post = Post(title: textTitle, content: textContent, img: "", createdBy: user.userId, createdByImg: user.image, createdAt: Date())
                    family.posts.append(post)
                }
                dismiss()
            } label: {
                Text("작성완료")
                    .foregroundColor(.white)
                    .padding()
            }
            .background(Color.mainBlue)
            .foregroundColor(.white)
            .cornerRadius(25)
//            .clipShape(Circle())
            .padding()
            .padding(.top,20)
        }
    }
    
    
    
}

private extension SnsPostWriteView {
    var topBar: some View {
        HStack{
            Button(action: { }) { // 팝오버 제거
                Text("Cancel").foregroundColor(.red)
            }
            Spacer()
            Text("New Event").font(.headline)
            Spacer()
            Button("Add(+)") { }
        }
    }
    var writeAll: some View {
        VStack{
            SnsUserProfile(createdBy: "\(user.userId)", createdAt: Date(),createdByImg: user.image)
            writeTitle
            writeContent
            uploadImage
        }
//        .frame(height: 650)
        .background(Color.primary.colorInvert())
        //        .background(Color.mainGrey)
        .cornerRadius(15)
        .overlay(RoundedRectangle(cornerRadius: 15)
            .stroke(Color.black, lineWidth: 0.2))
        .padding(.horizontal,20)
        .padding(.top,20)
        .padding(.bottom,10)
        
    }
    var writeTitle: some View {
        VStack(alignment: .leading) {
            Text("Title")
                .font(.headline)
            WriteTextView(text: $textTitle, isFocused: $isFocusedTitle, inputHeight: $inputHeightTitle, maxHeight : 20)
                .frame(maxHeight: 40)
                .cornerRadius(20)
                .overlay(RoundedRectangle(cornerRadius: 40)
                    .stroke(isFocusedTitle ? Color.black : Color.gray, lineWidth: 1))
                .padding(.vertical, 4)
        }
        .padding(.horizontal,15)
        
    }
    var writeContent: some View {
        VStack(alignment: .leading) {
            Text("Contents")
                .font(.headline)
            WriteTextView(text: $textContent, isFocused: $isFocusedContent, inputHeight: $inputHeightContent, maxHeight : 250)
//                .frame(height: inputHeightContent)
                .frame(maxHeight: 150)
                .cornerRadius(20)
                .overlay(RoundedRectangle(cornerRadius: 20)
                    .stroke(isFocusedContent ? Color.black : Color.gray, lineWidth: 1))
                .padding(.vertical, 4)
        }
        .padding(.horizontal,15)
    }
    var uploadImage : some View {
        VStack(alignment: .leading){
                Text("Image")
                    .font(.headline)
            HStack{
                Button("+ 파일첨부"){
                }
                .font(.system(size: 12))
                .padding(5)
                .background(Color.mainLightBeige)
                .foregroundColor(Color.black)
                .border(Color.black, width: 0.3)
                Spacer()
            }
            if imageFile {
                //            imageview(imageFile: $imageFile)
                Image(imageFile ? "postPicTest" : "Appicon")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 300, height: 150,alignment: .center)
                    .padding(.top,20)
            }
        }
        .padding(15)
    }
}


//struct SnsPostWriteView_Previews: PreviewProvider {
//    static var previews: some View {
//       SnsPostWriteView(user:User(token: "admin", completion: <#T##(User) -> Void#>))
//    }
//}
