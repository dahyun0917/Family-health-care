//
//  MessageBubble.swift
//  Family-health-care
//
//  Created by seokhyeon on 2023/05/13.
//

import SwiftUI

struct MessageBubble: View {
    let message:any Message
    
    var body: some View {
        let align = (message.source == BotMessage.type) ? Alignment.leading : Alignment.trailing
        let foreColor = (message.source == BotMessage.type) ? Color.white:Color.black
        let backColor = (message.source == BotMessage.type) ? Color.mainBlue : Color.mainBeige
        let edge = (message.source == BotMessage.type) ? Edge.Set.leading : Edge.Set.trailing
        
        VStack{
            Text(message.body)
                .foregroundColor(foreColor)
                .padding(10)
                .background(backColor)
                .cornerRadius(10)
                .lineLimit(nil)
                .frame(maxWidth: 250, alignment: align)
        }
        .padding(edge, 10)
    }
}

struct AnswerButton:View{
    @EnvironmentObject private var chat : Chats
    @Binding var medicinePresent: Bool
    @Binding var medicineName: String
    let message : BotMessage
    
    var body: some View{
        ZStack{
            GeometryReader { geometry in
                DashedLine()
                    .stroke(style: StrokeStyle(lineWidth: 2, dash: [5]))
                    .frame(width: geometry.size.width-20, height: 5)
                    .position(x:geometry.size.width/2, y:geometry.size.height/2)
            }
            HStack{
                Spacer()
                ForEach(Array(message.answers.keys).sorted(), id:\.self){ key in
//                    Button(action:{
//                        print("\(value)")
//                        if message.needAnswer{
//                            chat.respondToBot(target: message, response: value)
//                        }
//                        if message.type == 1{
//                            medicinePresent = true
//                            medicineName = value
//                            print("\(medicinePresent)")
//                        }
//
//                    }){
//                        Text("\(value)")
//                    }
                    let value = message.answers[key] ?? ""
                    Button(action: {
                            respondToBot(type: message.type, target: message, value: value)
                        }) {
                            Text("\(message.type == 1 ? String(key) : value)")
                        }
                    .foregroundColor(Color.black)
                    .padding(10)
                    .background(Color.mainLightBeige)
                    .cornerRadius(30)
                    .fontWeight(.bold)
                    Spacer()
                }
                
            }
        }.padding([.bottom,.top],5)
    }
    
    func respondToBot(type: Int, target: BotMessage, value: String) {
        if type == 1 {
            medicinePresent = true
            medicineName = value
            return
        }
        if message.needAnswer{
            chat.respondToBot(target: target, response: value)
        }
    }
}

struct DashedLine: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let startPoint = CGPoint(x: rect.minX, y: rect.midY)
        let endPoint = CGPoint(x: rect.maxX, y: rect.midY)
        path.move(to: startPoint)
        path.addLine(to: endPoint)
        return path
    }
}


struct MessageBubble_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            ForEach(Chats(token: "admin").allMessages, id:\.id){

                MessageBubble(message:$0)


            }
        }
    }
}
