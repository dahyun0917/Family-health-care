//
//  Medicine.swift
//  Family-health-care
//
//  Created by seokhyeon on 2023/05/09.
//

//import Foundation
//
//struct Medicine{
//    let id : UUID = UUID()
//    let medicineName : String
//    let Company : String
//    let Efficiency : String
//    let useMethod : String
//    let Warning : String
//    let Instruction : String
//    let depositMethod : String
//    let medicineImage : String
//}
//
//extension Medicine : Identifiable{}
//extension Medicine : Equatable{}

import Foundation

struct Medicine {
    let medicineName: String
    let medicineImage: String
    let description: String
}

let medicineSamples = [
    Medicine(medicineName: "글루패스트", medicineImage: "postPicTest", description: "이 약은 제2형 당뇨병 환자의 혈당조절을 향상시키기위해 식사요법 및 운동요법의 보조제로 투여한다."),
]
