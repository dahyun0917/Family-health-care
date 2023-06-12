//
//  CharacterTabView.swift
//  Family-health-care
//
//  Created by seokhyeon on 2023/05/29.
//

import SwiftUI

struct CharacterTabView: View {
    @Binding var gifName: String
    @Binding var goSickView : Bool
    
    var body: some View{
        ZStack{
            GifView(gifName: $gifName)
                .aspectRatio(contentMode: .fit)
            VStack{
                Spacer()
                HStack{
                    Spacer()
                        Symbol("magnifyingglass", scale:.large, color: .black)
                            .padding(5)
                            .background(Circle().fill(Color.mainLightBeige))
                            .onTapGesture {
                                goSickView = true
                            }
                }
            }
        }.padding()
    }
}
