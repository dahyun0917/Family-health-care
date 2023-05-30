//
//  ContentView.swift
//  Family-health-care
//
//  Created by 이다현 on 2023/05/03.
//

import SwiftUI

struct FamilyPageView: View {
    @State private var isPresented = false
    var body: some View {
        ZStack{
            Rectangle()
                .edgesIgnoringSafeArea(.all)
                .foregroundColor(Color.white)
            
            NavigationView{
                ZStack{
                    GeometryReader{ geometry in
                        List(0..<5) {row in
                            NavigationLink(destination: MyPageView()){
                                FamilyMemberView(
                                    borderColor: row % 2 == 0 ? Color.mainBlue : Color.mainBeige,
                                    innerColor: row % 2 == 0 ? Color.mainGrey : Color.mainLightBeige)
                                .frame(width:geometry.size.width*0.9,height:geometry.size.width*0.45)
                            }
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
                    .position(x:350,y:700)
                    .sheet(isPresented: $isPresented){
                        FamilyPromiseView()}
                }
            }
        }
            
        
    }
}

struct FamilyPageView_Previews: PreviewProvider {
    static var previews: some View {
        FamilyPageView()
    }
}
