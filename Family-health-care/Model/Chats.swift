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
    init(){
        // 임시 데이터
        var temp_bot = [
            BotMessage(id:Date(timeIntervalSince1970: 0),body:"안녕 첫 대화야"),
            BotMessage(id:Date(timeIntervalSince1970: 1),body:"아침 약으로 진통제와 혈압약 먹을 시간이야!", answers:["먹었어", "까먹었어", "싫어"])]
        
        self.botMessages = temp_bot
//        self.userMessages = temp_user
        
        //firebase에서 사용자의 채팅 내역을 가져옴
    }
    
}


extension Chats{
    func respondToBot(target targetBotMessage : BotMessage, response : String){
        self.userMessages.append(UserMessage(body: response, associated: targetBotMessage.id))
        if let idx = self.botMessages.firstIndex(where: {$0.id == targetBotMessage.id}){
            self.botMessages[idx].needAnswer = false
        }
    }
    
    func fetchMessage(message:any Message){
        //add message
    }
}
