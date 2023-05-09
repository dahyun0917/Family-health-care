//
//  PromiseView.swift
//  Family-health-care
//
//  Created by 류지원 on 2023/05/09.
//

import SwiftUI

struct PromiseView: View {
    let text : String, date : String
    
    var body: some View {
        VStack{
            
            Text(date).font(.system(size:14)).padding(.trailing,250)
            Spacer().padding(.bottom)
            Text(text).frame(width:300)
            Spacer().padding(.top)
        }.frame(maxWidth:344,maxHeight:165).background(Color.mainBeige).cornerRadius(20)
    }
}

struct PromiseView_Previews: PreviewProvider {
    static var previews: some View {
        PromiseView(text: "영양제 매일 꼭 챙겨먹자 우리가족 화이팅! 가나다라마바사", date: "2023.04.15")
    }
}
