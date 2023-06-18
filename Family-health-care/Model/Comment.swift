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
    var createdByImg : String
    var createdAt: Date
}
