//
//  Family.swift
//  Family-health-care
//
//  Created by 류지원 on 2023/05/24.
//

import Foundation
import FirebaseFirestore

final class Family: ObservableObject{
    @Published var users : [User] = []
    var flag : Bool = true
    init(user : User){
        getUserData(userId: user.userId)
        self.users.append(user)
    }
    
    func getUserData (userId : String){
        let db = Firestore.firestore()
        db.collection("users").document(userId).getDocument(){(doc, error) in
            guard error == nil, let doc = doc, doc.exists else{
                print("Error: \(error?.localizedDescription ?? "")")
                return
            }
            let info = doc.data()
            
            if let info = info{
                if let family = info["family"] as? DocumentReference{
                    family.getDocument{ (doc, error) in
                        guard error == nil, let doc = doc, doc.exists else{
                            print("Error: \(error?.localizedDescription ?? "")")
                            return
                        }
                        if let users = doc["users"]! as? [String]{
                            for name in users{
                                if name != userId{
                                    let _ = User(token:name){ use in
                                        self.users.append(use)
                                    }
                                }
                            }
                            
                        }

                    }
                    
                }
            }
           
        }
        
    }
}
