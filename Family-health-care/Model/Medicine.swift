//
//  Medicine.swift
//  Family-health-care
//
//  Created by seokhyeon on 2023/05/09.
//

import Foundation

struct Medicine{
    let id : UUID = UUID()
    let medicineName : String
    let Company : String
    let Efficiency : String
    let useMethod : String
    let Warning : String
    let Instruction : String
    let depositMethod : String
    let medicineImage : String
}

extension Medicine : Identifiable{}
extension Medicine : Equatable{}
