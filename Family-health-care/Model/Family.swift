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
    @Published var posts : [Post] = []{
        didSet(oldValue){
            if (posts.count != lastPostCount && posts.count - oldValue.count>0) {addPostData(token: self.postToken)}
            else if(posts.count == oldValue.count){
                for i in 0...posts.count {
                    if posts[i].comment.count != oldValue[i].comment.count{
                        if oldValue[i].comment.count == 0 {
                            addCommentData(token: self.postToken+"Storys",index:i,first: true)
                        }
                        else{
                            addCommentData(token: self.postToken+"Storys",index:i,first: false)
                        }
                    }
                }
            }
        }
    }
    @Published var storys : [Story] = []{
        didSet(oldValue){
            if (storys.count != lastStoryCount && storys.count - oldValue.count>0) {addStoryData(token: self.storyToken)}
        }
    }
    var flag : Bool = true
    let db = Firestore.firestore()
    @Published var postToken = ""
    @Published var storyToken = ""
    @Published var lastPostCount = 0
    @Published var lastStoryCount = 0
    
    
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
                        self.postToken = family.path+"/Posts"
                        self.storyToken = family.path+"/Storys"
                        self.getPostData(token : self.postToken){
                        }
                        self.getStoryData(token: self.storyToken){
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
    
    func getPostData (token:String, completion: @escaping () -> Void){
        
        db.collection(token).getDocuments() { (querySnapshot,err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for document in querySnapshot!.documents {
                    let info = document.data()
                    let title = info["title"] as? String ?? ""
                    let content = info["content"] as? String ?? ""
                    let img = info["img"] as? String ?? ""
                    let createdBy = info["createdBy"] as? String ?? ""
                    let createdByImg = info["createdByImg"] as? String ?? ""
                    let createdAt = info["createdAt"] as? Timestamp ?? Timestamp()
                    
                    
                    self.getCommentData(token: token+"/"+document.documentID+"/comments") { (comments) in
                        // 이곳에서 comments 데이터를 사용할 수 있습니다.
                        let post:Post = Post(title: title, content: content, img: img, comment : comments, createdBy: createdBy, createdByImg : createdByImg, createdAt: createdAt.dateValue() )
                        self.lastPostCount += 1
                        self.posts.append(post)
                        
                    }
                }
                completion()
            }
            
        }
        
        
    }
    
    func addPostData (token:String){
        let post: [String: Any] = [
            "title" : posts.last!.title,
            "content" : posts.last!.content,
            "img" : posts.last!.img,
            "createdBy" : posts.last!.createdBy,
            "createdAt" : posts.last!.createdAt
        ]
        let newRef = db.collection(token).document()
        newRef.setData(post){ err in
            if let err = err {
                print("Error writing document: \(err)")
            } else {
                print("Document successfully written!")
                self.lastPostCount += 1
                
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
                    let createdByImg = info["createdByImg"] as? String ?? ""
                    let createdAt = (info["createdAt"] as? Timestamp ?? Timestamp())
                    
                    comments.append(Comment(content:content,createdBy: createdBy,createdByImg: createdByImg, createdAt: createdAt.dateValue()))
                }
                completion(comments)
                
            }
        }
    }
    
    func addCommentData (token:String,index:Int,first:Bool) {
        let comment: [String: Any] = [
            "content" : posts[index].comment.last!.content,
            "createdBy" : posts[index].comment.last!.createdBy,
            "craetedBy" : posts[index].comment.last!.createdByImg,
            "createdAt" : posts[index].comment.last!.createdAt
        ]
        if first{
            let newRef = db.collection(token).document()
            newRef.setData(comment){ err in
                if let err = err {
                    print("Error writing document: \(err)")
                } else {
                    print("Document successfully written!")
                }
            }
        }
    }
    
    
    
    func getStoryData(token:String, completion: @escaping () -> Void) {
        db.collection(token).getDocuments() { (querySnapshot,err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for document in querySnapshot!.documents {
                    let info = document.data()
                    let content = info["content"] as? String ?? ""
                    let img = info["img"] as? String ?? ""
                    let createdBy = info["createdBy"] as? String ?? ""
                    let createdByImg = info["createdByImg"] as? String ?? ""
                    let createdAt = info["createdAt"] as? Timestamp ?? Timestamp()
                    
                    
                    let story:Story = Story(content: content, img: img, createdBy: createdBy, createdByImg: createdByImg, createdAt: createdAt.dateValue())
                    self.lastStoryCount += 1
                    self.storys.append(story)
                }
                completion()
            }
            
        }
    }
    
    func addStoryData (token:String){
        let story: [String: Any] = [
            "content" : storys.last!.content,
            "img" : storys.last!.img,
            "createdBy" : storys.last!.createdBy,
            "createdByImg" : storys.last!.createdByImg,
            "createdAt" : storys.last!.createdAt
        ]
        let newRef = db.collection(token).document()
        newRef.setData(story){ err in
            if let err = err {
                print("Error writing document: \(err)")
            } else {
                print("Document successfully written!")
                self.lastPostCount += 1
                
            }
        }
        
    }
}
