//
//  SearchResultRow.swift
//  Family-health-care
//
//  Created by 양선아 on 2023/05/16.
//

import SwiftUI

struct SearchResultRow: View {
    let medicine: Medicine
    var body: some View {
        HStack{
            Image(medicine.medicineImage)
                .resizable()
                .scaledToFill()
                .frame(width: 100, height: 100)
                .clipped()
                .overlay(
                    RoundedRectangle(cornerRadius: 0)
                        .stroke(Color.lightGray, lineWidth: 2))
            
            VStack(alignment: .leading) {
                Text(medicine.medicineName)
                    .font(.headline)
                    .fontWeight(.medium)
                    .padding(.bottom, 6)
                Text(medicine.Efficiency)
                    .font(.footnote)
                    .foregroundColor(Color.mediumGray)
            }
        }
        .frame(maxWidth:348,maxHeight:130)
        .background().cornerRadius(12)
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(Color.lightGray, lineWidth: 2))
    }
}


struct SearchResultRow_Previews: PreviewProvider {
    static var previews: some View {
        SearchResultRow(medicine: medicineSamples[0])
    }
}
