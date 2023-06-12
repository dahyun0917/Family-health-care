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
    @Published var posts : [Post] = []
    @Published var storys : [Story] = []
    var postPath : String = ""
    var flag : Bool = true
    let db = Firestore.firestore()
    init(user : User){
        getUserData(userId: user.userId)
        self.users.append(user)
    }
    
    func getUserData (userId : String){
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
                        self.getPostData(token:family.path+"/Posts")
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
    
    func getPostData (token:String){
        
        db.collection(token).getDocuments() { (querySnapshot,err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for document in querySnapshot!.documents {
//                    print("\(document.documentID) => \(document.data())")
                    let info = document.data()
                    
//                    DispatchQueue.main.asyncAfter(deadline: .now() + 1){
//                        let comments:[Comment] = self.getCommentData(token: token+"/"+document.documentID+"/comments")
                        
                        
//                        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                            let title = info["title"] as? String ?? ""
                            let content = info["content"] as? String ?? ""
                            let img = info["img"] as? String ?? ""
                            let createdBy = info["createdBy"] as? String ?? ""
                            let createdAt = info["createdAt"] as? Date ?? Date()
                    
                    
                    self.getCommentData(token: token+"/"+document.documentID+"/comments") { (comments) in
                        // 이곳에서 comments 데이터를 사용할 수 있습니다.
                        let post:Post = Post(title: title, content: content, img: img, comment : comments, createdBy: createdBy, createdAt: createdAt)
                        
                        self.posts.append(post)
                    }
//                        }
//                    }
                }
            }
        }
        
    }
    
    func getCommentData (token:String, completion: @escaping ([Comment]) -> Void) {
        var comments:[Comment] = []
        db.collection(token).getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for document in querySnapshot!.documents {
                    let info = document.data()
                    
                    let content:String = info["content"] as? String ?? ""
                    let createdBy = info["createdBy"] as? String ?? ""
                    let createdAt = info["createdAt"] as? Date ?? Date()

                    comments.append(Comment(content:content,createdBy: createdBy, createdAt: createdAt))
                }
                completion(comments)
                
            }
        }
    }

    
    
    func getStoryData(token:String) {
        
    }
        
}
