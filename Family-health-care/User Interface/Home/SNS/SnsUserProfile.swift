//
//  SnsUserProfile.swift
//  Family-health-care
//
//  Created by 이다현 on 2023/05/07.
//

import SwiftUI

struct SnsUserProfile: View {
    var body: some View {
        HStack{
            Image(systemName: "person")
                .resizable()
                .scaledToFill()
                .frame(width: 40, height: 40)
                .cornerRadius(30)
                .overlay(RoundedRectangle(cornerRadius: 30)
                    .stroke(Color.black, lineWidth: 0.2))
            VStack(alignment: .leading){
                Text("dlekgus1353")
                    .font(.caption)
                    .fontWeight(.bold)
                    .padding(.bottom, 3)
                Text("Aug 23")
                    .font(.caption2)
                    .fontWeight(.thin)
                    .lineLimit(1)
            }
            Spacer()
            
        }
        .padding(.horizontal,10)
        .padding(.top,20)
        .padding(.bottom,20)
    }
}

struct SnsUserProfile_Previews: PreviewProvider {
    static var previews: some View {
        SnsUserProfile()
    }
}
