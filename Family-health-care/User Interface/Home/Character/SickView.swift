//
//  SickView.swift
//  Family-health-care
//
//  Created by seokhyeon on 2023/05/14.
//

import SwiftUI

struct SickView: View {

    var body: some View {
        
        ZStack{
            Color.clear
            NavigationLink(destination: CharacterView()){
                VStack{
                    Present_Page()
                }
            }
        }
        .toolbarRole(.editor)
        .navigationTitle("아픈 부위를 선택하세요")
        .background(Color.mainBeige)
        
    }
}

private extension SickView{
    struct Present_Page:View{
        @Environment (\.dismiss) var dismiss
        @State private var showingSheet = false
        @State var target : String = ""
        @State var selected : Bool = false
        
        var body: some View{
//            let parts = ["Head", "Nose", "Throat", "Arm", "Stomach", "Leg"]
            //            ForEach(parts, id: \.self){ part in
            //                Button(action:{
            //                    self.showingSheet.toggle()
            //                    self.target = part
            //                }){
            //                    Text(">\(part)<")
            //                        .foregroundColor(Color.black)
            //                }
            //                .sheet(isPresented: $showingSheet,
            //                       onDismiss:{if selected{
            //
            //                           dismiss.callAsFunction()
            //                       }
            //
            //                },
            //                       content:{SickView.PresentedView(target: $target, selected:$selected)
            //                    .presentationDetents([.medium, .large])})
            //
            //            }
            
            
                Image("man")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
//                    .border(Color.black)
                    .onTapGesture{}
                    .overlay(
                        GeometryReader {geometry in
                            let width = geometry.size.width
                            let height = geometry.size.height
                            ZStack{
                                Ellipse()
                                    .fill(Color.red.opacity(0.3))
                                    .frame(width:width/2, height:height/10)
                                    .position(x:width/1.9, y:height/18)
                                    .onTapGesture{
                                        self.showingSheet.toggle()
                                        self.target="Head"
                                    }
//                                Circle()
//                                    .fill(Color.red.opacity(0.3))
//                                    .frame(width:width/12)
//                                    .position(x:width/2.2, y:height/6.5)
//                                    .onTapGesture{
//                                        self.showingSheet.toggle()
//                                        self.target="Eye"
//                                    }
                                Circle()
                                    .fill(Color.red.opacity(0.3))
                                    .frame(width:width/12)
                                    .position(x:width/1.58, y:height/6.5)
                                    .onTapGesture{
                                        self.showingSheet.toggle()
                                        self.target="Eye"
                                    }
                                Circle()
                                    .fill(Color.red.opacity(0.3))
                                    .frame(width:width/9)
                                    .position(x:width/1.9, y:height/4.2)
                                    .onTapGesture{
                                        self.showingSheet.toggle()
                                        self.target="Mouth"
                                    }
                                Ellipse()
                                    .fill(Color.red.opacity(0.3))
                                    .frame(width:width/2, height:height/12)
                                    .position(x:width/1.9, y:height/3.5)
                                    .onTapGesture{
                                        self.showingSheet.toggle()
                                        self.target="Throat"
                                    }
                                Circle()
                                    .fill(Color.red.opacity(0.3))
                                    .frame(width:width/7)
                                    .position(x:width/1.58, y:height/2.3)
                                    .onTapGesture{
                                        self.showingSheet.toggle()
                                        self.target="Heart"
                                    }
                                Ellipse()
                                    .fill(Color.red.opacity(0.3))
//                                    .cornerRadius(30)
                                    .frame(width:width/2.2, height:height/6)
                                    .position(x:width/2, y:height/1.8)
                                    .onTapGesture{
                                        self.showingSheet.toggle()
                                        self.target="Stomach"
                                    }
                                Ellipse()
                                    .fill(Color.red.opacity(0.3))
//                                    .cornerRadius(30)
                                    .frame(width:width/4.5, height:height/2.5)
                                    .position(x:width/7, y:height/2)
                                    .onTapGesture{
                                        self.showingSheet.toggle()
                                        self.target="Arm"
                                    }
                                Ellipse()
                                    .fill(Color.red.opacity(0.3))
                                    .cornerRadius(30)
                                    .frame(width:width/4.5, height:height/3.5)
                                    .position(x:width/1.7, y:height/1.25)
                                    .onTapGesture{
                                        self.showingSheet.toggle()
                                        self.target="Leg"
                                    }
                                
                                
                            }
                            
                        }
                        
                    )
                    .sheet(isPresented: $showingSheet, onDismiss: {if selected{dismiss()}},
                            content: {SickView.PresentedView(target: $target, selected:$selected)
                             .presentationDetents([.medium, .large])
                     })
                    
            
        }
            
    }
    
    struct PresentedView:View{
        @Environment (\.presentationMode) var presentationMode
        @Environment (\.dismiss) var dismiss
        
        @Binding var target:String
        @Binding var selected : Bool
        var body:some View{
            
            let sicks = ["편두통", "어지러움", "모시깽", "모시깽깽", "모시깽깽깽갱", "모시모시깽", "모시모모시갱", "깽모모시"]
            VStack{
                
                
                HStack{
//                    Button(action: {
//                        if self.presentationMode.wrappedValue.isPresented {
//                            self.presentationMode.wrappedValue.dismiss()
//                        }
//                    }) {
//                        Text("Tap to Dismiss")
//                            foregroundColor(.red)
//                    }
//                    Spacer()
                    Text("\(target)").font(.headline)
//                    Spacer()
                }.padding(.top,20)
             
                List {
                    
                    

                        Section{
                            ForEach(sicks, id:
                                        \.self){ sick in
                                Button(action:{selected=true
                                    print("pressed")
                                    dismiss()
                                }){
                                    Text("\(sick)")
                                    
                                }
                                
                            }
                        
                    }
                }
                .background(Color.mainLightBeige)
                .scrollContentBackground(.hidden)
            }.edgesIgnoringSafeArea(.top)
        }
    }
}

struct SickView_Previews: PreviewProvider {
    static var previews: some View {
        SickView()
    }
}
