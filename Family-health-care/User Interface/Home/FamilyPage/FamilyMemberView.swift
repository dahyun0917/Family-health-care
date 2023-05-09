//
//  FamilyMemberView.swift
//  Family-health-care
//
//  Created by 류지원 on 2023/05/04.
//

import SwiftUI

struct FamilyMemberView: View {
    var borderColor : Color
    var innerColor : Color
    
    var body: some View {
        HStack{
            VStack {
                Image("injured").resizable().frame(width:116,height:131).background(innerColor).cornerRadius(20)
                Text("엄마").frame(width:116,height:32).background(innerColor).cornerRadius(20)
                
            }
            VStack{
                VStack{
                    HStack{
                        Text("2023.04.15").font(.system(size:12))
                        Spacer().frame(width:100)
                    }
                    Spacer()
                    Text("영양제 매일 꼭 챙겨먹자 우리가족 화이팅!")
                    Spacer().frame(height: 45)
                }.frame(width:187,height:114).background(innerColor).cornerRadius(20)
                HStack{
                    
                    Text("저녁")
                    Image(systemName:"pill").resizable().frame(width:34,height:34)
                    Image(systemName:"pill").resizable().frame(width:34,height:34)
                    Image(systemName:"pill").resizable().frame(width:34,height:34)
                    
                }.frame(width:186,height:46).background(innerColor).cornerRadius(20)
                
            }
        }.frame(width:350,height:192).background(borderColor).cornerRadius(30).overlay(Image(systemName:"arrowtriangle.forward.fill").resizable().frame(width:10,height:40).foregroundColor(innerColor).padding(.leading,330))
    }
    
    
}

struct FamilyMemberView_Previews: PreviewProvider {
    static var previews: some View {
        FamilyMemberView(borderColor: Color.mainBeige, innerColor: Color.mainLightBeige)
    }
}
