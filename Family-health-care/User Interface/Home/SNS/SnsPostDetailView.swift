//
//  SnsPostDetailView.swift
//  Family-health-care
//
//  Created by 이다현 on 2023/05/07.
//

import SwiftUI
import Kingfisher

struct SnsPostDetailView: View {
    @EnvironmentObject var family:Family
    @ObservedObject var post : Post
    @State var commentText:String = ""
    @State var showingAlert = false
    var user:User
    var body: some View {
        NavigationView{
            ZStack(alignment: .bottomTrailing){
                ScrollView{
                    VStack {
                        postDetail
                        VStack(spacing: 0){
                            ForEach(post.comment, id: \.id) { comment in
                                Text("--------------------------------------------")
                                commentView(comment:comment)
                                .padding(.leading,15)
                            }
                        }
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.bottom,80)
                }
                .onAppear {
                    UIScrollView.appearance().bounces = false
                }
                .onDisappear {
                    UIScrollView.appearance().bounces = true
                }
                HStack{
                    TextField("댓글 부탁",text: $commentText)
                        .padding()
                        .textFieldStyle(.roundedBorder)
                    Button("확인"){
                        let comment:Comment = Comment(content:commentText ,createdBy: user.userId, createdByImg: user.image, createdAt: Date())
                        post.comment.append(comment)
                        
                        let comment_temp: [String: Any] = [
                            "content" : post.comment.last!.content,
                            "createdBy" : post.comment.last!.createdBy,
                            "createdByImg" : post.comment.last!.createdByImg,
                            "createdAt" : post.comment.last!.createdAt
                        ]
                        if (post.comment.count == 1){family.setCommentData(comment:comment_temp,first: true,post:post)}
                        else {family.setCommentData(comment:comment_temp,first: false,post:post)}
                    
                    }
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .padding(.trailing,20)
                    
                }
                .background(Color.mainBlue)
                      
            }
            .onTapGesture {
                hideKeyboard()
            }
            
        }
    }
    
}
private extension SnsPostDetailView {
    var postDetail: some View {
        VStack(alignment: .leading){
            VStack{
                HStack{
                    SnsUserProfile(createdBy: "\(post.createdBy)", createdAt: post.createdAt,createdByImg: post.createdByImg)
//                    Spacer()
                    if (post.createdBy == user.userId) {
                        NavigationLink(destination: SnsPostWriteView(textTitle: post.title,textContent: post.content,user: user,update:true,lastUpdateTime:post.createdAt).navigationBarBackButtonHidden(true)) {
                            Image(systemName:"square.and.pencil")
                                .foregroundColor(Color.gray)
                        }
                        Image(systemName:"trash")
                            .foregroundColor(Color.gray)
                            .padding(.trailing,10)
                            .onTapGesture {
                                showingAlert = true
                            }
                            .alert(isPresented: $showingAlert) {
                                Alert(// showingAlert가 true가 되면 알림창 표시 Alert(
                                    title: Text("정말 삭제하시겠습니까?"),
                                    primaryButton: .default(Text("확인"), action: {family.deletePostData(post: post)}), secondaryButton: .cancel(Text("취소"))
                                )
                            }
                        
                    }
                }
                postContent
            }
            .background(Color.primary.colorInvert())
            //        .background(Color.mainGrey)
            .cornerRadius(15)
            .overlay(RoundedRectangle(cornerRadius: 15)
                .stroke(Color.black, lineWidth: 0.2))
            .padding([.leading,.top,.trailing],25)
            
            HStack(spacing: 0){
                Image(systemName: "ellipsis.message")
                    .imageScale(.medium)
                    .frame(width: 25, height: 25)
                Text("\(post.comment.count)")
                    .font(.caption)
                    .frame(width: 32, height: 32)
            }
            .padding(.leading,20)
            
        }
        
    }
    var postContent: some View {
        VStack(alignment: .leading){
            if (post.img != ""){
                KFImage(URL(string: post.img)!)
                    .placeholder { //플레이스 홀더 설정
                        //                  Image(systemName: "postPicTest")
                    }.retry(maxCount: 3, interval: .seconds(5)) //재시도
                    .onFailure { e in //실패
                         print("failure_SnsPostDetailView: \(e)")
                    }
                    .resizable()
                    .scaledToFill()
                    .frame(width: 300, height: 150,alignment: .center)
                    .padding([.bottom, .trailing],10)
                    .padding(.leading,20)
            }
            HStack{
                Text("\(post.title)")
                    .font(.headline)
                    .padding(.leading,20)
                Spacer()
            }
            Text("\(post.content)")
                .font(.caption)
//                .frame(maxWidth: .infinity, minHeight: 50, maxHeight: 100)
                .padding(.horizontal,20)
                .padding(.top,1)
                .padding(.bottom,20)

        }
    }
    
    func hideKeyboard() {
            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
        }
    func setLineDot(view: UIView, color: String){
        let borderLayer = CAShapeLayer()
        borderLayer.strokeColor = UIColor(named: color)?.cgColor
        borderLayer.lineDashPattern = [2, 2]
        borderLayer.frame = view.bounds
        borderLayer.fillColor = nil
        borderLayer.path = UIBezierPath(rect: view.bounds).cgPath
        
        view.layer.addSublayer(borderLayer)
    }
    
}

    
struct commentView : View {
    var comment:Comment
    let dateFormat: DateFormatter = {
               let formatter = DateFormatter()
                formatter.dateFormat = "YYYY년 M월 d일"
//                formatter.locale = Locale(identifier:"en")
                return formatter
        }()
    var body: some View {
        HStack{
            KFImage(URL(string: comment.createdByImg)!)
                  .placeholder { //플레이스 홀더 설정
                      Image(systemName: "person")
                  }.retry(maxCount: 3, interval: .seconds(5)) //재시도
                  .onSuccess {r in //성공
//                      print("succes: \(r)")
                  }
                  .onFailure { e in //실패
//                      print("failure: \(e)")
                  }
                  .resizable()
                  .scaledToFill()
                  .frame(width: 40, height: 40)
                  .cornerRadius(30)
                  .overlay(RoundedRectangle(cornerRadius: 30)
                      .stroke(Color.black, lineWidth: 0.2))

//            Image(systemName: "person")
//                .resizable()
//                .scaledToFill()
//                .frame(width: 40, height: 40)
//                .cornerRadius(30)
//                .overlay(RoundedRectangle(cornerRadius: 30)
//                    .stroke(Color.black, lineWidth: 0.2))
            VStack(alignment: .leading){
                HStack{
                    Text("\(comment.createdBy)")
                        .font(.caption)
                        .fontWeight(.bold)

                    Text("\(comment.createdAt, formatter: dateFormat)")
                        .font(.caption2)
                        .fontWeight(.thin)
                        .lineLimit(1)
                    Spacer()
                }
                .padding(.bottom, 3)
                Text("\(comment.content)")
                    .font(.callout)
                    .padding(.horizontal,10)
            }

        }
        .padding(.horizontal,10)
        .padding(.top,20)
        .padding(.bottom,20)
    }
}



//struct SnsPostDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        SnsPostDetailView(post:PostSamples[0])
//    }
//}
