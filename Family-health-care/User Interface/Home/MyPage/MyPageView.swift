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
                PromiseView
                HeightWeightView
                WalkView
                MedicineView()
            }
        }
    }
}

struct MyPageView_Previews: PreviewProvider {
    static var previews: some View {
        MyPageView()
    }
}

var PromiseView: some View {
    VStack{
        HStack{
            Text("2023.05.01")
                .padding(20)
                .foregroundColor(Color.mainWhite)
            Spacer()
            HStack{
                Image(systemName:"square.and.pencil")
                    .foregroundColor(Color.mainWhite)
                Image(systemName:"checkmark.square")
                    .foregroundColor(Color.mainWhite)
            }.padding(20)
        }
        Spacer()
        HStack{
            Text("이번달에는 정말로 금주 하겠습니다!!!\n간 절대 지켜 ~~")
                .foregroundColor(Color.mainWhite)
                .padding(20)
            Spacer()
        }
    }.frame(maxWidth:348,maxHeight:151).background(Color.mainBlue).cornerRadius(20)
}

var HeightWeightView: some View {
    VStack{
        Spacer()
        HStack{
            Text("키/몸무게 정보")
                .foregroundColor(Color.darkBlue)
            
            Spacer()
            Image(systemName:"gearshape.fill").foregroundColor(Color.darkBlue)
        }.padding(.horizontal, 20)
            .padding(.top, 20)
        Text("180 cm   /   70 kg")
            .font(.system(size:30,weight:.black))
            .foregroundColor(Color.darkBlue)
            .padding(20)
        Spacer()
    }.frame(maxWidth:348,maxHeight:114).background(Color(hex:"D1D2D2")).cornerRadius(20)
}

var WalkView: some View  {
    HStack{
        Text("오늘").foregroundColor(Color.darkBlue)
        Text("5555").font(.system(size:30,weight:.bold)).foregroundColor(Color.mainBlue)
        Text("걸음 걸으셨네요!").foregroundColor(Color.darkBlue)
        Image(systemName:"figure.run").foregroundColor(Color.darkBlue)
    }.frame(maxWidth:348,maxHeight:70)
    .background().cornerRadius(20)
}

struct MedicineView: View {
    var body: some View {
        VStack{
            HStack{
                Text("복약현황")
                Spacer()
                Image(systemName:"pill.circle.fill")
                    .foregroundColor(Color.steelBlue)
            }.padding([.top, .horizontal])
            HStack{
                VStack{
                    Text("6:30")
                    Text("아침식사").font(.system(size:12))
                    Text("식전 30분").foregroundColor(.blue).font(.system(size:12))
                }
                Image(systemName:"circle.circle")
                    .foregroundColor(Color.lightGray)
                Spacer().frame(width:50)
                HStack{
                    Text("testitng").foregroundColor(.white)
                    Image(systemName:"checkmark.square.fill").foregroundColor(Color.white)
                }.frame(width:185,height: 44).background(Color.mainBeige).cornerRadius(20)
            }
            Spacer()
            HStack{
                VStack{
                    Text("6:30")
                    Text("아침식사").font(.system(size:12))
                    Text("식전 30분").foregroundColor(.blue).font(.system(size:12))
                }
                Image(systemName:"circle.circle").foregroundColor(Color.lightGray)
                Spacer().frame(width:50)
                HStack{
                    Text("testitng").foregroundColor(.white)
                    Image(systemName:"checkmark.square.fill").foregroundColor(Color.white)
                }.frame(width:185,height: 44).background(Color.mainBeige).cornerRadius(20)
            }
            Spacer()
            HStack{
                VStack{
                    Text("6:30")
                    Text("아침식사").font(.system(size:12))
                    Text("식전 30분").foregroundColor(.blue).font(.system(size:12))
                }
                Image(systemName:"circle.circle").foregroundColor(Color.mainGrey)
                Spacer().frame(width:50)
                HStack{
                    Text("testitng").foregroundColor(.white)
                    Image(systemName:"checkmark.square.fill").foregroundColor(Color.white)
                }.frame(width:185,height: 44).background(Color.mainBeige).cornerRadius(20)
            }
            
        }.frame(maxWidth:350,maxHeight:400).background(Color.mainLightBeige).cornerRadius(20)
    }
}
