//
//  Test.swift
//  Family-health-care
//
//  Created by seokhyeon on 2023/05/16.
//

import Foundation
import Firebase

final class Test: ObservableObject{
    @Published var t:Timestamp
    @Published var born : Int

    init(){
        self.t=Timestamp()
        self.born = 0
        fetchData()
        
    }

    func fetchData(){
        let db = Firestore.firestore()
        let ref_collection = db.collection("users")
        ref_collection.getDocuments{ (snapshot, error) in
            guard error == nil, snapshot != nil else{
                print("Error")
                return
            }

            for doc in snapshot!.documents{
                let ref_document = ref_collection.document(doc.documentID)
                ref_document.getDocument{(document, error) in
                    guard error == nil, document != nil else{
                        print("Error")
                        return
                    }

                    if let document = document, document.exists{
                        let info = document.data()
                        if let info = info {

                            if let timestamp = info["time"] as? Timestamp {
                                print("\(timestamp.dateValue())")
                                print("\(type(of: timestamp.dateValue()))")
                                self.t = timestamp
                                print(">>\(self.t)")
                                    }
                            if let born = info["born"] as? Int{
                                self.born=born
                            }
                        }
                    }
                }
            }


        }
        return
    }
}

