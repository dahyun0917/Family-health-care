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
            }
            Spacer().frame(width:50)
            HStack{
                LazyVGrid(columns:columns) {
                    Spacer()
                    ForEach(0..<medicineStates.count, id: \.self) { index in
                        HStack {
                            Spacer()
                            Text(medicineStates[index].medicineName)
                                .foregroundColor(.white)
                            Spacer()
                            if medicineStates[index].isComplete {
                                Button {
                                    medicineStates[index].isComplete = false
                                } label: {
                                    VStack {
                                        Image(systemName:"checkmark.square.fill").foregroundColor(Color.white)
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
                        }
//                        if let medicine2 = medicineNameDict[medicine.medicineName] {
//                            var newMedicine = Medicine(medicineName: medicine2.medicineName, Company: "", Efficiency: "", useMethod: "", Warning: "", Instruction: "", depositMethod: "", medicineImage: "")
//                            NavigationLink (
//                                destination: MyPageEditMedicineStateView(medicine: newMedicine, timeList: medicine2.dateTimeList, completeList: medicine2.isComplete, isChosen: $isChosen)
//                                    .environmentObject(medicines)
//                                    .environmentObject(userLoader)
//                            )
//                            {
//                                HStack {
//                                    Spacer()
//                                    Text(medicineStates[index].medicineName)
//                                        .foregroundColor(.white)
//                                    Spacer()
//                                    if medicineStates[index].isComplete {
//                                        Button {
//                                            medicineStates[index].isComplete = false
//                                        } label: {
//                                            VStack {
//                                                Image(systemName:"checkmark.square.fill").foregroundColor(Color.white)
//                                                Text("복용완료!")
//                                                    .font(.system(size: 7))
//                                                    .foregroundColor(Color.white)
//                                            }.frame(width: 30,height: 25).padding(.trailing, 20)
//                                        }
//                                    }
//                                    else {
//                                        Button {
//                                            medicineStates[index].isComplete = true
//                                        } label: {
//                                            Image(systemName:"checkmark.square").frame(width: 30, height: 25)
//                                                .foregroundColor(Color.white).padding(.trailing, 20)
//                                        }
//                                    }
//                                }
//                            }
//                        }
                    }
                    Spacer()
                }.frame(width:230).background(Color.mainBeige).cornerRadius(20)
            }//.padding(.vertical)
            //.frame(height: 60)
        }
    }
}
