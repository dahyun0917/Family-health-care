//
//  FamilyPromiseView.swift
//  Family-health-care
//
//  Created by 류지원 on 2023/05/09.
//

import SwiftUI

struct FamilyPromiseView: View {
    @EnvironmentObject private var fam : Family
    var body: some View {
        
            ZStack{
                NavigationView{
                    GeometryReader{ geometry in
                        ScrollView{
                            VStack{
//                                ForEach(fam.users,id:\.userId){ user in
//                                    ForEach(user.promise.indices){ index in
//                                        let promise = user.promise[index]
//                                        NavigationLink(destination: Text("상세 페이지")){
//                                            PromiseView(text:promise.promiseDetail,date:"dfdf",complete:promise.isComplete,option:-1,color:index%2 == 0 ?Color.mainBeige:Color.mainBlue,user:user)
//                                                .frame(width:geometry.size.width-50,height:geometry.size.width*0.35)
//                                        }
//                                    }.buttonStyle(PlainButtonStyle())
//                                }.buttonStyle(PlainButtonStyle())
//                                    .position(x:geometry.size.width*0.5,y:geometry.size.height*0.1)
                            }
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
