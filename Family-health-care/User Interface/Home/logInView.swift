//
//  logInView.swift
//  Family-health-care
//
//  Created by 류지원 on 2023/06/02.
//

import SwiftUI
struct logInView: View {
    @EnvironmentObject private var userLoader : UserLoader
    @State private var flag : Bool = false
    
    var body: some View {
        
        
        NavigationStack {
            ZStack {
                Color.mainBeige.ignoresSafeArea(.all)
                if let user = userLoader.user{
                    
                    NavigationLink(destination: CharacterView().environmentObject(Family(user:user)).environmentObject(userLoader)
                    ,isActive: $flag,label:{})
                        
                    
                }
            }
        }.onAppear{
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 3) {
                flag = true
            }
        }
    }
    
}

struct logInView_Previews: PreviewProvider {
    static var previews: some View {
        //logInView()
        Text("hi")
    }
}


