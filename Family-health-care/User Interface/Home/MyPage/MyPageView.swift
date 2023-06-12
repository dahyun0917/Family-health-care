//
//  MyPageView.swift
//  Family-health-care
//
//  Created by 류지원 on 2023/05/09.
//

import SwiftUI
import CoreMotion

struct MyPageView: View {
    @EnvironmentObject private var userLoader : UserLoader

    var body: some View {
        ZStack{
            Color.mainGrey.edgesIgnoringSafeArea(.all)
            VStack{
                if let user = userLoader.user{
                    Promise2View(promise: user.promise[0])
                    HeightWeightView(height: user.height, weight: user.weight)
                    WalkView()
                    MedicineStateView(medicineStateList: user.medicineState)
                }
            }
        }
    }
}

struct MyPageView_Previews: PreviewProvider {
    static var previews: some View {
        MyPageView()
    }
}

func dateType2String(inputDate: Date) -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy.MM.dd"
    return dateFormatter.string(from: inputDate)
}

struct Promise2View: View {
    let promise: Promise
    
    var body: some View {
        VStack{
            HStack{
                Text(dateType2String(inputDate: promise.promiseDate))
                    .padding(20)
                    .foregroundColor(Color.mainWhite)
                Spacer()
                HStack{
                    NavigationLink(destination: MyPagePromiseWirteView(promise: promise.promiseDetail)) {
                        Image(systemName:"square.and.pencil")
                            .foregroundColor(Color.mainWhite)
                    }
                    Image(systemName:"checkmark.square")
                        .foregroundColor(Color.mainWhite)
                }.padding(20)
            }
            Spacer()
            HStack {
                Text(promise.promiseDetail)
                    .foregroundColor(Color.mainWhite)
                    .padding(20)
                Spacer()
            }
            Spacer()
        }.frame(width:348,height:151).background(Color.mainBlue).cornerRadius(20)
    }
}

struct HeightWeightView: View {
    let height:Int
    let weight:Int
    var body: some View {
        VStack{
            Spacer()
            HStack{
                Text("키/몸무게 정보")
                    .foregroundColor(Color.darkBlue)
                
                Spacer()
                Image(systemName:"gearshape.fill").foregroundColor(Color.darkBlue)
            }.padding(.horizontal, 20)
                .padding(.top, 20)
            Text("\(height) cm   /    \(weight) kg")
                .font(.system(size:30,weight:.black))
                .foregroundColor(Color.darkBlue)
                .padding(20)
            Spacer()
        }
        .frame(width:348,height:114).background(Color(hex:"D1D2D2")).cornerRadius(20)
    }
}

struct WalkView: View  {
    @State private var stepCount: Int = 0
    let pedometer = CMPedometer()
    @State var timer: Timer?
    var body: some View {
        HStack{
            Text("오늘").foregroundColor(Color.darkBlue)
            Text("\(stepCount)").font(.system(size:30,weight:.bold)).foregroundColor(Color.mainBlue).onAppear(perform: {
                startUpdatingStepCount()
            })
            Text("걸음 걸으셨네요!").foregroundColor(Color.darkBlue)
            Image(systemName:"figure.run").foregroundColor(Color.darkBlue)
        }.frame(width:348,height:70)
            .background(Color.mainWhite).cornerRadius(20)
    }
    func startUpdatingStepCount() {
        guard CMPedometer.isStepCountingAvailable() else {
            print("걸음수 추적이 지원되지 않습니다.")
            return
        }
        
        let calendar = Calendar.current
        let midnight = calendar.startOfDay(for: Date())
        
        pedometer.startUpdates(from: midnight) { data, error in
            if let error = error {
                print("걸음수 업데이트 오류: \(error.localizedDescription)")
            } else if let data = data {
                DispatchQueue.main.async {
                    self.stepCount = data.numberOfSteps.intValue
                }
            }
        }
        // 일정 간격으로 걸음수 업데이트
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            self.updateStepCount()
        }
    }
    func updateStepCount() {
        guard CMPedometer.isStepCountingAvailable() else {
            print("걸음수 추적이 지원되지 않습니다.")
            return
        }
        let calendar = Calendar.current
        let midnight = calendar.startOfDay(for: Date())
        pedometer.startUpdates(from: midnight) { data, error in
            if let error = error {
                print("걸음수 업데이트 오류: \(error.localizedDescription)")
            } else if let data = data {
                DispatchQueue.main.async {
                    self.stepCount = data.numberOfSteps.intValue
                }
            }
        }
        
    }
}

struct MedicineStateView: View {
    let medicineStateList: [MedicineState]
    var body: some View {
        VStack{
            HStack{
                Text("복약현황")
                Spacer()
                NavigationLink(destination: MyPageMedicineSearchView()) {
                    Image("big-add-pill")
                        .resizable()
                        .frame(width: 25, height: 25)
                        .foregroundColor(Color.steelBlue)
                }
            }.padding([.top, .horizontal])
            Spacer()
            MedicineStateRow(medicineStates: medicineStateList)
            Spacer()
        }.frame(width:350,height:400).background(Color.mainLightBeige).cornerRadius(20)
    }
}
