//
//  MyPageMedicineSearchView.swift
//  Family-health-care
//
//  Created by 양선아 on 2023/05/16.
//

import SwiftUI

struct MyPageMedicineSearchView: View {
    
    var body: some View {
        ZStack{
            Color.mainBeige.edgesIgnoringSafeArea(.all)
            VStack{
                HStack{
                    Image(systemName: "magnifyingglass")
                        .padding(20)
                        .foregroundColor(Color.lightGray)
                    Text("글루패스트")
                    Spacer()
                }
                .frame(maxWidth:348,maxHeight:50)
                .background().cornerRadius(12)
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(Color.lightGray, lineWidth: 2))
                
                SearchResultRow(medicine: medicineSamples[0])
                Spacer()
                NavigationLink(destination: MyPageEditMedicineStateView(medicine: medicineSamples[0])) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(Color.mainBeige)
                            .frame(height: 60)
                        Text("약 선택 완료")
                            .foregroundColor(Color.mainWhite)
                    }
                }
            }
        }
    }
}

struct MyPageMedicineSearchView_Previews: PreviewProvider {
    static var previews: some View {
        MyPageMedicineSearchView()
    }
}
