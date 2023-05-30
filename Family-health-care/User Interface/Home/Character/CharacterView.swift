//
//  CharacterView.swift
//  Family-health-care
//
//  Created by seokhyeon on 2023/05/06.
//

import SwiftUI

struct CharacterView: View {
    @State private var gifName : String = "man_gif"

    var body: some View {
        ZStack{
            Color.clear
            
            GeometryReader { parent_proxy in
                let parentWidth = parent_proxy.size.width
                let outerWidth = parent_proxy.size.width-30
                let innerWidth = parent_proxy.size.width-50
                let parentHeight = parent_proxy.size.height
                
                
                VStack(alignment: .center){
                    GeometryReader { geometry_Gif in
                        
                        NavigationView{
                            ScrollViewReader{scrollProxy in
                                ScrollView(.horizontal, showsIndicators: false){
                                    
                                    HStack(spacing:0){
                                        ZStack{
                                            GifView(gifName: "man_gif")
                                                .frame(width:geometry_Gif.size.width, height:geometry_Gif.size.height)
                                                .aspectRatio(contentMode: .fit)
                                            
                                            
                                            NavigationLink(destination: SickView()){
                                                Symbol("magnifyingglass", scale:.large, color: .black)
                                            }.position(x:geometry_Gif.size.width*0.85, y:geometry_Gif.size.height*0.85)
                                        }
                                        .frame(width:geometry_Gif.size.width, height:geometry_Gif.size.height).id("start")
                                        CharacterSelectionView(gifName:$gifName).frame(width:geometry_Gif.size.width, height:geometry_Gif.size.height)
                                    }
                                    
                                }.onChange(of: gifName) { _ in
                                    withAnimation{
                                        scrollProxy.scrollTo("start", anchor: .leading)
                                    }
                                }
                                .background(Color.mainBeige)
                            }
                            
                        }
                    }
                    .onAppear{UIScrollView.appearance().isPagingEnabled = true}
                    Spacer()
                    
                    Chat()
                        .frame(width:innerWidth, height:innerWidth*0.8)
                    
                    medicineTakenView()
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
        CharacterView().environmentObject(Chats(token:"admin"))
    }
}
