//
//  TabView.swift
//  Family-health-care
//
//  Created by 류지원 on 2023/05/30.
//

import SwiftUI

struct navView: View {
    init(){
        UITabBar.appearance().backgroundColor = UIColor(Color.white.opacity(0.5))
    }
    var body: some View {
        TabView{
            CharacterView()
                .tabItem{
                    Image(systemName:"figure.socialdance")
                    Text("캐릭터")
                }
            MyPageView()
                .tabItem{
                    Image(systemName: "person.circle")
                    Text("마이페이지")
                }
            SnsView(isWrite: false)
                .tabItem{
                    Image(systemName:"shareplay")
                    Text("SNS")
                }
            FamilyPageView()
                .tabItem{
                    Image(systemName: "figure.2.and.child.holdinghands")
                    Text("가족")
                }
            
        }
            
    }
}

struct navView_Previews: PreviewProvider {
    static var previews: some View {
        navView()
    }
}
