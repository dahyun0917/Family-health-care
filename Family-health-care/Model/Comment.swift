//
//  Comment.swift
//  Family-health-care
//
//  Created by 이다현 on 2023/05/23.
//

import Foundation

struct Comment: Codable,Identifiable {
    let id: UUID = UUID()
    var content: String = ""
    let createdBy: String
    var createdAt: Date
}
let CommentSamples = [
    Comment(content:"오 정말 대단하다.",createdBy: "asdf",createdAt: Date()),
    Comment(content:"오 정말 대단하지 않다.",createdBy: "qwer",createdAt: Date()),
    Comment(content:"오 정말 ",createdBy: "zxcv",createdAt: Date()),
    Comment(content:"오 정",createdBy: "dfgh",createdAt: Date()),
    Comment(content:"오 ",createdBy: "qwe",createdAt: Date()),
    Comment(content:"말 대단하다.",createdBy: "asdewrf",createdAt: Date()),
    Comment(content:"대단하다.",createdBy: "assfdf",createdAt: Date()),
    Comment(content:"단하다.",createdBy: "er",createdAt: Date()),
    Comment(content:"하다.",createdBy: "tuj",createdAt: Date()),
    Comment(content:"다.",createdBy: "cxz",createdAt: Date()),
    Comment(content:"오 정다.",createdBy: "qwhhg",createdAt: Date())
    
]
