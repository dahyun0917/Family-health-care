//
//  MedicineInform.swift
//  Family-health-care
//
//  Created by 류지원 on 2023/05/23.
//

import SwiftUI

struct MedicineInform: View {
    var color : Color
    var body: some View {
        HStack{
            Text("글루패스트").font(.system(size: 18))
            
            VStack{
                Image(systemName:"checkmark.square.fill")
                    .resizable()
                    .frame(width:15,height:15)
            }
        }.frame(maxWidth:150,maxHeight:30)
        .background(color)
        .cornerRadius(20)
        .foregroundColor(.white)
    }
}

struct MedicineInform_Previews: PreviewProvider {
    static var previews: some View {
        MedicineInform(color:Color.mainBeige)
    }
}
