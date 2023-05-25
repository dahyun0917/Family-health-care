//
//  CharacterSelectionView.swift
//  Family-health-care
//
//  Created by seokhyeon on 2023/05/23.
//

import SwiftUI

struct CharacterSelectionView: View {
    @Binding var gifName : String
    var body: some View {
        VStack{
            HStack{
                CharacterMenu(gifName:$gifName,imageName: "man")
                CharacterMenu(gifName:$gifName,imageName: "man")
            }
            HStack{
                CharacterMenu(gifName:$gifName,imageName: "man")
                CharacterMenu(gifName:$gifName,imageName: "man")
            }
        }.padding()
    }
}

private extension CharacterSelectionView{
    struct CharacterMenu:View{
        @Binding var gifName : String
        var imageName:String
        var body: some View{
            GeometryReader { proxy in
                VStack{
                    Image(imageName)
                        .resizable()
                        .scaledToFit()
                        .onTapGesture{
                            
                            gifName = imageName+"_gif"
                            print(gifName)
                        }
                }.frame(width:proxy.size.width, height:proxy.size.height)
                    .background(Color.mainLightBeige)
                    .cornerRadius(20)
            }
        }
    }
}

//struct CharacterSelectionView_Previews: PreviewProvider {
//    static var previews: some View {
//        CharacterSelectionView(gifName: "test")
//    }
//}
