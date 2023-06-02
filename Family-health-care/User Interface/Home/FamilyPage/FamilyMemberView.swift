//
//  FamilyMemberView.swift
//  Family-health-care
//
//  Created by 류지원 on 2023/05/04.
//

import SwiftUI

struct FamilyMemberView: View {
    @State private var isPopup = false
    var borderColor : Color, innerColor : Color
    var names = ["아스피린","글루페스트","타이레놀","활명수","이석현"]
    @State private var pillIndex = -1
    var body: some View {
        
        GeometryReader{ geometry in
            ZStack{
                HStack{
                    HStack{
                        VStack {
                            GeometryReader{ inGeo in
                                VStack{
                                    Rectangle()
                                        .fill(innerColor)
                                        .frame(width: inGeo.size.width,height:inGeo.size.height*0.8)
                                        .cornerRadius(20)
                                        .overlay(
                                            Image("postPicTest")
                                                .resizable()
                                                .clipShape(Circle()))
                                    Text("엄마").frame(width: inGeo.size.width, height:inGeo.size.height*0.2).background(innerColor).cornerRadius(20)
                                }
                            }
                        }.frame(width:geometry.size.width/3)
                            .padding(.bottom,5)
                        VStack{
                            GeometryReader{ inGeo in
                                VStack{
                                    PromiseView(text:"영양제 매일 꼭 챙겨먹자 우리가족 화이팅!",date:"2023.04.15",color: innerColor)
                                        .cornerRadius(20)
                                        .frame(width: inGeo.size.width, height:inGeo.size.height*0.8)
                                    HStack{
                                        Text("저녁")
                                        
                                        ForEach(1..<5){row in
                                           Image(systemName: "pill").onTapGesture {
                                                self.pillIndex = row
                                                withAnimation(.spring()){
                                                    self.isPopup.toggle()
                                                }
                                            }
                                        }
                                        
                                    }.frame(width: inGeo.size.width, height:inGeo.size.height*0.2).background(innerColor).cornerRadius(20)
                                }
                            }
                        }.frame(width:geometry.size.width*0.55)
                            .padding(.bottom,5)
                    }.padding(10)
                }.background(borderColor).cornerRadius(30).position(x:geometry.size.width/2,y:geometry.size.height/2)
                
            }
            if isPopup{
                ZStack{
                    MedicineInform(color:borderColor,name:names[pillIndex]).offset(x:geometry.size.width*0.5,y:geometry.size.height*0.6)}
            }
        }
        
    }
}

struct FamilyMemberView_Previews: PreviewProvider {
    static var previews: some View {
        FamilyMemberView(borderColor: Color.mainBeige, innerColor: Color.mainLightBeige)
    }
}
