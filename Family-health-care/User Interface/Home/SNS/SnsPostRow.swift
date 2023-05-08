//
//  SnsPostRow.swift
//  Family-health-care
//
//  Created by 이다현 on 2023/05/08.
//

import SwiftUI

struct SnsPostRow: View {
    var body: some View {
        VStack{
            SnsUserProfile()
            postContent
        }
        .frame(height: 400)
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
            Image("postPicTest")
                .resizable()
                .scaledToFill()
                .frame(width: 300, height: 150,alignment: .center)
                .padding([.leading, .bottom, .trailing],10)
                
            Text("오운완 15일째")
                .font(.headline)
                .padding(.leading,20)
            Text("운동한지 15일 째 ~! 아직 시작단계지만 뿌듯 😝  선아는 벌써 이틀째 운동 쉬는중,, 내일은 선아랑 같이 헬스장 가야지~~ #다이어트 15일차 #건강 #하자 #ㅋㅋㅋ")
                .font(.caption)
                .frame(width: 300,height: 50)
                .padding(.horizontal,20)
                .padding(.top,1)
                .padding(.bottom,5)
            
            HStack(spacing: 0){
                Image(systemName: "heart")
                    .imageScale(.large)
                    .foregroundColor(.red)
                    .frame(width: 25, height: 25)
                Text("6")
                    .font(.caption)
                    .padding(.leading,5)
                    .padding(.trailing,10)
                
                Image(systemName: "ellipsis.message")
                    .imageScale(.large)
                    .frame(width: 25, height: 25)
                Text("13")
                    .font(.caption)
                    .frame(width: 32, height: 32)
            }
            .padding(.leading,20)
            .padding(.bottom,20)
                
        }
    }
}

struct SnsPostRow_Previews: PreviewProvider {
    static var previews: some View {
        SnsPostRow()
    }
}
