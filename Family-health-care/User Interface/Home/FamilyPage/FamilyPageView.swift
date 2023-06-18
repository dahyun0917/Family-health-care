//
//  ContentView.swift
//  Family-health-care
//
//  Created by 이다현 on 2023/05/03.
//

import SwiftUI

struct FamilyPageView: View {
    @State private var isPresented = false
    @EnvironmentObject private var fam : Family
    var body: some View {
        NavigationView{
            ZStack{
                GeometryReader{ geometry in
                    ScrollView(showsIndicators:false){
                        VStack{
//                            ForEach(fam.users.indices){index in
//                                let user = fam.users[index]
//                                NavigationLink(destination: MyPageView().accentColor(.black)){
//                                    FamilyMemberView(
//                                        borderColor: index % 2 == 0 ? Color.mainBeige : Color.mainBlue,
//                                        innerColor: index % 2 == 0 ? Color.mainLightBeige : Color.mainGrey)
//                                    .frame(width:geometry.size.width*0.9,height:geometry.size.width*0.45)
//                                    .environmentObject(user)
//                                }
//                            }.buttonStyle(PlainButtonStyle())
                        }.padding(.leading,20)
                    }
                }
               
                Button(action:{
                    isPresented.toggle()
                }){
                    Rectangle()
                        .clipShape(Circle())
                        .foregroundColor(.mainBlue)
                        .overlay(
                            Image(systemName:"megaphone.fill").foregroundColor(.white))
                }
                .buttonStyle(PlainButtonStyle())
                .frame(width:50,height:50)
                .position(x:350,y:680)
                .sheet(isPresented: $isPresented){
                    FamilyPromiseView()}
            }
            .navigationTitle("지원이네")
            
                
        }
    }
}

struct FamilyPageView_Previews: PreviewProvider {
    static var previews: some View {
        //FamilyPageView()
        Text("Df")
    }
}
