//
//  FamilyPromiseView.swift
//  Family-health-care
//
//  Created by 류지원 on 2023/05/09.
//

import SwiftUI

struct FamilyPromiseView: View {
    var body: some View {
        
        NavigationView{
            GeometryReader{ geometry in
                List{
                    NavigationLink(destination: Text("상세 페이지")){
                        PromiseView(text:"약 꼭 챙겨먹자 우리가족 화이팅!",date:"2012.02.11",color:Color.mainBeige).frame(width:geometry.size.width-100,height:geometry.size.width*0.25)
                    }
                    NavigationLink(destination: FamilyPageView()){
                        PromiseView(text:"약 꼭 챙겨먹자 우리가족 화이팅!",date:"2012.02.11",color:Color.mainBlue).frame(width:geometry.size.width-100,height:geometry.size.width*0.25)
                    }
                    
                    NavigationLink(destination: Text("상세 페이지")){
                        PromiseView(text:"약 꼭 챙겨먹자 우리가족 화이팅!",date:"2012.02.11",color:Color.mainBeige).frame(width:geometry.size.width-100,height:geometry.size.width*0.25)
                    }
                    NavigationLink(destination: Text("상세 페이지")){
                        PromiseView(text:"약 꼭 챙겨먹자 우리가족 화이팅!",date:"2012.02.11",color:Color.mainBlue).frame(width:geometry.size.width-100,height:geometry.size.width*0.25)
                    }
                    NavigationLink(destination: Text("상세 페이지")){
                        PromiseView(text:"약 꼭 챙겨먹자 우리가족 화이팅!",date:"2012.02.11",color:Color.mainBeige).frame(width:geometry.size.width-100,height:geometry.size.width*0.25)
                    }
                }
            }
        }
    }
}

struct FamilyPromiseView_Previews: PreviewProvider {
    static var previews: some View {
        FamilyPromiseView()
    }
}
