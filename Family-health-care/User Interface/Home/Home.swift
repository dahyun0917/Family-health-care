//
//  Home.swift
//  Family-health-care
//
//  Created by 이다현 on 2023/05/07.
//

import SwiftUI
import Combine

struct Home: View {
    @State var id : String = "admin"
    @State var pd : String = ""
    @State var flag : Bool = false
    
    @State private var showMessage = false
    
    var body: some View {
        
        
        ZStack{
            Color.mainBeige.ignoresSafeArea(.all)
            
                
                Image("sprout")
                    .resizable()
                    .scaledToFit()
                    .frame(width:450)
                    .rotationEffect(.degrees(-40))
                    .offset(x:180, y:200)
            
            ZStack{
                VStack{
                    Spacer()
                    VStack{
                        Text("OO 가디언즈")
                            .font(.largeTitle)
                            .fontWeight(.heavy)
                        Text("우리 가족 건강 지키미")
                            .font(.callout)
                    }
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                }
                VStack{
                    
                    VStack{
                        TextField("아이디를 입력하세요", text: $id)
                            .padding()
                            .frame(height: 40)
                            .background(Color.white)
                            .cornerRadius(5)
                        TextField("비밀번호", text: $pd)
                            .padding()
                            .frame(height: 40)
                            .background(Color.white)
                            .cornerRadius(5)
                        Button(action: {flag.toggle()}){
                            Text("로그인")
                            
                        }.frame(width: 370, height:40)
                            .foregroundColor(
                                id.isEmpty ?
                                    .white : .black)
                            .background(
                                id.isEmpty ?
                                Color.gray : Color.mainBlue)
                            .cornerRadius(5)
                        
                    }
                    .frame(width: 370)
                    Text("비밀번호를 잊으셨나요?")
                        .padding(10)
                        .onTapGesture{
                            withAnimation(.easeInOut(duration: 0.5)) {
                                self.showMessage = true
                            }
                        }
                    
                    
                }
                VStack{
                    Spacer()
                    HStack{
                        Text("아이디 찾기").padding()
                            .onTapGesture{
                                withAnimation(.easeInOut(duration: 0.5)) {
                                    self.showMessage = true
                                }
                                
                            }
                        Text("|")
                        Text("회원가입").padding()
                            .onTapGesture{
                                withAnimation(.easeInOut(duration: 0.5)) {
                                    self.showMessage = true
                                }
                                
                            }
                    }
                }
                if showMessage {
                    VStack{
                        Spacer()
                        Spacer()
                        Spacer()
                        Text("미구현")
                            .transition(.opacity)
                            .padding(20)
                            .background(.gray.opacity(0.5))
                            .cornerRadius(10)
                            .onAppear(perform: {
                                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                    withAnimation(.easeInOut(duration: 0.5)) {
                                        self.showMessage = false
                                    }
                                }
                            })
                        Spacer()
                    }
                }
            }
        }.fullScreenCover(isPresented: $flag){
            logInView().environmentObject(UserLoader(token:id))
                .environmentObject(Chats(token: id))
        }
        
        
        
        
        
        
    }
    
}


struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
        
    }
}

