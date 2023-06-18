//
//  MedicineState2.swift
//  Family-health-care
//
//  Created by 양선아 on 2023/06/18.
//

import Foundation

struct MedicineState2{
    let medicineName: String
    let timeList: [String]
    let isComplete: [Bool]
    
    var dateTimeList: [Date] {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        var dateList:[Date] = []
        for i in 0..<timeList.count {
            dateList.append(formatter.date(from: timeList[i]) ?? Date())
        }
        return dateList
    }
}
