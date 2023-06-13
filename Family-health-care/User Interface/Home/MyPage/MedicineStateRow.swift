//
//  MedicineStateRow.swift
//  Family-health-care
//
//  Created by 양선아 on 2023/05/16.
//

import SwiftUI

struct MedicineStateRow: View {
    @State var medicineStates: [MedicineState]
    let columns: [GridItem] = [GridItem(.flexible())]
    var body: some View {
        HStack{
            VStack{
                Text(medicineStates[0].time)
                //Text("아침식사").font(.system(size:12))
                //Text("식전 30분").foregroundColor(.blue).font(.system(size:12))
            }
            //            Image(systemName:"circle.circle")
            //                .foregroundColor(Color.lightGray)
            Spacer().frame(width:50)
            HStack{
                LazyVGrid(columns:columns) {
                    Spacer()
                    ForEach(0..<medicineStates.count, id: \.self) { index in
                        HStack {
                            Spacer()
                            Text(medicineStates[index].medicineName)
                                .foregroundColor(.white)
                            //.padding(.trailing)
                            Spacer()
                            if medicineStates[index].isComplete {
                                Button {
                                    medicineStates[index].isComplete = false
                                } label: {
                                    VStack {
                                        Image(systemName:"checkmark.square.fill").foregroundColor(Color.white)
                                        //Image(systemName:"checkmark.square").foregroundColor(Color.white)
                                        Text("복용완료!")
                                            .font(.system(size: 7))
                                            .foregroundColor(Color.white)
                                    }.frame(width: 30,height: 25).padding(.trailing, 20)
                                }
                            }
                            else {
                                Button {
                                    medicineStates[index].isComplete = true
                                } label: {
                                    Image(systemName:"checkmark.square").frame(width: 30, height: 25)
                                        .foregroundColor(Color.white).padding(.trailing, 20)
                                }
                            }
                            //Spacer()
                        }
                    }
                    Spacer()
                }.frame(width:230).background(Color.mainBeige).cornerRadius(20)
            }//.padding(.vertical)
            //.frame(height: 60)
        }
    }
}

struct MedicineStateRow_Previews: PreviewProvider {
    static var previews: some View {
        MedicineStateRow(medicineStates: medicineStateSamples)
    }
}
