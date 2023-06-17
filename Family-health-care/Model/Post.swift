//
//  Post.swift
//  Family-health-care
//
//  Created by 이다현 on 2023/05/16.
//

import Foundation

struct Post: Codable,Identifiable{
    let id: UUID = UUID()
    var title : String
    var content: String
    var img: String
    var comment : [Comment] = []
    let createdBy: String
    var createdByImg : String
    var createdAt: Date
}


