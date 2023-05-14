//
//  Symbol.swift
//  Family-health-care
//
//  Created by seokhyeon on 2023/05/14.
//

import SwiftUI

struct Symbol: View {
    let systemName: String
    let imageScale: Image.Scale
    let color: Color?
    
    init(_ systemName: String, scale imageScale: Image.Scale = .medium, color: Color? = nil){
        self.systemName = systemName
        self.imageScale = imageScale
        self.color = color
    }
    
    var body: some View {
        Image(systemName: systemName)
            .imageScale(imageScale)
            .foregroundColor(color)
    }
}

struct Symbol_Previews: PreviewProvider {
    static var previews: some View {
        VStack{
            Symbol("pill.fill")
            Image(systemName: "pill.fill")
                .imageScale(.medium)
                .foregroundColor(nil)
            Symbol("pill.fill", scale:.large)
            Symbol("pill.fill", scale:.large, color:.red)
        }
    }
}
