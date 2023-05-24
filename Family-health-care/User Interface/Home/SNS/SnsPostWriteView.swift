//
//  SnsPostWriteView.swift
//  Family-health-care
//
//  Created by 이다현 on 2023/05/16.
//

import SwiftUI
import UIKit
import FirebaseStorage
import Firebase

struct SnsPostWriteView: View {
    @State var textTitle:String = ""
    @State var textContent:String = ""
    @State var isFocusedTitle:Bool = false
    @State var isFocusedContent:Bool = false
    @State var inputHeightTitle:CGFloat = 40
    @State var inputHeightContent:CGFloat = 40
    @State var imageFile:Bool = true
    
    var body: some View {
        VStack{
            VStack(alignment: .leading) {
                writeAll
            }
            Button {
                //                    showNewTweetView.toggle()
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
        VStack {
            SnsUserProfile()
            writeTitle
            writeContent
            uploadImage
//            Spacer()
        }
        .frame(height: 650)
        .background(Color.primary.colorInvert())
//        .background(Color.mainGrey)
        .cornerRadius(15)
        .overlay(RoundedRectangle(cornerRadius: 15)
            .stroke(Color.black, lineWidth: 0.2))
        .padding(20)
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
}

struct SnsPostWriteView_Previews: PreviewProvider {
    static var previews: some View {
        SnsPostWriteView()
    }
}
