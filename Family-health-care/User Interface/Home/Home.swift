//
//  Home.swift
//  Family-health-care
//
//  Created by 이다현 on 2023/05/07.
//

import SwiftUI
import Combine

struct Home: View {
    @EnvironmentObject private var chat : Chats
    @State var id : String = ""
    @State var pd : String = ""
    @State var flag : Bool = false
    @EnvironmentObject private var userLoader : UserLoader
    var body: some View {
        NavigationView{
            ZStack{
                
                
                Color.mainBeige.ignoresSafeArea(.all)
                VStack {
                    Spacer()
                    Text("Hello")
                    Spacer()
                    VStack {
                        HStack {
                            VStack {
                                TextField("아이디를 입력하세요", text: $id)
                                    .frame(width: 250)
                                    .background(Color.mainGrey)
                                    .cornerRadius(20)
                                TextField("비밀번호", text: $pd)
                                    .frame(width: 250)
                                    .background(Color.mainGrey)
                                    .cornerRadius(5)
                            }
                            Button(action: {flag.toggle()}){
                                Text("하하")
                            }
                        }
                    }
                }
                .frame(width: 350, height: 100)
                .background(Color.mainLightBeige)
                .cornerRadius(20)
                .fullScreenCover(isPresented: $flag){
                    logInView().environmentObject(UserLoader(token:id))
                }
                Spacer().frame(height: 300)
            }
            
        }
    }
    
}
//        ZStack{
//            Color.mainBeige.ignoresSafeArea(.all)
//
//            VStack{
//                Spacer()
//                Text(user.userId)
//
//                Spacer()
//                VStack{
//                    HStack{
//                        VStack{
//                            TextField("아이디를 입력하세요", text: $Id).frame(width:250).background(Color.mainGrey).cornerRadius(20)
//                            TextField("비밀번호",text:$pd).frame(width:250).background(Color.mainGrey)
//                                .cornerRadius(5)
//                        }
//                        Button("로그인"){
//
//                        }.frame(height:50).background(Color.mainGrey).cornerRadius(5)
//                    }
//                }.frame(width:350,height:100).background(Color.mainLightBeige).cornerRadius(20)
//                Spacer().frame(height:300)
//            }
//        }
//        VStack{
//            let botMessages = chat.allMessages
//            ForEach(botMessages, id:\.id) { message in
//                Text("\(message.id)")
//                /*@START_MENU_TOKEN@*/Text(message.body)/*@END_MENU_TOKEN@*/
//            }
//        }
//        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)

//        SnsView()


//        MyPageView()
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
//        SnsView(isWrite: false)
// FamilyPageView()


struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
        
    }
}

