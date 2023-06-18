//
//  SearchResultRow.swift
//  Family-health-care
//
//  Created by 양선아 on 2023/05/16.
//

import SwiftUI
import Kingfisher

struct SearchResultRow: View {
    let medicine: Medicine
    var body: some View {
        HStack(alignment: .top) {
            KFImage(URL(string: medicine.medicineImage))
                .placeholder { //플레이스 홀더 설정
                    Image(systemName: "pill.circle").foregroundColor(Color.mainBlue)
                }.retry(maxCount: 3, interval: .seconds(5)) //재시도
                .onFailure { e in //실패
                    print("failure_MyPage_SearchView: \(e)")
                }
                .resizable()
                .scaledToFit()
                .frame(width: 75, height: 75)
                .padding(.leading, 0)
                .overlay(
                    RoundedRectangle(cornerRadius: 0)
                        .stroke(Color.lightGray, lineWidth: 2))
            
            VStack(alignment: .leading) {
                Text(medicine.medicineName)
                    .font(.headline)
                    .fontWeight(.medium)
                    .padding(.bottom, 6)
                ScrollView {
                    Text(medicine.Efficiency)
                        .font(.footnote)
                        .foregroundColor(Color.mediumGray)
                }
            }.frame(width: 240, height:80)
        }
        .frame(width:348,height:100)
    }
}


struct SearchResultRow_Previews: PreviewProvider {
    static var previews: some View {
        SearchResultRow(medicine: medicineSamples[0])
    }
}
