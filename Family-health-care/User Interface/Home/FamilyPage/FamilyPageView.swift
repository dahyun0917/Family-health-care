//
//  ContentView.swift
//  Family-health-care
//
//  Created by 이다현 on 2023/05/03.
//

import SwiftUI

struct FamilyPageView: View {
    var body: some View {
        ZStack{
            Rectangle().edgesIgnoringSafeArea(.all).foregroundColor(Color.white)
            
            NavigationView{
                GeometryReader{ geometry in
                    List(0..<4) {row in
                        if row % 2 == 0 {
                            NavigationLink(destination: Text("Hi")){
                                FamilyMemberView(borderColor: Color.mainBlue, innerColor: Color.mainGrey).frame(width:geometry.size.width*0.9,height:geometry.size.width*0.45)
                            }
                        }
                        else{
                            NavigationLink(destination: Text("Hi")){
                                FamilyMemberView(borderColor: Color.mainBeige, innerColor: Color.mainLightBeige).frame(width:geometry.size.width*0.9,height:geometry.size.width*0.45)
                            }
                        }
                    }
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
