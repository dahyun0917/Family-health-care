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
    @State private var loading_gif : String = "loading"
    
    var body: some View {
        
        if flag{
            if let user = userLoader.user{
                navView()
                    .environmentObject(Family(user:user))
                    .environmentObject(userLoader)
                    .environmentObject(MedicationsForPainOfParts())
                    .environmentObject(Medicines())
            }
        }
        else{
            ZStack {
                Color.mainBeige.ignoresSafeArea(.all)
                VStack{
                    GifView(gifName:$loading_gif)
                        .aspectRatio(contentMode: .fit)
                        .frame(width:200)
                }
                Image("sprout")
                    .resizable()
                    .scaledToFit()
                    .frame(width:450)
                    .rotationEffect(.degrees(-40))
                    .offset(x:180, y:-100)
                Image("gom")
                    .resizable()
                    .scaledToFit()
                    .frame(width:400)
                    .rotationEffect(.degrees(0))
                    .offset(x:0, y:400)
            }
            .onAppear{
                DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2.7) {
                    flag = true
                }
            }
        }
    }
}
