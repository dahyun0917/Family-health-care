//
//  CharacterView.swift
//  Family-health-care
//
//  Created by seokhyeon on 2023/05/06.
//

import SwiftUI

struct CharacterView: View {
    
    var body: some View {
        
        ZStack{
            Color.clear
            GeometryReader { geometry in
                let parentWidth = geometry.size.width
                let outerWidth = geometry.size.width-30
                let innerWidth = geometry.size.width-50
                let parentHeight = geometry.size.height
                
                VStack(alignment: .center){
                    Spacer()
                    NavigationView{
                        let gifWidth = parentWidth*0.85
                        let gifHeight = parentWidth*0.85
                        ZStack{
                            Color.mainBeige
                            GifImage("temp")
                                .frame(width:gifWidth, height:gifHeight)
//                                .border(Color.black)
                            
                            NavigationLink(destination: SickView()){
                                Symbol("magnifyingglass", scale:.large, color: .black)
                            }
                            .position(x:gifWidth, y:gifHeight)
                        }
                    }
                    
                    Spacer()
                    
                    Chat()
                        .frame(width:innerWidth, height:innerWidth*0.8)
                    
                    HStack{
                        Spacer()
                        Symbol("pill.fill", scale:.large)
                        Spacer()
                        Symbol("pill.fill", scale:.large)
                        Spacer()
                        Symbol("pill", scale:.large)
                        Spacer()
                    }
                    .frame(width:innerWidth, height:50)
                    .background(Color.white)
                    .cornerRadius(40)
                    .padding(10)
                    
                }.frame(width: outerWidth, height: parentHeight)
                    .background(Color.mainBeige)
                    .cornerRadius(25)
                    .position(x:parentWidth/2, y:parentHeight/2)
            }
        }.background(Color.mainGrey)
        
    }
}



struct CharacterView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterView()
    }
}
