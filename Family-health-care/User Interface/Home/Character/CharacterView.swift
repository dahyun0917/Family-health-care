//
//  CharacterView.swift
//  Family-health-care
//
//  Created by seokhyeon on 2023/05/06.
//

import SwiftUI

struct CharacterView: View {
    @State private var gifName : String = "man_gif"
    @State private var selected = 0
    @State private var showPopover = false
    @State private var mealTime = 0
    
    var body: some View {
        ZStack{
            Color.clear
            
            GeometryReader { parent_proxy in
                let parentWidth = parent_proxy.size.width
                let outerWidth = parent_proxy.size.width-30
                let innerWidth = parent_proxy.size.width-50
                let innerHeight = parent_proxy.size.height-50
                let parentHeight = parent_proxy.size.height
                
                
//                VStack(alignment: .center){
                ScrollView{
                    NavigationView{
                        VStack{
                            CharacterTabMenuBar(selected: $selected)
                            TabView(selection: $selected) {
                                CharacterTabView(gifName: $gifName).tag(0)
                                CharacterSelectionView(gifName:$gifName).tag(1)
                            }
                        }
                        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                        .background(Color.mainBeige)
                        .onChange(of: gifName){ _ in
                            withAnimation{ selected = 0 }
                        }
                    }
                    .navigationBarHidden(true)
                    .frame(width:innerWidth)
                    
                    Spacer()
                    
                    ChatView()
                        .frame(width:innerWidth, height:min(innerHeight*0.8, innerWidth*0.8))
                    
                    ZStack{
                        medicineTakenView(showPopover: $showPopover, mealTime: $mealTime)
                            .frame(width:innerWidth, height:50)
                            .background(Color.white)
                            .cornerRadius(40)
                            .padding(10)
                        if showPopover {
                            VStack{
                                Text(mealTimeString)
                                ForEach((groupedMedicineStates[mealTime]?.map { $0.medicineName } ?? []), id:\.self) { medicineName in
                                    Text(medicineName)
                                    
                                }
                            }.padding()
                                .background(Color.mainLightBeige)
                                .cornerRadius(10)
                                .shadow(radius: 10)
                                .offset(x: 0, y: -50)
                        }
                    }
                    
                    
                }.frame(width: outerWidth, height: parentHeight)
                    .background(Color.mainBeige)
                    .cornerRadius(25)
                    .position(x:parentWidth/2, y:parentHeight/2)
            }
        }
        .background(Color.mainGrey)
        .onTapGesture {
            withAnimation(.spring()) {
                self.showPopover = false
            }
        }
        
    }
}

private extension CharacterView {
    var mealTimeString: String {
        switch mealTime {
        case 0:
            return "아침"
        case 1:
            return "점심"
        default:
            return "저녁"
        }
    }
    
    var groupedMedicineStates: [Int: [MedicineState]] {
        var grouped: [Int: [MedicineState]] = [:]
        
        for medicineState in medicineStateSamples {
            let mealTime = medicineState.meal
            if grouped[mealTime] == nil {
                grouped[mealTime] = [medicineState]
            } else {
                grouped[mealTime]?.append(medicineState)
            }
        }
        
        return grouped
    }
}


struct CharacterView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterView().environmentObject(Chats(token:"admin"))
    }
}
