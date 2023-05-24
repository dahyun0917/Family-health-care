////
////  Medicines.swift
////  Family-health-care
////
////  Created by seokhyeon on 2023/05/09.
////
//
//import Foundation
//import Firebase
//
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
