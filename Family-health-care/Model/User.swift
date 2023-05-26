//
//  User.swift
//  Family-health-care
//
//  Created by 류지원 on 2023/05/24.
//

import Foundation
import FirebaseFirestore

final class User{
    var walk : Walk
    var userName : String
    var
    let image : String
    var promise : [Promise]
    var medicineState : [MedicineState]
    var medicine : [Medicine]
    var heightWeight : HeightWeight
    init(token:String){
        let db = Firestore.firestore()
        let user = db.collection("users").document(token)
        
        // user information
        user.getDocument(){ (doc, error) in
            guard error == nil, let doc = doc, doc.exists else{
                print("Error: \(error?.localizedDescription ?? "")")
                return
            }
            let info = doc.data()
            if let info = info{
                print(info)
                if let walk = info["walk"] as? NSNumber{
                    self.walk = Walk(walk:walk.intValue)
                }
                
                if let height = info["height"] as? NSNumber, let weight = info["weight"] as? NSNumber{
                    self.heightWeight = HeightWeight(height:height.intValue,weight:weight.intValue)
                }
            
            }
        }
    
    }
}
