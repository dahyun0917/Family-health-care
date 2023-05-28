//
//  medicineTakenView.swift
//  Family-health-care
//
//  Created by seokhyeon on 2023/05/19.
//

import SwiftUI

struct medicineTakenView: View {
    @Binding var showPopover : Bool
    @Binding var mealTime : Int

    var body: some View {
        HStack{
            Spacer()
            Symbol("pill.fill", scale:.large)
                .onTapGesture {
                    withAnimation(.spring()) {
                        self.showPopover = true
                        self.mealTime = 0
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                        withAnimation(.spring()) {
                            self.showPopover = false
                        }
                    }
                }
            Spacer()
            Symbol("pill.fill", scale:.large)
                .onTapGesture {
                    withAnimation(.spring()) {
                        self.showPopover = true
                        self.mealTime = 1
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                        withAnimation(.spring()) {
                            self.showPopover = false
                        }
                    }
                }
            Spacer()
            Symbol("pill", scale:.large)
                .onTapGesture {
                    withAnimation(.spring()) {
                        self.showPopover = true
                        self.mealTime = 2
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                        withAnimation(.spring()) {
                            self.showPopover = false
                        }
                    }
                }
            Spacer()
        }
    }
}

//struct medicineTakenView_Previews: PreviewProvider {
//    static var previews: some View {
//        medicineTakenView()
//    }
//}
