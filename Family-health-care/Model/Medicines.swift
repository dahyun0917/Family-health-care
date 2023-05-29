//
//  Medicines.swift
//  Family-health-care
//
//  Created by seokhyeon on 2023/05/09.
//

import Foundation
import Firebase
import SwiftUI

final class MedicationsForPainOfParts: ObservableObject{
    @Published var medicationsForPainOfParts: [String : [MedicationsForPain]]
    let partsName = ["Arm", "Eye", "Head", "Heart", "Leg", "Mouth", "Stomach", "Throat"]
    
    init(){
        self.medicationsForPainOfParts=[:]
        fetchData()
    }
    
    func fetchData(){
        let db = Firestore.firestore()
        let mfp = db.collection("medicationsForPain")
        
        for part in partsName{
            let part_ref = mfp.document(part).collection("Pain")
            part_ref.getDocuments(){ (painSnapshot, error) in
                guard error == nil, let painSnapshot = painSnapshot else{
                    print("error")
                    return
                }
                var medicationsForPain : [MedicationsForPain] = []
                for painDoc in painSnapshot.documents{
                    let medics = painDoc.data()["medications"] as? [String] ?? []
                    medicationsForPain.append(MedicationsForPain(pain: painDoc.documentID, medications: medics))
                }
                self.medicationsForPainOfParts[part] = medicationsForPain
                print("\(part), \(medicationsForPain)")
                
            }
        }
        
        
    }
}

//final class Medicines: ObservableObject{
//    @Published var medicines: [Medicine]
//
//    init(){
//        self.medicines=[]
//        fetchData()
//    }
//
//    func fetchData(){
//        let db = Firestore.firestore()
//        let ref_collection = db.collection("medicines")
//        ref_collection.getDocuments{ (snapshot, error) in
//            guard error == nil, snapshot != nil else{
//                print("Error")
//                return
//            }
//
//            for doc in snapshot!.documents{
//                let ref_document = ref_collection.document(doc.documentID)
//                ref_document.getDocument{(document, error) in
//                    guard error == nil, document != nil else{
//                        print("Error")
//                        return
//                    }
//
//                    if let document = document, document.exists{
//                        let info = document.data()
//                        if let info = info {
//                            print(info)
//                            self.medicines.append( Medicine(medicineName: info["medicineName"] as? String ?? "", Company: info["Company"] as? String ?? "", Efficiency: info["Efficiency"] as? String ?? "", useMethod: info["useMethod"] as? String ?? "", Warning: info["Warning"] as? String ?? "", Instruction: info["Instruction"] as? String ?? "", depositMethod: info["depositMethod"] as? String ?? "", medicineImage: info["medicineImage"] as? String ?? ""))
//                        }
//                    }
//                }
//            }
//
//
//        }
//        return
//    }
//}
