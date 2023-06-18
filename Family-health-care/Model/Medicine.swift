//
//  Medicine.swift
//  Family-health-care
//
//  Created by seokhyeon on 2023/05/09.
//

import Foundation

struct Medicine: Hashable{
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

struct MedicationsForPain {
    let pain: String
    let medications: [String]
    
    var recommendation: String {
        let medicationList = medications.enumerated().map { "\($0.offset + 1). \($0.element)\n" }.joined(separator: "")
                return "\(pain)에 추천하는 약은\n\(medicationList)이 있습니다."
        }
}

//import Foundation
//
//struct Medicine {
//    let medicineName: String
//    let medicineImage: String
//    let description: String
//}
//
let medicineSamples = [
    Medicine(medicineName: "글루패스트", Company: "postPicTest", Efficiency: "이 약은 제2형 당뇨병 환자의 혈당조절을 향상시키기위해 식사요법 및 운동요법의 보조제로 투여한다.", useMethod: "test", Warning: "test", Instruction: "test", depositMethod: "test", medicineImage: "postPicTest"),
    Medicine(medicineName: "글루패스트1", Company: "postPicTest", Efficiency: "이 약은 제2형 당뇨병 환자의 혈당조절을 향상시키기위해 식사요법 및 운동요법의 보조제로 투여한다.", useMethod: "test", Warning: "test", Instruction: "test", depositMethod: "test", medicineImage: "postPicTest"),
    Medicine(medicineName: "글루패스트2", Company: "postPicTest", Efficiency: "이 약은 제2형 당뇨병 환자의 혈당조절을 향상시키기위해 식사요법 및 운동요법의 보조제로 투여한다.", useMethod: "test", Warning: "test", Instruction: "test", depositMethod: "test", medicineImage: "postPicTest"),
    Medicine(medicineName: "글루패스트3", Company: "postPicTest", Efficiency: "이 약은 제2형 당뇨병 환자의 혈당조절을 향상시키기위해 식사요법 및 운동요법의 보조제로 투여한다.", useMethod: "test", Warning: "test", Instruction: "test", depositMethod: "test", medicineImage: "test"),
    Medicine(medicineName: "글루패스트4", Company: "postPicTest", Efficiency: "이 약은 제2형 당뇨병 환자의 혈당조절을 향상시키기위해 식사요법 및 운동요법의 보조제로 투여한다.", useMethod: "test", Warning: "test", Instruction: "test", depositMethod: "test", medicineImage: "test"),
    Medicine(medicineName: "글루패스트5", Company: "postPicTest", Efficiency: "이 약은 제2형 당뇨병 환자의 혈당조절을 향상시키기위해 식사요법 및 운동요법의 보조제로 투여한다.", useMethod: "test", Warning: "test", Instruction: "test", depositMethod: "test", medicineImage: "test"),
    Medicine(medicineName: "글루패스트6", Company: "postPicTest", Efficiency: "이 약은 제2형 당뇨병 환자의 혈당조절을 향상시키기위해 식사요법 및 운동요법의 보조제로 투여한다.", useMethod: "test", Warning: "test", Instruction: "test", depositMethod: "test", medicineImage: "test"),
    Medicine(medicineName: "글루패스트7", Company: "postPicTest", Efficiency: "이 약은 제2형 당뇨병 환자의 혈당조절을 향상시키기위해 식사요법 및 운동요법의 보조제로 투여한다.", useMethod: "test", Warning: "test", Instruction: "test", depositMethod: "test", medicineImage: "postPicTest"),
    Medicine(medicineName: "글루패스", Company: "postPicTest", Efficiency: "이 약은 제2형 당뇨병 환자의 혈당조절을 향상시키기위해 식사요법 및 운동요법의 보조제로 투여한다.", useMethod: "test", Warning: "test", Instruction: "test", depositMethod: "test", medicineImage: "postPicTest"),
    Medicine(medicineName: "헬로우", Company: "postPicTest", Efficiency: "이 약은 제2형 당뇨병 환자의 혈당조절을 향상시키기위해 식사요법 및 운동요법의 보조제로 투여한다.", useMethod: "test", Warning: "test", Instruction: "test", depositMethod: "test", medicineImage: "test"),
]
