//
//  CharacterTabView.swift
//  Family-health-care
//
//  Created by seokhyeon on 2023/05/29.
//

import SwiftUI

struct CharacterTabView: View {
    @Binding var gifName: String
    
    var body: some View{
        ZStack{
            GifView(gifName: $gifName)
                .aspectRatio(contentMode: .fit)
            VStack{
                Spacer()
                HStack{
                    Spacer()
                    NavigationLink(destination: SickView()){
                        Symbol("magnifyingglass", scale:.large, color: .black)
                            .padding(5)
                            .background(Circle().fill(Color.mainLightBeige))
                    }
                }
            }
        }.padding()
    }
}

//struct CharacterTabView_Previews: PreviewProvider {
//    static var previews: some View {
//        CharacterTabView()
//    }
//}
