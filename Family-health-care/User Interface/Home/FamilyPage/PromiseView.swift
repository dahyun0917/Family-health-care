//
//  PromiseView.swift
//  Family-health-care
//
//  Created by 류지원 on 2023/05/09.
//

import SwiftUI

struct PromiseView: View {
    let text : String, date : String
    let color : Color
    var body: some View {
        GeometryReader{ geometry in
            VStack{
                HStack{
                    Text(date).font(.system(size:14)).padding(.leading,20)
                    Spacer()
                }
                Spacer().padding(.bottom)
                Text(text).multilineTextAlignment(.leading)
                Spacer().frame(height:geometry.size.height*0.4)
                
            }.background(color).cornerRadius(20).frame(width:geometry.size.width,height:geometry.size.height).position(x:geometry.size.width/2,y:geometry.size.height/2)
        }
    }
}

struct PromiseView_Previews: PreviewProvider {
    static var previews: some View {
        PromiseView(text: "영양ddfdfdfdffdfdfdf제 매일 꼭 챙겨먹자 우리가족 화이팅! 가나다라마바사", date: "2023.04.15", color:Color.mainBeige)
    }
}
