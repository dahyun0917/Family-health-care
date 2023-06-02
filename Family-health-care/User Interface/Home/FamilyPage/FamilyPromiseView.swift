//
//  FamilyPromiseView.swift
//  Family-health-care
//
//  Created by 류지원 on 2023/05/09.
//

import SwiftUI

struct FamilyPromiseView: View {
    var body: some View {
        ZStack{
            
            NavigationView{
                GeometryReader{ geometry in
                    List(0..<6){ row in
                        NavigationLink(destination: Text("상세 페이지")){
                            PromiseView(text:"약 꼭 챙겨먹자 우리가족 화이팅!",date:"2012.02.11",complete:row == 3 ? true : false,color:row % 2 == 0 ? Color.mainBeige : Color.mainBlue)
                                .frame(width:geometry.size.width-50,height:geometry.size.width*0.35)
                        }
                    }.listStyle(PlainListStyle())
                }
            }.navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct FamilyPromiseView_Previews: PreviewProvider {
    static var previews: some View {
        FamilyPromiseView()
    }
}
