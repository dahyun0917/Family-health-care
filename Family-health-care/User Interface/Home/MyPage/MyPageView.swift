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
    @EnvironmentObject private var medicines : Medicines
    @State var user:User?
    
    var body: some View {
        ZStack{
            Color.mainGrey.edgesIgnoringSafeArea(.all)
            GeometryReader {  parent_proxy in
                let parentWidth = parent_proxy.size.width
                let parentHeight = parent_proxy.size.height
                VStack{
                    if let user = userLoader.user{
                        Promise2View(promise: user.promise).environmentObject(userLoader)
                        HeightWeightView(height: user.height, weight: user.weight).environmentObject(userLoader)
                        WalkView().environmentObject(userLoader)
                        MedicineStateView(medicineStateList: user.medicineState).environmentObject(userLoader).environmentObject(medicines)
                    }
                }.frame(width:parentWidth*0.9).position(x:parentWidth/2, y:parentHeight/2)
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
    @EnvironmentObject private var userLoader : UserLoader
    let promise: [Promise]
    
    var body: some View {
        VStack{
            if promise.count>0 && !promise[promise.count-1].isCompleted {
                VStack {
                    HStack{
                        Text(dateType2String(inputDate: promise[promise.count-1].promiseDate))
                            .padding(20)
                            .foregroundColor(Color.mainWhite)
                        Spacer()
                        HStack{
                            NavigationLink(destination: MyPagePromiseWirteView(promise: promise[promise.count-1].promiseDetail, isNewPromise: false).environmentObject(userLoader)) {
                                Image(systemName:"square.and.pencil")
                                    .foregroundColor(Color.mainWhite)
                            }
                            
                            Button(action: {
                                if var user = userLoader.user {
                                    user.uploadPromise(dataDetail: promise[promise.count-1].promiseDetail, dataDate: promise[promise.count-1].promiseDate, dataComplete: true)
                                }
                            }) {
                                Image(systemName:"checkmark.square")
                                    .foregroundColor(Color.mainWhite)
                            }
                        }.padding(20)
                    }.frame(alignment:.top)
                    HStack {
                        Text(promise[promise.count-1].promiseDetail)
                            .foregroundColor(Color.mainWhite)
                            .padding(20)
                        Spacer()
                    }
                }.background(Color.mainBlue).cornerRadius(20)
            }
            else {
                NavigationLink(destination: MyPagePromiseWirteView(promise: "", isNewPromise: true).environmentObject(userLoader)) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(style: StrokeStyle(lineWidth: 9, dash: [90, 25], dashPhase: -10))
                            .foregroundColor(.mainBlue)
                            .frame(height:120)
                        
                        VStack {
                            Image(systemName: "plus")
                                .font(.system(size: 40))
                                .fontWeight(.bold)
                                .foregroundColor(Color.mainBlue)
                                .scaledToFit()
                            
                            Text("건강에 대한 나의 다짐 추가하기")
                                .font(.caption2)
                                .foregroundColor(Color.mainBlue)
                        }
                    }
                }
            }
        }.frame(height:151)
    }
}

struct HeightWeightView: View {
    @EnvironmentObject private var userLoader : UserLoader
    @State private var showModal = false
    @State var height:Int
    @State var weight:Int
    var body: some View {
        VStack{
            Spacer()
            HStack{
                Text("키/몸무게 정보")
                    .foregroundColor(Color.darkBlue)
                
                Spacer()
                VStack {
                    Image(systemName:"gearshape.fill").foregroundColor(Color.darkBlue)
                        .onTapGesture {
                            showModal = true
                        }
                }.sheet(isPresented: $showModal) {
                    VStack {
                        Text("키 설정: \(height) cm")
                        Picker(selection: $height, label: Text("Height")) {
                            ForEach(10...250, id: \.self) { height in
                                Text("\(height) cm").tag(height)
                            }
                        }
                        .pickerStyle(WheelPickerStyle())
                        
                        Text("몸 설정: \(weight) kg")
                        Picker(selection: $weight, label: Text("Weight")) {
                            ForEach(1...200, id: \.self) { weight in
                                Text("\(weight) kg").tag(weight)
                            }
                        }
                        .pickerStyle(WheelPickerStyle())
                        
                        Button(action: {
                            showModal = false
                            if var user = userLoader.user {
                                user.height = height
                                user.weight = weight
                                user.uploadWeightHeight(dataWeight: weight, dataHeight: height)
                            }
                        }) {
                            Text("저장")
                        }
                    }
                    .padding()
                }
            }.frame(alignment: .top).padding(.horizontal, 20)
                .padding(.top, 10)
            Text("\(height) cm   /    \(weight) kg")
                .font(.system(size:30,weight:.black))
                .foregroundColor(Color.darkBlue)
                .padding(20)
        }
        .frame(height:114).background(Color(hex:"D1D2D2")).cornerRadius(20)
    }
}

struct WalkView: View  {
    @EnvironmentObject private var userLoader : UserLoader
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
            if var user = userLoader.user {
                user.walk = stepCount
                user.uploadWalk(data: stepCount)
            }
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
    @EnvironmentObject private var medicines : Medicines
    @EnvironmentObject private var userLoader : UserLoader
    let medicineStateList: [MedicineState]
    @State var medicineStateDictionary: [String:[MedicineState]] = [:]
    @State var sortedTimes: [String] = []
    var body: some View {
        ZStack {
            VStack {
                HStack{
                    Text("복약현황").padding(.leading).foregroundColor(Color.steelBlue)
                    Spacer()
                    HStack {
                        NavigationLink(destination: MyPageMedicineSearchView().environmentObject(medicines).environmentObject(userLoader)) {
                            Image("big-add-pill")
                                .resizable()
                                .frame(width: 25, height: 25)
                                .foregroundColor(Color.steelBlue)
                        }.navigationBarBackButtonHidden(true)
                    }.frame(alignment: .top).padding([.top, .horizontal])
                }.onAppear() {
                    for medicineState in medicineStateList {
                        if medicineStateDictionary[medicineState.time]==nil {
                            medicineStateDictionary[medicineState.time] = []
                        }
                        medicineStateDictionary[medicineState.time]?.append(medicineState)
                    }
                    let dateFormatter = DateFormatter()
                    dateFormatter.dateFormat = "HH:mm"
                    
                    sortedTimes = medicineStateDictionary.keys.sorted { (time1, time2) -> Bool in
                        if let date1 = dateFormatter.date(from: time1), let date2 = dateFormatter.date(from: time2) {
                            return date1 < date2
                        }
                        return false
                    }
                }
                LazyVGrid(columns: [GridItem(.flexible())], spacing: 20) {
                    ForEach(sortedTimes, id: \.self) { sortedTime in
                        MedicineStateRow(medicineStates: medicineStateDictionary[sortedTime]!)
                    }
                }
                
                Spacer()
            }.background(Color.mainLightBeige).cornerRadius(20)
        }
    }
}
