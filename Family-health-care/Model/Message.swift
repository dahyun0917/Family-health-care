//
//  Message.swift
//  Family-health-care
//
//  Created by seokhyeon on 2023/05/13.
//

import Foundation

struct Message:Identifiable{
    let id :UUID = UUID()
    let isCharacter: Bool
    let body: String
    let answers: [String]
    init(isCharacter: Bool, body: String, answers: [String]=[]) {
        self.isCharacter = isCharacter
        self.body = body
        self.answers = answers
    }
}

var sampleMessage=[
    Message(isCharacter:true, body:"진통제와 혈압약 먹을 시간이야dsfjhoaiwejfoawjeiofgjawoegjawoe;gjoawerigjaworgijawrogj"),
    Message(isCharacter:false, body: "먹었어weiofjioawejfoawjeoifjaweoifjasioefjoiawejof"),
    Message(isCharacter: true, body: "GOOD!"),
    Message(isCharacter:true, body:"진통제와 혈압약 먹을 시간이야", answers:["알았어", "먹었어", "싫어요"]),
    Message(isCharacter:false, body: "먹었어"),
    Message(isCharacter: true, body: "GOOD!"),
    Message(isCharacter:true, body:"진통제와 혈압약 먹을 시간이야", answers:["알았어", "먹었어", "싫어요"]),
    Message(isCharacter:false, body: "먹었어"),
    Message(isCharacter: true, body: "GOOD!"),
    Message(isCharacter:true, body:"진통제와 혈압약 먹을 시간이야", answers:["알았어", "먹었어", "싫어요"]),
]
