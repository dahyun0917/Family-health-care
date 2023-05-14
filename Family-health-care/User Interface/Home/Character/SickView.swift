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
            let parts = ["Head", "Nose", "Throat", "Arm", "Stomach", "Leg"]
            ForEach(parts, id: \.self){ part in
                Button(action:{
                    self.showingSheet.toggle()
                    self.target = part
                }){
                    Text(">\(part)<")
                        .foregroundColor(Color.black)
                }
                .sheet(isPresented: $showingSheet,
                       onDismiss:{if selected{
                  
                           dismiss.callAsFunction()
                       }
                    
                },
                       content:{SickView.PresentedView(target: $target, selected:$selected)
                    .presentationDetents([.medium, .large])})
                
            }
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
                    Text("\(target)").font(.headline)
                }.padding(.top,20)
             
                List {
                    
                    
                        //                Button(action: {
                        //                    if self.presentationMode.wrappedValue.isPresented {
                        //                        self.presentationMode.wrappedValue.dismiss()
                        //                    }
                        //                }) {
                        //                    Text("Tap to Dismiss")
                        //                        .font(.title).foregroundColor(.red)
                        //                }
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
