//
//  NavigationBar.swift
//  Family-health-care
//
//  Created by seokhyeon on 2023/05/31.
//

import SwiftUI

struct NavigationBar: View {
    let title : String
    @Environment (\.dismiss) var dismiss
    var body: some View {
        ZStack{
            HStack{
                Symbol("chevron.left", scale:.large, color: .black)
                    .padding(5)
                    .onTapGesture{dismiss()}
                Spacer()
            }
            Text(title)
        }.padding(5)
    }
}

struct NavigationBar_Previews: PreviewProvider {
    static var previews: some View {
        NavigationBar(title:"asdf")
    }
}
