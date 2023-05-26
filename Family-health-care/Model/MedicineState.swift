//
//  MedicineState.swift
//  Family-health-care
//
//  Created by 양선아 on 2023/05/16.
//

import Foundation

struct MedicineState {
    let medicineName: String
    let time: String
    var isComplete: Bool = false
}

let medicineStateSamples = [
    MedicineState(medicineName: "글루패스트", time: "6:30", isComplete: true),
    MedicineState(medicineName: "글루패스트", time: "11:30", isComplete: true),
    MedicineState(medicineName: "알러텍정", time: "11:30", isComplete: true),
    MedicineState(medicineName: "글루패스트", time: "18:00"),
    MedicineState(medicineName: "종합비타민", time: "20:00"),
]
