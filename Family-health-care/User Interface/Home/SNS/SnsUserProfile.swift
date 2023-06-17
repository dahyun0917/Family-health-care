//
//  SnsUserProfile.swift
//  Family-health-care
//
//  Created by 이다현 on 2023/05/07.
//

import SwiftUI
import Kingfisher

struct SnsUserProfile: View {
    @State var createdBy:String = ""
    @State var createdAt:Date
    var user:User
    
    static let dateFormat: DateFormatter = {
           let formatter = DateFormatter()
            formatter.dateFormat = "YYYY년 M월 d일"
            return formatter
    }()
    var body: some View {
        let url:URL = URL(string: user.image)!
        HStack{
            KFImage(url)
                  .placeholder { //플레이스 홀더 설정
                      Image(systemName: "person")
                  }.retry(maxCount: 3, interval: .seconds(5)) //재시도
                  .onSuccess {r in //성공
//                      print("succes: \(r)")
                  }
                  .onFailure { e in //실패
//                      print("failure: \(e)")
                  }
                  .resizable()
                  .scaledToFill()
                  .frame(width: 40, height: 40)
                  .cornerRadius(30)
                  .overlay(RoundedRectangle(cornerRadius: 30)
                    .stroke(Color.black, lineWidth: 0.2))
                  .padding(.trailing,5)

//            Image(systemName: "person")
//                .resizable()
//                .scaledToFill()
//                .frame(width: 40, height: 40)
//                .cornerRadius(30)
//                .overlay(RoundedRectangle(cornerRadius: 30)
//                    .stroke(Color.black, lineWidth: 0.2))
            VStack(alignment: .leading){
                Text(createdBy)
                    .font(.caption)
                    .fontWeight(.bold)
                    .padding(.bottom, 3)
                Text("\(createdAt, formatter: SnsUserProfile.dateFormat)")
                    .font(.caption2)
                    .fontWeight(.thin)
                    .lineLimit(1)
            }
            Spacer()
            
        }
        .padding(.horizontal,10)
        .padding(.top,20)
        .padding(.bottom,20)
    }
    
}

extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}

//struct SnsUserProfile_Previews: PreviewProvider {
//    static var previews: some View {
//        SnsUserProfile(createdBy: "dlekgus1353", createdAt: Date())
//    }
//}
