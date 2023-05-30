//
//  medicineTakenView.swift
//  Family-health-care
//
//  Created by seokhyeon on 2023/05/19.
//

import SwiftUI

struct medicineTakenView: View {
    var body: some View {
        HStack{
            Spacer()
            Symbol("pill.fill", scale:.large)
            Spacer()
            Symbol("pill.fill", scale:.large)
            Spacer()
            Symbol("pill", scale:.large)
            Spacer()
        }
    }
}

struct medicineTakenView_Previews: PreviewProvider {
    static var previews: some View {
        medicineTakenView()
    }
}
