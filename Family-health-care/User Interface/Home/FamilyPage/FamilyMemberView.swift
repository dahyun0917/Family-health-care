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
        GeometryReader{ geometry in
            
            HStack{
                HStack{
                    VStack {
                        Image("injured").resizable().background(innerColor).cornerRadius(20)
                        Text("엄마").frame(height:geometry.size.height/10).padding(.horizontal,geometry.size.width/10).background(innerColor).cornerRadius(20)
                        
                    }.frame(width:geometry.size.width/3)
                    VStack{
                        PromiseView(text:"영양제 매일 꼭dfdfdfd 챙겨먹자 우리가족 화이팅!",date:"2023.04.15",color: Color.mainLightBeige)
                            .cornerRadius(20)
                        
                        HStack{
                            Text("저녁")
                            Image(systemName:"pill")
                            Image(systemName:"pill")
                            Image(systemName:"pill")
                            
                        }.frame(height:geometry.size.height/10).padding(.horizontal,geometry.size.width/10).background(innerColor).cornerRadius(20)
                        
                    }.frame(width:geometry.size.width*0.55)
                }.padding(10)
            }.background(borderColor).cornerRadius(30).position(x:geometry.size.width/2,y:geometry.size.height/2)
        }
    }
    
    
}

struct FamilyMemberView_Previews: PreviewProvider {
    static var previews: some View {
        FamilyMemberView(borderColor: Color.mainBeige, innerColor: Color.mainLightBeige)
    }
}
