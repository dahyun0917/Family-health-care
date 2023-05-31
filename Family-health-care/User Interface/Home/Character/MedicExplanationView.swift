//
//  MedicExplanationView.swift
//  Family-health-care
//
//  Created by seokhyeon on 2023/05/30.
//

import SwiftUI

struct MedicExplanationView: View {
    @EnvironmentObject private var medicines : Medicines
    let medicineName : String
    var body: some View {
        VStack{
            NavigationBar(title: "약 정보")
            ScrollView{
                if let item_key = medicines.medicines.firstIndex(where:{$0.medicineName == medicineName}){
                    let item = medicines.medicines[item_key]
                    elementView(target:"약 이름", item.medicineName)
                    elementView(target: "효능", item.Efficiency)
                    elementView(target: "복용 방법", item.useMethod)
                    elementView(target: "보관 방법", item.depositMethod)
                    elementView(target: "주의 사항", item.Warning)
                }
                else{
                    Text("None")
                }
                Spacer()
                
            }.navigationBarHidden(true)
        }
    }
    
    func elementView(target:String, _ content:String) -> some View{
        return VStack{
            HStack{
                Text(target)
                Spacer()
            }
            HStack{
                Text(content)
                Spacer()
            }.padding(10).background(Color.mainLightBeige).cornerRadius(10)
        }.padding(10)
    }
}
