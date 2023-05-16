//
//  MyPageView.swift
//  Family-health-care
//
//  Created by 류지원 on 2023/05/09.
//

import SwiftUI

struct MyPageView: View {
    var body: some View {
        ZStack{
            Color.mainGrey.edgesIgnoringSafeArea(.all)
            VStack{
                PromiseView(promise: promiseSamples[0])
                HeightWeightView(heightWeight: heightWeightSampeles[0])
                WalkView(walk: walkSampeles[0])
                MedicineStateView(medicineStateList: medicineStateSamples)
            }
        }
    }
}

struct MyPageView_Previews: PreviewProvider {
    static var previews: some View {
        MyPageView()
    }
}

struct PromiseView: View {
    let promise: Promise
    var body: some View {
        VStack{
            HStack{
                Text(promise.promiseDate)
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
            HStack{
                Text(promise.promiseDetail)
                    .foregroundColor(Color.mainWhite)
                    .padding(20)
                Spacer()
            }
        }.frame(maxWidth:348,maxHeight:151).background(Color.mainBlue).cornerRadius(20)
    }
}

struct HeightWeightView: View {
    let heightWeight: HeightWeight
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
            Text("\(heightWeight.heigt) cm   /    \(heightWeight.weight) kg")
                .font(.system(size:30,weight:.black))
                .foregroundColor(Color.darkBlue)
                .padding(20)
            Spacer()
        }.frame(maxWidth:348,maxHeight:114).background(Color(hex:"D1D2D2")).cornerRadius(20)
    }
}

struct WalkView: View  {
    let walk: Walk
    var body: some View {
        HStack{
            Text("오늘").foregroundColor(Color.darkBlue)
            Text("\(walk.walk)").font(.system(size:30,weight:.bold)).foregroundColor(Color.mainBlue)
            Text("걸음 걸으셨네요!").foregroundColor(Color.darkBlue)
            Image(systemName:"figure.run").foregroundColor(Color.darkBlue)
        }.frame(maxWidth:348,maxHeight:70)
            .background().cornerRadius(20)
    }
}

struct MedicineStateView: View {
    let medicineStateList: [MedicineState]
    var body: some View {
        VStack{
            HStack{
                Text("복약현황")
                Spacer()
                Image(systemName:"pill.circle.fill")
                    .foregroundColor(Color.steelBlue)
            }.padding([.top, .horizontal])
            Spacer()
            MedicineStateRow(medicineState: medicineStateList[0])
            MedicineStateRow(medicineState: medicineStateList[1])
            MedicineStateRow(medicineState: medicineStateList[2])
            Spacer()
        }.frame(maxWidth:350,maxHeight:400).background(Color.mainLightBeige).cornerRadius(20)
    }
}
