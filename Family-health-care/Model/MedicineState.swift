//
//  MedicineState.swift
//  Family-health-care
//
//  Created by 양선아 on 2023/05/16.
//

import Foundation

struct MedicineState: Hashable{
    let medicineName: String
    let time: String
    var isComplete: Bool = false
    
    var meal: Int {
            let formatter = DateFormatter()
            formatter.dateFormat = "HH:mm"

            if let date = formatter.date(from: time) {
                let calendar = Calendar.current
                let hour = calendar.component(.hour, from: date)

                switch hour {
                case 5..<11:
                    return 0  // 아침
                case 11..<16:
                    return 1  // 점심
                default:
                    return 2  // 저녁
                }
            } else {
                print("Invalid time format")
                return -1
            }
        }
}

let medicineStateSamples = [
    MedicineState(medicineName: "글루패스트", time: "6:30", isComplete: true),
    MedicineState(medicineName: "글루패스트", time: "11:30", isComplete: true),
    MedicineState(medicineName: "알러텍정", time: "11:30", isComplete: true),
    MedicineState(medicineName: "글루패스트", time: "18:00"),
    MedicineState(medicineName: "종합비타민", time: "20:00"),
]
