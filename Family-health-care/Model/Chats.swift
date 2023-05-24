//
//  Chats.swift
//  Family-health-care
//
//  Created by seokhyeon on 2023/05/14.
//

import Foundation
import Firebase

final class Chats: ObservableObject{
    @Published var botMessages : [BotMessage] = []
    @Published var userMessages : [UserMessage] = []
    var allMessages: [any Message] {
        let combined = botMessages as [any Message] + userMessages as [any Message]
        return combined.sorted(by: { $0.id < $1.id })
    }
    init(token:String){
                // 임시 데이터
                var temp_bot = [
                    BotMessage(id:Date(timeIntervalSince1970: 0),body:"안녕 첫 대화야"),
                    BotMessage(id:Date(timeIntervalSince1970: 1),body:"아침 약으로 진통제와 혈압약 먹을 시간이야!", answers:["먹었어", "까먹었어", "싫어"])]

                self.botMessages = temp_bot
//                        self.userMessages = temp_user
        
        
//        //firebase에서 사용자의 채팅 내역을 가져옴
//        fetchBotMessage(token)
//        fetchUserMessage(token)
    }
    
}


extension Chats{
    func respondToBot(target targetBotMessage : BotMessage, response : String){
        self.userMessages.append(UserMessage(body: response, associated: targetBotMessage.id))
        if let idx = self.botMessages.firstIndex(where: {$0.id == targetBotMessage.id}){
            self.botMessages[idx].needAnswer = false
        }
    }
    
    func fetchBotMessage(_ token : String){
        let db = Firestore.firestore()
        let user = db.collection("users").document(token)
        let botMessages = user.collection("BotMessage")
        
        //        // user information
        //        user.getDocument(){ (doc, error) in
        //            guard error == nil, let doc = doc, doc.exists else{
        //                print("Error: \(error?.localizedDescription ?? "")")
        //                return
        //            }
        //            let info = doc.data()
        //            if let info = info{
        //                print(info)
        //            }
        //        }
        
        botMessages.getDocuments(){ (botMessageSnapshot, error) in
            guard error == nil, let botMessageSnapshot = botMessageSnapshot else{
                print("Error: \(error?.localizedDescription ?? "")")
                return
            }
            
            for botMessageDoc in botMessageSnapshot.documents{
                guard let timestamp = botMessageDoc["time"] as? Timestamp else {
                    print("Error: Unable to cast 'time' to Timestamp.")
                    continue
                }
                let body = botMessageDoc.data()["body"] as? String ?? ""
                let answers = botMessageDoc.data()["answers"] as? [String] ?? []
                self.botMessages.append(BotMessage(id:timestamp.dateValue(), body:body, answers: answers))
            }
        }
        
    }
    func fetchUserMessage(_ token : String){
        let db = Firestore.firestore()
        let user = db.collection("users").document(token)
        let userMessages = user.collection("UserMessage")
        
        userMessages.getDocuments(){ (userMessageSnapshot, error) in
            guard error == nil, let userMessageSnapshot = userMessageSnapshot else{
                print("Error: \(error?.localizedDescription ?? "")")
                return
            }
            
            for userMessageDoc in userMessageSnapshot.documents{
                guard let timestamp_id = userMessageDoc["time"] as? Timestamp, let timestamp_associated = userMessageDoc["associated"] as? Timestamp
                else {
                    print("Error: Unable to cast 'time', 'associated' to Timestamp.")
                    continue
                }
                let body = userMessageDoc.data()["body"] as? String ?? ""
                self.userMessages.append(UserMessage(id:timestamp_id.dateValue(), body:body, associated: timestamp_associated.dateValue()))
            }
        }
        
    }
}
