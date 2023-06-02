//
//  PromiseView.swift
//  Family-health-care
//
//  Created by 류지원 on 2023/05/09.
//

import SwiftUI

struct PromiseView: View {
    var text : String = "다짐 예시 문장입니다."
    var date : String = "2023.04.15"
    var complete : Bool = false
    var color : Color = Color.mainBeige
    
    var body: some View {
        
        GeometryReader{ geometry in
            ZStack{
                
                VStack{
                    HStack{
                        Text(date).font(.system(size:14)).padding(.leading,20)
                        Spacer()
                        
                        Image(systemName:"ellipsis").padding(.trailing,20)
                    }.padding(.top,5)
                    Spacer()
                    Text(text).multilineTextAlignment(.leading)
                    Spacer()
                    
                }.frame(width:geometry.size.width,height:geometry.size.height).position(x:geometry.size.width/2,y:geometry.size.height/2)
                    .background(complete ? Color.gray:color).cornerRadius(20)
                
            }
            if complete{
                Image("welldone").resizable()
                    .opacity(0.5)
                    .frame(width:geometry.size.width*0.5,height:geometry.size.height)
                    .position(x:geometry.size.width*0.5,y:geometry.size.height*0.5)
            }
        }
        
    }
}

struct PromiseView_Previews: PreviewProvider {
    static var previews: some View {
        PromiseView(text: "영양ddfdfdfdffdfdfdf제 매일 꼭 챙겨먹자 우리가족 화이팅! 가나다라마바사", date: "2023.04.15", complete:true,color:Color.mainBeige)
    }
}
