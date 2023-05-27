//
//  SnsPostDetailView.swift
//  Family-health-care
//
//  Created by 이다현 on 2023/05/07.
//

import SwiftUI

struct SnsPostDetailView: View {
    @State var commentText:String = ""
    var body: some View {
        NavigationView{
            ZStack(alignment: .bottomTrailing){
                ScrollView{
                    VStack {
                        postDetail
                        VStack(spacing: 0){
                        ForEach(0...5, id: \.self) { _ in
                                Text("--------------------------------------------")
                                VStack(alignment: .leading){
                                    Comment
                                        .padding(.leading,15)
                                    
                                }
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
                SnsUserProfile(createdBy: "dlekgus1353", createdAt: Date())
                postContent
            }
            .background(Color.primary.colorInvert())
            //        .background(Color.mainGrey)
            .cornerRadius(15)
            .overlay(RoundedRectangle(cornerRadius: 15)
                .stroke(Color.black, lineWidth: 0.2))
//            .shadow(color: .mainBeige, radius: 1, x: 2, y: 2)
            .padding([.leading,.top,.trailing],25)
            
            HStack(spacing: 0){
                Image(systemName: "ellipsis.message")
                    .imageScale(.medium)
                    .frame(width: 25, height: 25)
                Text("13")
                    .font(.caption)
                    .frame(width: 32, height: 32)
            }
            .padding(.leading,20)
            
        }
        
    }
    var postContent: some View {
        VStack(alignment: .leading){
            Image("postPicTest")
                .resizable()
                .scaledToFill()
                .frame(width: 300, height: 150,alignment: .center)
                .padding([.bottom, .trailing],10)
                .padding(.leading,20)
            HStack{
                Text("오운완 15일째")
                    .font(.headline)
                    .padding(.leading,20)
                Spacer()
//                Image(systemName: "heart")
//                    .imageScale(.small)
//                    .foregroundColor(.red)
//                    .frame(width: 25, height: 25)
//                Text("6")
//                    .font(.caption)
//                    .padding(.trailing,10)
            }
            Text("운동한지 15일 째 ~! 아직 시작단계지만 뿌듯 😝  선아는 벌써 이틀째 운동 쉬는중,, 내일은 선아랑 같이 헬스장 가야지~~     #다이어트 15일차 #건강 #하자 #ㅋㅋㅋ")
                .font(.caption)
//                .frame(maxWidth: .infinity, minHeight: 50, maxHeight: 100)
                .padding(.horizontal,20)
                .padding(.top,1)
                .padding(.bottom,20)
                
        }
    }
    var Comment: some View {
        HStack{
            Image(systemName: "person")
                .resizable()
                .scaledToFill()
                .frame(width: 40, height: 40)
                .cornerRadius(30)
                .overlay(RoundedRectangle(cornerRadius: 30)
                    .stroke(Color.black, lineWidth: 0.2))
            VStack(alignment: .leading){
                HStack{
                    Text("dlekgus1353")
                        .font(.caption)
                        .fontWeight(.bold)
                        
                    Text("Aug 23")
                        .font(.caption2)
                        .fontWeight(.thin)
                        .lineLimit(1)
                    Spacer()
                }
                .padding(.bottom, 3)
                Text("안녕하세요안녕하세요안녕하세요안녕하세요안녕하세요안녕하세요안녕하세요안녕하세요안녕하세요안녕하세요안녕하세요안녕하세요안녕하세요안녕하세요안녕하세요안녕하세요안녕하세요")
                    .font(.callout)
                    .padding(.horizontal,10)
            }
            
        }
        .padding(.horizontal,10)
        .padding(.top,20)
        .padding(.bottom,20)
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



struct SnsPostDetailView_Previews: PreviewProvider {
    static var previews: some View {
        SnsPostDetailView()
    }
}
