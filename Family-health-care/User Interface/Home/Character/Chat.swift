//
//  Chat.swift
//  Family-health-care
//
//  Created by seokhyeon on 2023/05/13.
//

import SwiftUI

struct Chat: View {
    let messages: [Message]
    let w = 340
    
    var body: some View {
        
        GeometryReader { geometry in
            ScrollViewReader{proxy in
                ScrollView(.vertical){
                    ForEach(messages, id:\.id){ message in
                        VStack{
                            HStack{
                                if message.isCharacter{
                                    MessageBubble(message: message)
                                    Spacer()
                                }
                                else{
                                    Spacer()
                                    MessageBubble(message: message)
                                }
                            }.padding([.bottom, .top],5)
                            if message.answers.count != 0 {
                                AnswerButton(message: message)
                            }
                        }
                        .id(message.id)
                            
                    }
                }.onAppear {
                    proxy.scrollTo(messages.last?.id)
                }
                .onChange(of: messages.count) { _ in
                    proxy.scrollTo(messages.last?.id)
                }
            }
            
            
            
            
            .background(Color.white)
            .cornerRadius(20)
            .position(x:geometry.size.width/2, y:geometry.size.height/2)
        }
        
    }
}






struct Chat_Previews: PreviewProvider {
    static var previews: some View {
        Chat(messages: sampleMessage)
    }
}
