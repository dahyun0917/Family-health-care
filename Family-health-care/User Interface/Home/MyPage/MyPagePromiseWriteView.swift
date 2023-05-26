//
//  MyPagePromiseWirteView.swift
//  Family-health-care
//
//  Created by 양선아 on 2023/05/16.
//

import SwiftUI

struct MyPagePromiseWirteView: View {
    @Environment(\.dismiss) private var dismiss
//    var promise: String
    let promise: String
    
//    init(promise: String) {
//
//        self.promise = promise
//    }
    
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
                    Button (action: {dismiss()})
                    {
                        Text("완료")
                            .foregroundColor(Color.darkBlue)
                            .padding(20)
                    }
                }
                HStack{
                    writePromise(before: promise)
                    Spacer()
                }.frame(maxWidth:348,maxHeight:400).background(Color.mainBlue).cornerRadius(20)
            }.navigationBarBackButtonHidden(true)
        }
    }
}

struct writePromise: View {
    @State var newPromise: String

    init(before: String) {
        _newPromise = State(initialValue: before)
    }
    
    var body: some View {
        HStack {
            TextEditor(text: $newPromise)
                .background(Color.mainBlue)
                .foregroundColor(Color.white)
                .scrollContentBackground(Visibility.hidden)
                .padding(20)
        }
    }
}

struct MyPagePromiseWirteView_Previews: PreviewProvider {
    static var previews: some View {
        MyPagePromiseWirteView(promise: "다짐을\n작성 또는 수정하는\n페이지입니다")
    }
}
