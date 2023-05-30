//
//  ChatView.swift
//  Family-health-care
//
//  Created by seokhyeon on 2023/05/13.
//

import SwiftUI

struct Chat: View {
    @EnvironmentObject private var chat : Chats
    var body: some View {
            ScrollViewReader{proxy in
                ScrollView(.vertical){
                    ForEach(chat.allMessages, id:\.id){ allMessage in
                        
                        VStack{
                            HStack{
                                if allMessage.source == BotMessage.type{
                                    MessageBubble(message: allMessage)
                                    Spacer()
                                }
                                else{
                                    Spacer()
                                    MessageBubble(message: allMessage)
                                }
                            }.padding([.bottom, .top],5)

                            if let botMessage = allMessage as? BotMessage{
                                if botMessage.answers.count != 0{
                                    AnswerButton(message: botMessage)
                                }
                            }
                            
                        }
                        .id(allMessage.id)
                            
                    }
                  
                }.onAppear {
                    proxy.scrollTo(chat.allMessages.last?.id)
                }
                .onChange(of: chat.allMessages.count) { _ in
                    proxy.scrollTo(chat.allMessages.last?.id)
                }
            }
            
            
            
            
            .background(Color.white)
            .cornerRadius(20)
        
    }
}






struct Chat_Previews: PreviewProvider {
    static var previews: some View {
        Chat().environmentObject(Chats(token: "admin"))
    }
}
