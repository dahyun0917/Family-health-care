//
//  MedicineStateRow.swift
//  Family-health-care
//
//  Created by 양선아 on 2023/05/16.
//

import SwiftUI

struct MedicineStateRow: View {
    let medicineState: MedicineState
    
    var body: some View {
        HStack{
            VStack{
                Text(medicineState.time)
                //Text("아침식사").font(.system(size:12))
                //Text("식전 30분").foregroundColor(.blue).font(.system(size:12))
            }
            Image(systemName:"circle.circle")
                .foregroundColor(Color.lightGray)
            Spacer().frame(width:50)
            HStack{
                Text(medicineState.medicineName)
                    .foregroundColor(.white)
                    .padding(.trailing)
                VStack{
                    Image(systemName:"checkmark.square.fill").foregroundColor(Color.white)
                    //Image(systemName:"checkmark.square").foregroundColor(Color.white)
                    Text("복용완료!")
                        .font(.system(size: 7))
                        .foregroundColor(Color.white)
                }
            }.frame(width:185,height: 44).background(Color.mainBeige).cornerRadius(20)
        }
        .frame(height: 60)
    }
}

struct MedicineStateRow_Previews: PreviewProvider {
    static var previews: some View {
        MedicineStateRow(medicineState: medicineStateSamples[0])
    }
}
