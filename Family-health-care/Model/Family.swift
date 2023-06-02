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
    init(user : String){
        getUserData(userId: user)
        print(users)
    }
    
    func getUserData (userId : String){
        let db = Firestore.firestore()
        var names : [String] = []
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
                        //print("\(type(of: doc.data()!))")
                        if let users = doc["users"]! as? [String]{
                            for i in users{
                                names.append(i)
                            }
                            for name in names{
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
