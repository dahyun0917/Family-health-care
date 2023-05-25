//
//  Comment.swift
//  Family-health-care
//
//  Created by 이다현 on 2023/05/23.
//

import Foundation

struct Comment: Codable {
    let id: UUID = UUID()
    var content: String? = ""
    let createBy: String?
    var createAt: Date?
}
let CommentSamples = [
    Comment(content:"오 정말 대단하다.",createBy: "asdf",createAt: Date()),
    Comment(content:"오 정말 대단하지 않다.",createBy: "qwer",createAt: Date()),
    Comment(content:"오 정말 ",createBy: "zxcv",createAt: Date()),
    Comment(content:"오 정",createBy: "dfgh",createAt: Date()),
    Comment(content:"오 ",createBy: "qwe",createAt: Date()),
    Comment(content:"말 대단하다.",createBy: "asdewrf",createAt: Date()),
    Comment(content:"대단하다.",createBy: "assfdf",createAt: Date()),
    Comment(content:"단하다.",createBy: "er",createAt: Date()),
    Comment(content:"하다.",createBy: "tuj",createAt: Date()),
    Comment(content:"다.",createBy: "cxz",createAt: Date()),
    Comment(content:"오 정다.",createBy: "qwhhg",createAt: Date())
    
]
