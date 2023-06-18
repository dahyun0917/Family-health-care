//
//  MyPageEditMedicineStateView.swift
//  Family-health-care
//
//  Created by 양선아 on 2023/05/23.
//

import SwiftUI
import Kingfisher

struct MyPageEditMedicineStateView: View {
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject private var userLoader : UserLoader
    @EnvironmentObject private var medicines : Medicines
    let medicine: Medicine
    let rows: [GridItem] = [GridItem(.flexible())]
    @State var timeList:[Date]
    @State var completeList:[Bool]
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
                            self.completeList.append(false)
                        } label: {
                            Text("시간 추가")
                                .padding(.trailing)
                                .foregroundColor(.green)
                                .font(.caption)
                        }
                    }
                    List{
                        ForEach(timeList.indices, id: \.self) { index in
                            let itemBinding = Binding<Date>(
                                        get: { timeList[index] },
                                        set: { timeList[index] = $0 }
                                    )
                            HStack{
                                DatePicker("", selection: itemBinding, displayedComponents: [.hourAndMinute])
                                    .labelsHidden()
                                    .padding(.leading)
                                    .onChange(of: itemBinding.wrappedValue) { _ in
                                        completeList[index] = false
                                    }
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
                let formatter = DateFormatter()
                formatter.dateFormat = "HH:mm"
                var stringTimeList:[String] = []
                for i in 0..<timeList.count {
                    stringTimeList.append(formatter.string(from: timeList[i]))
                }
                if let user=userLoader.user {
                    user.uploadMedicineState(dataMedicine: medicine, dataTimeList:stringTimeList, dataCompleteList: completeList)
                }
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
        }.onAppear {
            if isChosen {
                dismiss()
            }
        }
        .navigationBarBackButtonHidden(true)
    }
    func removeRows(at offsets: IndexSet) {
        timeList.remove(atOffsets: offsets)
    }
}

struct medicineSettingView : View {
    let medicine: Medicine
    var body: some View {
        HStack {
            KFImage(URL(string: medicine.medicineImage))
                .placeholder { //플레이스 홀더 설정
                    Image(systemName: "pill.circle").foregroundColor(Color.mainBlue)
                }.retry(maxCount: 3, interval: .seconds(5)) //재시도
                .onFailure { e in //실패
                    print("failure_MyPage_SearchView: \(e)")
                }
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
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

