//
//  SickView.swift
//  Family-health-care
//
//  Created by seokhyeon on 2023/05/14.
//

import SwiftUI

struct SickView: View {
    @Environment (\.dismiss) var dismiss
    @State private var showingSheet = false
    @State var partName : String = ""
    @State var selected : Bool = false
    
    var body: some View {
        VStack{
            NavigationBar(title:"아픈 부위를 선택해주세요")
            
            Spacer()
            
            Image("man")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .overlay(
                    GeometryReader {geometry in
                        let width = geometry.size.width
                        let height = geometry.size.height
                        
                        let bodyParts: [(partName : String, size : CGSize, position : CGPoint)] = [
                            ("Head", CGSize(width: width/2, height: height/10), CGPoint(x: width/1.9, y: height/18)),
                            ("Eye", CGSize(width: width/12, height: width/12), CGPoint(x: width/1.58, y: height/6.5)),
                            ("Mouth", CGSize(width: width/9, height: width/9), CGPoint(x: width/1.9, y: height/4.2)),
                            ("Throat", CGSize(width: width/2, height: height/12), CGPoint(x: width/1.9, y: height/3.5)),
                            ("Heart", CGSize(width: width/7, height: width/7), CGPoint(x: width/1.58, y: height/2.3)),
                            ("Stomach", CGSize(width: width/2.2, height: height/6), CGPoint(x: width/2, y: height/1.8)),
                            ("Arm", CGSize(width: width/4.5, height: height/2.5), CGPoint(x: width/7, y: height/2)),
                            ("Leg", CGSize(width: width/4.5, height: height/3.5), CGPoint(x: width/1.7, y: height/1.25))
                        ]
                        ZStack{
                            ForEach(bodyParts, id: \.0) { part in
                                BodyPart(size: part.size, position: part.position, target: part.partName, showingSheet: $showingSheet, partName: $partName)
                            }
                        }
                        .sheet(isPresented: $showingSheet, onDismiss: {if selected{dismiss()}}){
                            PresentedView(partName:$partName, selected:$selected).presentationDetents([.medium, .large])
                        }
                        
                    }
                )
            
        }.navigationBarHidden(true)
            .background(Color.mainBeige)
        
        
    }
}

private extension SickView{
    struct PresentedView:View{
        @EnvironmentObject private var chat : Chats
        @Environment (\.presentationMode) var presentationMode
        @Environment (\.dismiss) var dismiss
        @EnvironmentObject private var mfpp : MedicationsForPainOfParts
        
        @Binding var partName:String
        @Binding var selected : Bool
        var body:some View{
            VStack{
                HStack{
                    Text("\(partName)").font(.headline)
                }.padding(.top,20)
                
                List {
                    Section{
                        if let medicationsForMigraine = mfpp.medicationsForPainOfParts[partName]{
                            
                            ForEach(medicationsForMigraine, id:\.pain){ mfp in
                                Button(action:{
                                    chat.sendToUser(message: mfp.recommendation, answers:mfp.medications, type:1)
                                    
                                    selected=true
                                    dismiss()
                                }){ Text("\(mfp.pain)") }
                                
                            }
                        }
                        else{
                            Button(action:{
                                selected=true
                                dismiss()
                            }){ Text("None") }
                        }
                    }
                }
                .background(Color.mainLightBeige)
                .scrollContentBackground(.hidden)
            }.edgesIgnoringSafeArea(.top)
        }
    }
}

struct BodyPart: View {
    let size: CGSize
    let position: CGPoint
    let target: String
    @Binding var showingSheet: Bool
    @Binding var partName: String
    
    var body: some View {
        Ellipse()
            .fill(Color.red.opacity(0.3))
            .frame(width: size.width, height: size.height)
            .position(x: position.x, y: position.y)
            .onTapGesture {
                showingSheet.toggle()
                self.partName = target
            }
    }
}

struct SickView_Previews: PreviewProvider {
    static var previews: some View {
        SickView()
    }
}
