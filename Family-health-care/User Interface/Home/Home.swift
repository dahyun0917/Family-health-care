//
//  Home.swift
//  Family-health-care
//
//  Created by 이다현 on 2023/05/07.
//

import SwiftUI

struct Home: View {
    @EnvironmentObject private var chat : Chats
    var body: some View {
//        VStack{
//            let botMessages = chat.allMessages
//            ForEach(botMessages, id:\.id) { message in
//                Text("\(message.id)")
//                /*@START_MENU_TOKEN@*/Text(message.body)/*@END_MENU_TOKEN@*/
//            }
//        }
//        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
//        SnsView()
        CharacterView()
//        VStack{
//            ForEach(chat.allMessages, id:\.0){ messages in
//                Text(messages.1)
//            }
//        }
        
        // firebase test code
//        NavigationView{
//            NavigationLink(destination: testtest().environmentObject(test)){
//                VStack{
//                    Text("\(test.born)")
//                    Text("\(test.t)")
//                }
//            }
//        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
