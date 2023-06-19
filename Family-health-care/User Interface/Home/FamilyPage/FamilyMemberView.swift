//
//  FamilyMemberView.swift
//  Family-health-care
//
//  Created by 류지원 on 2023/05/04.
//

import SwiftUI

struct FamilyMemberView: View {
    @State var user : User
    @State private var isPopup = false
    var borderColor : Color, innerColor : Color
    @State private var pillName : String = "nil"
    @State private var pillTaken : Bool = false
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
                                            GifView(gifName:$user.charImage).aspectRatio(contentMode: .fit)
                                                .clipShape(Circle()))
                                    Text(user.userName).frame(width: inGeo.size.width, height:inGeo.size.height*0.2).background(innerColor).cornerRadius(20)
                                }
                            }
                        }.frame(width:geometry.size.width/3)
                            .padding(.bottom,5)
                        VStack{
                            GeometryReader{ inGeo in
                                VStack{
                                    PromiseView(text:user.promise.first!.promiseDetail,date:user.promise.first!.dateFormatted(),color: innerColor,user:user)
                                        .cornerRadius(20)
                                        .frame(width: inGeo.size.width, height:inGeo.size.height*0.8)
                                    HStack{
                                        
                                        ForEach(user.medicineState,id:\.self.medicineName){med in
                                            if med.isComplete{
                                                Image(systemName:"pill.fill")
                                                    .onTapGesture {
                                                        self.pillName = med.medicineName
                                                        withAnimation(.spring()){
                                                            self.isPopup.toggle()
                                                        }
                                                    }
                                            } else {
                                                Image(systemName: "pill").onTapGesture {
                                                    self.pillName = med.medicineName
                                                    self.pillTaken = med.isComplete
                                                    withAnimation(.spring()){
                                                        self.isPopup.toggle()
                                                    }
                                                }
                                            }
                                        }
                                        
                                    }.frame(width: inGeo.size.width, height:inGeo.size.height*0.2).background(innerColor).cornerRadius(20)
                                }
                            }
                        }.frame(width:geometry.size.width*0.55)
                            .padding(.bottom,5)
                    }.padding(10)
                }.background(borderColor).cornerRadius(20).position(x:geometry.size.width/2,y:geometry.size.height/2)
                
            }
            if isPopup{
                ZStack{
                    MedicineInform(color:borderColor,name:pillName,complete:pillTaken).offset(x:geometry.size.width*0.5,y:geometry.size.height*0.6)}
            }
        }
        
    }
}

struct FamilyMemberView_Previews: PreviewProvider {
    static var previews: some View {
        //FamilyMemberView(borderColor: Color.mainBeige, innerColor: Color.mainLightBeige)
        Text("d")
    }
}
