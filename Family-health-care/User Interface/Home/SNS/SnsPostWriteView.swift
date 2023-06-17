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
//                    let post = family.indices.filter{family[$0].createdBy == user.userId && family[$0].createdBy == lastUpdateTime}
//                    print(post)
                    for i in 0...family.posts.count-1{
                        if (family.posts[i].createdBy == user.userId && family.posts[i].createdAt == lastUpdateTime){
                            family.posts[i].title = textTitle
                            family.posts[i].content = textContent
                            family.posts[i].img = ""
                            family.setPostData(post: family.posts[i])
                        }
                    }
//                    ForEach(family.posts, id: \.id){ post in
//                        if (post.createdBy == user.userId && post.createdAt == lastUpdateTime){
////                            post.title. textTitle
////                            post.content = textContent;
////                            post.img = "";
////                            post.createdAt = Date();
//                            post = Post(title: textTitle, content: textContent, img: "", comment: post.comment, createdBy: post.createdBy, createdByImg: post.createdByImg, createdAt: Date())
//                            family.setPostData(post: post)
//                        }
//                    }
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

//class ViewController: UIImagePickerControllerDelegate,UINavigationControllerDelegate {
//
//    let imagePicker = UIImagePickerController() // 사진, 앨범을 열 수 있는 이미지 피커 상수
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        self.imagePicker.delegate = self
//    }
//
//    func showAlertAuth(
//        _ type: String
//    ) {
//        if let appName = Bundle.main.infoDictionary!["CFBundleDisplayName"] as? String {
//            let alertVC = UIAlertController(
//                title: "설정",
//                message: "\(appName)이(가) \(type) 접근 허용되어 있지 않습니다. 설정화면으로 가시겠습니까?",
//                preferredStyle: .alert
//            )
//            let cancelAction = UIAlertAction(
//                title: "취소",
//                style: .cancel,
//                handler: nil
//            )
//            let confirmAction = UIAlertAction(title: "확인", style: .default) { _ in
//                UIApplication.shared.open(URL(string: UIApplication.openSettingsURLString)!, options: [:], completionHandler: nil)
//            }
//            alertVC.addAction(cancelAction)
//            alertVC.addAction(confirmAction)
//            self.present(alertVC, animated: true, completion: nil)
//        }
//    }
//
//    private func openPhotoLibrary() {
//        if (UIImagePickerController.isSourceTypeAvailable(.photoLibrary)) {
//            self.imagePicker.sourceType = .photoLibrary
//            self.imagePicker.modalPresentationStyle = .currentContext
//            self.present(self.imagePicker, animated: true, completion: nil)
//        } else {
//            print("앨범에 접근할 수 없습니다.")
//        }
//    }
//    func albumAuth() {
//        switch PHPhotoLibrary.authorizationStatus() {
//        case .denied:
//            print("거부")
//            self.showAlertAuth("앨범")
//        case .authorized:
//            print("허용")
//            self.openPhotoLibrary()
//        case .notDetermined, .restricted:
//            print("아직 결정하지 않은 상태")
//            PHPhotoLibrary.requestAuthorization { state in
//                if state == .authorized {
//                    self.openPhotoLibrary()
//                } else {
//                    self.dismiss(animated: true, completion: nil)
//                }
//            }
//        default:
//            break
//        }
//    }
//}

//struct SnsPostWriteView_Previews: PreviewProvider {
//    static var previews: some View {
//       SnsPostWriteView(user:User(token: "admin", completion: <#T##(User) -> Void#>))
//    }
//}
