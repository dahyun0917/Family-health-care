//
//  Post.swift
//  Family-health-care
//
//  Created by 이다현 on 2023/05/16.
//

import Foundation

//struct Post: Codable,Identifiable{
//    let id: UUID = UUID()
//    var title : String
//    var content: String
//    var img: String
//    var comment : [Comment] = []
//    let createdBy: String
//    var createdByImg : String
//    var createdAt: Date
//}

class Post: Identifiable,ObservableObject {
    let id: UUID = UUID()
    @Published var title : String
    @Published var content: String
    @Published var img: String
    @Published var comment : [Comment] = []
    @Published var createdBy: String
    @Published var createdByImg : String
    @Published var createdAt: Date
    init(title: String,content:String, img:String, comment: [Comment], createdBy:String,createdByImg:String,createdAt:Date){
        self.title = title;
        self.content = content;
        self.img = img;
        self.comment = comment;
        self.createdBy = createdBy;
        self.createdByImg = createdByImg;
        self.createdAt = createdAt
    }
    init(title: String,content:String, img:String, createdBy:String,createdByImg:String,createdAt:Date){
        self.title = title;
        self.content = content;
        self.img = img;
        self.createdBy = createdBy;
        self.createdByImg = createdByImg;
        self.createdAt = createdAt
    }
}
