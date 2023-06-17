//
//  SnsStoryView.swift
//  Family-health-care
//
//  Created by 이다현 on 2023/05/08.
//

import SwiftUI
import Kingfisher

struct SnsStoryView: View {
    var user:User
    var story:Story
    @Environment(\.dismiss) private var dismiss
    
    @State private var downloadAmount = 0.0
    let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    
        
    var body: some View {

        VStack{
            SnsUserProfile(createdBy: story.createdBy, createdAt: story.createdAt,createdByImg: story.createdByImg)
            VStack{
                ProgressView(value: downloadAmount, total: 100)
                    .progressViewStyle(LinearProgressViewStyle(tint: Color.mainBlue))
                    .padding(.horizontal,15)
            }.onReceive(timer) { _ in
                //만약 downloadAmount가 100보다 작다면 실행
                //total값 보다 작아야함
                if downloadAmount < 100 {
                    downloadAmount += 5
                } else{
                    dismiss()
                    
                }
            }
            VStack{
                if (story.img != ""){
                    KFImage(URL(string: story.img)!)
                        .placeholder { //플레이스 홀더 설정
                            //                      Image(systemName: "person")
                        }.retry(maxCount: 3, interval: .seconds(5)) //재시도
                        .onFailure { e in //실패
                            print("failure_SnsStoryView: \(e)")
                        }
                        .resizable()
                        .padding(20)
                        .frame(width: .infinity, height: .infinity,alignment: .center)
                }
                
                Spacer()
                Text(story.content)
                    .padding(20)
                Spacer()
                
                    
            }
//            .background(Color.primary.colorInvert())
//            .cornerRadius(15)
//            .overlay(RoundedRectangle(cornerRadius: 15)
//            .stroke(Color.black, lineWidth: 0.2))
//            .padding(25)
        }
        .background(Color.primary.colorInvert())
        .cornerRadius(15)
        .overlay(RoundedRectangle(cornerRadius: 15)
        .stroke(Color.black, lineWidth: 0.2))
        .padding(25)
        .padding(.top,5)
        
    }
    
//    func setTimer(){
//        var timer = Timer()
//        var secondsPassed = 0
//        let time = 3
//
//        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { (Timer) in
//            if secondsPassed < time {
//                print ("\(secondsPassed) seconds")
//                secondsPassed += 1
////
////                let percent = Float(self.secondsPassed) / Float(self.time)
////                self.progressView.progressView = percent
//                progress = Double(secondsPassed) / Double(time)
//            }
//            else {
//                dismiss()
//            }
//        }
//    }
}

//struct SnsStoryView_Previews: PreviewProvider {
//    static var previews: some View {
//        SnsStoryView(story: StorySamples[0])
//    }
//}
