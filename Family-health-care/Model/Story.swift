//
//  Story.swift
//  Family-health-care
//
//  Created by 이다현 on 2023/05/24.
//

import Foundation

struct Story: Codable {
    let id: UUID = UUID()
    var content: String
    var img: String
    let createdBy: String
    var createdByImg : String
    var createdAt: Date
}
