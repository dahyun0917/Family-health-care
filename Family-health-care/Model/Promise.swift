//
//  Promise.swift
//  Family-health-care
//
//  Created by 양선아 on 2023/05/16.
//

import Foundation

struct Promise:Hashable{
    var promiseDetail: String
    var promiseDate: Date
    var isCompleted: Bool
}

let promiseSamples = [
    Promise(promiseDetail: "운동해야징", promiseDate: Date(), isCompleted: false),
    Promise(promiseDetail: "이번달에는 정말로 금주 하겠습니다!!!\n간 절대 지켜 ~~", promiseDate: Date(), isCompleted: true),
]
