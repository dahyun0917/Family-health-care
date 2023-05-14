//
//  MessageBubble.swift
//  Family-health-care
//
//  Created by seokhyeon on 2023/05/13.
//

import SwiftUI

struct MessageBubble: View {
    let message:Message
    
    var body: some View {
        
        let align = message.isCharacter ? Alignment.leading : Alignment.trailing
        
        
        VStack{
            Text(message.body)
                .foregroundColor(message.isCharacter ? Color.white:Color.black)
                .padding(10)
                .background(message.isCharacter ? Color.mainBlue : Color.mainBeige)
                .cornerRadius(10)
                .lineLimit(nil)
                .frame(maxWidth: 250, alignment: align)
            
        }
        .padding(message.isCharacter ? Edge.Set.leading:Edge.Set.trailing, 10)
        
        
    }
}

struct AnswerButton:View{
    let message:Message
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
                ForEach(message.answers, id:\.self){ ans in
                    Button(action:{
                        print("\(ans)")
                        
                        sampleMessage.append(Message(isCharacter: false, body: "\(ans)"))
                    }){
                        Text("\(ans)")
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
        //        .frame(height:30)
        
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
            ForEach(sampleMessage){
                
                MessageBubble(message:$0)
                
                
            }
        }
    }
}
