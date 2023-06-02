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
    let createBy: String
    var createAt: Date
}
let StorySamples = [
    Story(content:"ohohoh",img:"https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png",createBy: "asdf",createAt: Date()),
    Story(content:"ajewfiw",img:"https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png",createBy: "tyu",createAt: Date()),
    Story(content:"wiqjpeowje",img:"https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png",createBy: "ert",createAt: Date()),
    Story(content:"amadfm",img:"https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png",createBy: "nfg",createAt: Date()),
    Story(content:"",img:"https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png",createBy: "jtj",createAt: Date()),
    Story(content:"weo",img:"https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png",createBy: "ewr",createAt: Date()),
    Story(content:"gg",img:"https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png",createBy: "vsd",createAt: Date()),
]
final class Storys: ObservableObject {
    @Published var storys : [Story] = []
    init(){
        var temp_story = [
          Story(content:"ohohoh",img:"https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png",createBy: "asdf",createAt: Date()),
          Story(content:"ajewfiw",img:"https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png",createBy: "tyu",createAt: Date()),
          Story(content:"wiqjpeowje",img:"https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png",createBy: "ert",createAt: Date()),
          Story(content:"amadfm",img:"https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png",createBy: "nfg",createAt: Date()),
          Story(content:"",img:"https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png",createBy: "jtj",createAt: Date()),
          Story(content:"weo",img:"https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png",createBy: "ewr",createAt: Date()),
          Story(content:"gg",img:"https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png",createBy: "vsd",createAt: Date()),
      ]
        
        self.storys = temp_story
    }
}
