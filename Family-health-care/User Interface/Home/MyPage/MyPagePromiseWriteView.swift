//
//  MyPagePromiseWirteView.swift
//  Family-health-care
//
//  Created by 양선아 on 2023/05/16.
//

import SwiftUI

struct MyPagePromiseWirteView: View {
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject private var userLoader : UserLoader
    @State var promise: String
    let isNewPromise: Bool
    
    var body: some View {
        ZStack{
            Color.mainGrey.edgesIgnoringSafeArea(.all)
            VStack {
                HStack {
                    Button (action: {dismiss()})
                    {
                        Image(systemName: "chevron.backward")
                            .foregroundColor(Color.darkBlue)
                            .padding(20)
                    }
                    Spacer()
                    Button (action: {
                        if var user = userLoader.user{
                            if isNewPromise {
                                let newPromise = Promise(promiseID:"", promiseDetail: promise, promiseDate: Date(), isCompleted: false)
                                user.addPromise(data: newPromise)
                            }
                            else {
                                user.uploadPromise(dataDetail: promise, dataDate: Date(), dataComplete: false)
                            }
                            dismiss()
                        }
                    })
                    {
                        Text("완료")
                            .foregroundColor(Color.darkBlue)
                            .padding(20)
                    }
                }
                HStack{
                    HStack {
                        TextEditor(text: $promise)
                            .background(Color.mainBlue)
                            .foregroundColor(Color.white)
                            .scrollContentBackground(Visibility.hidden)
                            .padding(20)
                    }
                    Spacer()
                }.frame(maxWidth:348,maxHeight:400).background(Color.mainBlue).cornerRadius(20)
            }.navigationBarBackButtonHidden(true)
        }
    }
}

struct MyPagePromiseWirteView_Previews: PreviewProvider {
    static var previews: some View {
        MyPagePromiseWirteView(promise: "다짐을\n작성 또는 수정하는\n페이지입니다", isNewPromise: false)
    }
}
