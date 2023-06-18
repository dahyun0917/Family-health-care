//
//  MyPageMedicineSearchView.swift
//  Family-health-care
//
//  Created by 양선아 on 2023/05/16.
//

import SwiftUI

struct MyPageMedicineSearchView: View {
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject private var medicines : Medicines
    @EnvironmentObject private var userLoader : UserLoader
    @State private var searchText = ""
    @State private var selectedObject: Medicine?
    @State private var isChosen = false
    
    var objects: [Medicine] {
        return medicines.medicines
    }
    
    var filteredObjects: [Medicine] {
        if searchText.isEmpty {
            return objects
        } else {
            return objects.filter { $0.medicineName.lowercased().contains(searchText.lowercased()) }
        }
    }
    var body: some View {
        ZStack{
            Color.mainLightBeige.edgesIgnoringSafeArea(.all)
            VStack{
                Button (action: {dismiss()})
                {
                    HStack {
                        Image(systemName: "chevron.backward")
                            .foregroundColor(Color.mediumGray)
                        Text("취소").foregroundColor(Color.mediumGray).padding(.trailing, 10)
                        Spacer()
                    }.padding(.leading)
                }
                HStack{
                    Image(systemName: "magnifyingglass")
                        .padding(20)
                        .foregroundColor(Color.lightGray)
                    TextField("", text: $searchText)
                    Spacer()
                }
                .frame(maxWidth:348,maxHeight:50)
                .background().cornerRadius(12)
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(Color.lightGray, lineWidth: 2))
                ScrollView {
                    LazyVGrid(columns: [GridItem(.flexible())], spacing: 10) {
                        ForEach(filteredObjects, id: \.self) { object in
                            SearchResultRow(medicine: object)
                                .background()
                                .cornerRadius(12)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 12)
                                        .stroke(object == selectedObject ? Color.gray : Color.lightGray, lineWidth: object == selectedObject ? 3:2))
                                .onTapGesture {
                                    selectedObject = object
                                }
                        }
                    }
                }.padding()
                
                Spacer()
                if selectedObject==nil {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(Color.gray.opacity(0.3))
                            .frame(height: 60)
                        Text("약을 선택해주세요")
                            .foregroundColor(Color.mainWhite)
                    }
                } else {
                    NavigationLink(destination: MyPageEditMedicineStateView(medicine: selectedObject!, timeList: [], isChosen: $isChosen)) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundColor(Color.mainBlue)
                                .frame(height: 60)
                            Text("약 선택 완료")
                                .foregroundColor(Color.mainWhite)
                        }
                    }
                }
            }
        }
        .onAppear {
            if isChosen {
                dismiss()
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct MyPageMedicineSearchView_Previews: PreviewProvider {
    static var previews: some View {
        MyPageMedicineSearchView()
    }
}
