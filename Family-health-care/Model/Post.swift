//
//  Post.swift
//  Family-health-care
//
//  Created by 이다현 on 2023/05/16.
//

import Foundation

struct Post: Codable {
    let id: UUID = UUID()
//    var location: String?
    var title : String?
    var content: String?
//    var keywords: [String] = []
//    var latitude: Double?
//    var longitude: Double?
    var img: String?
    var comment : [Comment]?
    let createBy: String?
    var createAt: Date?
    
//    enum CodingKeys: String, CodingKey {
//        case location = "loca"
//        case title
//        case content
////        case keywords
//        case latitude
//        case longitude
//        case time
//    }
}

let PostSamples = [
    Post(title: "안년",content: "안녀아아녀아아녕아녀아녀아녀아녀아녀아녀아녕",img:"https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png",comment:CommentSamples,createBy: "dahyun",createAt:Date()),
    Post(title: "히히히힣",content: "하하하하하하하하ㅏ하하하하하ㅏ하하하하하ㅏ하하하",img:"https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png",comment:CommentSamples,createBy: "dahyun",createAt:Date()),
    Post(title: "테스트테스트테스트",content: "하하하하하하하하ㅏ하하하하하ㅏ하하하하하ㅏ하하하",img:"https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png",comment:CommentSamples,createBy: "dahyun",createAt:Date()),
    Post(title: "나는 테스트테스트",content: "하하하하하하하하ㅏ하하하하하ㅏ하하하하하ㅏ하하하",img:"https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png",comment:CommentSamples,createBy: "dahyun",createAt:Date()),
    Post(title: "테스트할거야아",content: "하하하하하하하하ㅏ하하하하하ㅏ하하하하하ㅏ하하하",img:"https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png",comment:CommentSamples,createBy: "dahyun",createAt:Date()),
    Post(title: "우하하하",content: "하하하하하하하하ㅏ하하하하하ㅏ하하하하하ㅏ하하하",img:"https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png",comment:CommentSamples,createBy: "dahyun",createAt:Date())
    
]
