//
//  medicineTakenView.swift
//  Family-health-care
//
//  Created by seokhyeon on 2023/05/19.
//

import SwiftUI

struct medicineTakenView: View {
    @EnvironmentObject private var userLoader : UserLoader
    @Binding var showPopover : Bool
    @Binding var mealTime : Int
    
    var body: some View {
        HStack{
            Spacer()
            ForEach(groupedMedicineStates.keys.sorted(), id: \.self) { mealTime in
                let medicines = groupedMedicineStates[mealTime]
                let symbolName = (medicines != nil && medicines!.contains(where: { $0.isComplete })) ? "pill.fill" : "pill"
                
                Symbol(symbolName, scale:.large)
                    .onTapGesture {
                        withAnimation(.spring()) {
                            self.showPopover = true
                            self.mealTime = mealTime
                        }
                        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                            withAnimation(.spring()) {
                                self.showPopover = false
                            }
                        }
                    }
                Spacer()
            }
        }
    }
}

private extension medicineTakenView{
    var groupedMedicineStates: [Int: [MedicineState]] {
        var grouped: [Int: [MedicineState]] = [:]
        if let user = userLoader.user{
            for medicineState in user.medicineState{
                let mealTime = medicineState.meal
                if grouped[mealTime] == nil {
                    grouped[mealTime] = [medicineState]
                } else {
                    grouped[mealTime]?.append(medicineState)
                }
            }
        }
        return grouped
    }
}

//struct medicineTakenView_Previews: PreviewProvider {
//    static var previews: some View {
//        medicineTakenView()
//    }
//}
