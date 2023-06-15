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
    var createdAt: Date
}
let StorySamples = [
    Story(content:"ohohoh",img:"https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png",createdBy: "asdf",createdAt: Date()),
    Story(content:"ajewfiw",img:"https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png",createdBy: "tyu",createdAt: Date()),
    Story(content:"wiqjpeowje",img:"https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png",createdBy: "ert",createdAt: Date()),
    Story(content:"amadfm",img:"https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png",createdBy: "nfg",createdAt: Date()),
    Story(content:"",img:"https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png",createdBy: "jtj",createdAt: Date()),
    Story(content:"weo",img:"https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png",createdBy: "ewr",createdAt: Date()),
    Story(content:"gg",img:"https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png",createdBy: "vsd",createdAt: Date()),
]
final class Storys: ObservableObject {
    @Published var storys : [Story] = []
    init(){
        var temp_story = [
          Story(content:"ohohoh",img:"https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png",createdBy: "asdf",createdAt: Date()),
          Story(content:"ajewfiw",img:"https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png",createdBy: "tyu",createdAt: Date()),
          Story(content:"wiqjpeowje",img:"https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png",createdBy: "ert",createdAt: Date()),
          Story(content:"amadfm",img:"https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png",createdBy: "nfg",createdAt: Date()),
          Story(content:"",img:"https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png",createdBy: "jtj",createdAt: Date()),
          Story(content:"weo",img:"https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png",createdBy: "ewr",createdAt: Date()),
          Story(content:"gg",img:"https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png",createdBy: "vsd",createdAt: Date()),
      ]
        
        self.storys = temp_story
    }
}
