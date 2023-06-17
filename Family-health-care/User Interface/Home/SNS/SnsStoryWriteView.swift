//
//  SnsStoryWriteView.swift
//  Family-health-care
//
//  Created by 이다현 on 2023/05/23.
//

import SwiftUI

struct SnsStoryWriteView: View {
    @State var text:String = ""
    @State var isFocused:Bool = false
    @State var inputHeightTitle:CGFloat = 40
    @State var inputHeightContent:CGFloat = 40
    @State var imageFile:Bool = true
    @Environment(\.dismiss) private var dismiss
    var user : User
    var family : Family
    
    var body: some View {
        VStack(alignment: .center, spacing: 0){
            VStack(alignment: .leading) {
                SnsUserProfile(createdBy: "\(user.userId)", createdAt: Date(),createdByImg: user.image)
                writeText
                uploadPicture
            }
            HStack{
                Spacer()
                Button {
                    let story = Story(content: text, img: "", createdBy: user.userId,createdByImg: user.image, createdAt: Date())
                    family.storys.append(story)
                    dismiss()
                } label: {
                    Text("완료")
                        .foregroundColor(.white)
                        .padding(.horizontal,20)
                        .padding(.vertical,10)
                }
                .background(Color.mainBlue)
                .foregroundColor(.white)
                .cornerRadius(25)
                
            }.padding()
                .padding(.top,5)
        }
        .background(Color.primary.colorInvert())
        //        .background(Color.mainGrey)
        .cornerRadius(15)
        .overlay(RoundedRectangle(cornerRadius: 15)
            .stroke(Color.black, lineWidth: 0.2))
//            .shadow(color: .mainBeige, radius: 1, x: 2, y: 2)
        .padding([.leading,.top,.trailing],25)
    }
}
private extension SnsStoryWriteView {
    var uploadPicture: some View {
        VStack(alignment: .leading){
            Text("Image")
                .font(.headline)
            Button("+ 파일첨부"){
            }
            .font(.system(size: 12))
            .padding(5)
            .background(Color.mainLightBeige)
            .foregroundColor(Color.black)
            .border(Color.black, width: 0.3)
            
//            imageview(imageFile: $imageFile)
            Image(imageFile ? "postPicTest" : "Appicon")
                .resizable()
                .scaledToFill()
                .frame(width: 300, height: 150,alignment: .center)
                .padding(.vertical,20)
        }
        .padding(.horizontal,15)
    }
    var writeText: some View {
        VStack(alignment: .leading) {
            Text("Story 내용")
                .font(.headline)
            WriteTextView(text: $text, isFocused: $isFocused, inputHeight: $inputHeightTitle, maxHeight : 20)
                .frame(maxHeight: 40)
                .cornerRadius(20)
                .overlay(RoundedRectangle(cornerRadius: 40)
                    .stroke(isFocused ? Color.black : Color.gray, lineWidth: 1))
                .padding(.vertical, 4)
        }
        .padding(.horizontal,15)

    }
}
//struct SnsStoryWriteView_Previews: PreviewProvider {
//    static var previews: some View {
//        SnsStoryWriteView()
//    }
//}
