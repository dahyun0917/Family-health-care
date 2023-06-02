//
//  Message.swift
//  Family-health-care
//
//  Created by seokhyeon on 2023/05/13.
//

import Foundation

protocol Message: Identifiable {
    var id: Date { get }
    var body: String { get }
    var source: String { get }
}

struct BotMessage:Message{
    let id : Date
    let type : Int
    let body : String
    var needAnswer : Bool
    let answers : [Int:String]
    var source: String {
            return "Bot"
        }
    static let type : String = "Bot"

    init(id : Date = Date(), body: String, answers:[String]=[], type:Int = 0){
        self.id = id
        self.needAnswer = answers.count == 0 ? false : true
        self.body = body
        
//        self.answers = answers
        var temp = [Int:String]()
        for (index, element) in answers.enumerated() {
            temp[index + 1] = element
        }
        self.answers = temp
        
        self.type = type
    }
}

struct UserMessage:Message{
    let id : Date
    let associated : Date
    let body : String
    var source: String {
            return "User"
        }
    static let type : String = "User"
    
    init(id : Date = Date(), body : String, associated : Date){
        self.id = id
        self.body = body
        self.associated = associated
    }
}
