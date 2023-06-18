//
//  MyPageEditMedicineStateView.swift
//  Family-health-care
//
//  Created by 양선아 on 2023/05/23.
//

import SwiftUI

struct MyPageEditMedicineStateView: View {
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject private var userLoader : UserLoader
    let medicine: Medicine
    let rows: [GridItem] = [GridItem(.flexible())]
    @State var timeList:[Date]
    @Binding var isChosen: Bool
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Button (action: {dismiss()})
                {
                    Text("취소").foregroundColor(Color.mediumGray).padding(.trailing, 10)
                }
                Text("삭제").foregroundColor(.red).padding(.trailing, 40)
            }
            Spacer().frame(height: 20)
            Divider()
            VStack {
                Spacer().frame(height: 30)
                VStack {
                    HStack {
                        Text("💊 드시는 약")
                            .font(.headline)
                            .padding([.leading, .bottom])
                        Spacer()
                    }
                    medicineSettingView(medicine: medicine)
                }
                Spacer()
                    .frame(height: 30)
            }
            Divider()
            VStack {
                Spacer()
                    .frame(height: 30)
                VStack {
                    HStack {
                        Text("🕐 몇시에 드시는 약인가요?")
                            .font(.headline)
                            .padding([.leading, .bottom])
                        Spacer()
                        Button {
                            self.timeList.append(Date())
                        } label: {
                            Text("시간 추가")
                                .padding(.trailing)
                                .foregroundColor(.green)
                                .font(.caption)
                        }
                    }
                    List{
                        ForEach($timeList, id: \.self) { item in
                            HStack{
                                DatePicker("", selection: item, displayedComponents: [.hourAndMinute])
                                    .labelsHidden()
                                    .padding(.leading)
                                Spacer()
                            }
                        }.onDelete(perform: removeRows)
                    }.frame(height: 180)
                }
                Spacer()
                    .frame(height: 30)
            }
            Divider()
            VStack {
                Spacer()
                    .frame(height: 30)
            }
            Spacer()
            Button {
                isChosen = true
                dismiss()
            } label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(Color.mainBlue)
                        .frame(height: 60)
                    Text("설정 완료")
                        .foregroundColor(Color.mainWhite)
                }
            }
        }.navigationBarBackButtonHidden(true)
    }
    func removeRows(at offsets: IndexSet) {
        timeList.remove(atOffsets: offsets)
    }
}

struct medicineSettingView : View {
    let medicine: Medicine
    var body: some View {
        HStack {
            Image(medicine.medicineImage)
                .resizable()
                .scaledToFill()
                .frame(width: 100, height: 100)
                .clipped()
                .overlay(
                    RoundedRectangle(cornerRadius: 0)
                        .stroke(Color.lightGray, lineWidth: 2))
                .padding(.leading, 15)
            
            VStack(alignment: .leading) {
                HStack {
                    Text(medicine.medicineName)
                        .font(.headline)
                        .fontWeight(.medium)
                        .padding(.bottom, 6)
                    Spacer()
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(Color.mainBlue)
                            .frame(width: 33, height: 20)
                        NavigationLink(destination: MyPageMedicineSearchView()) {
                            Text("변경")
                                .font(.caption)
                                .foregroundColor(Color.mainWhite)
                        }
                    }
                    .padding(.bottom, 6)
                    .padding(.trailing, 20)
                }
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

struct timeItem: Identifiable {
    var id = UUID()
    var time: Date
}

