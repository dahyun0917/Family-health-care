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
            Rectangle().edgesIgnoringSafeArea(.all).foregroundColor(Color.mainGrey)
            
                NavigationStack{
                    List {
                        FamilyMemberView(borderColor: Color.mainBlue, innerColor: Color.mainGrey)
                        FamilyMemberView(borderColor: Color.mainBeige, innerColor: Color.mainLightBeige)
                        FamilyMemberView(borderColor: Color.mainBlue, innerColor: Color.mainGrey)
                        FamilyMemberView(borderColor: Color.mainBeige, innerColor: Color.mainLightBeige)
                        FamilyMemberView(borderColor: Color.mainBlue, innerColor: Color.mainGrey)
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
