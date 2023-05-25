//
//  WriteTextView.swift
//  Family-health-care
//
//  Created by 이다현 on 2023/05/23.
//

import SwiftUI

struct WriteTextView: UIViewRepresentable {
    @Binding var text: String
    @Binding var isFocused: Bool
    @Binding var inputHeight: CGFloat
    var maxHeight: CGFloat
    
    func makeUIView(context: UIViewRepresentableContext<WriteTextView>) -> UITextView {
        let textView = UITextView(frame: .zero)
        textView.delegate = context.coordinator
        textView.font = UIFont(name: "Avenir", size: 16)
        textView.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        return textView
    }
    
    func makeCoordinator() -> WriteTextView.Coordinator {
        Coordinator(text: self.$text, isFocused: self.$isFocused, inputHeight: $inputHeight,maxHeight: maxHeight)
    }
    
    func updateUIView(_ uiView: UITextView, context: UIViewRepresentableContext<WriteTextView>) {
        uiView.text = self.text
    }
    
    class Coordinator: NSObject, UITextViewDelegate {
        @Binding var text: String
        @Binding var isFocused: Bool
        @Binding var inputHeight: CGFloat
        var maxHeight: CGFloat
//        let maxHeight: CGFloat = 250
        
        init(text: Binding<String>, isFocused: Binding<Bool>, inputHeight: Binding<CGFloat>, maxHeight: CGFloat) {
            self._text = text
            self._isFocused = isFocused
            self._inputHeight = inputHeight
            self.maxHeight = maxHeight
        }
        
        func textViewDidChange(_ textView: UITextView) {
            let spacing = textView.font!.lineHeight
            if textView.contentSize.height > inputHeight && inputHeight <= maxHeight - spacing {
                inputHeight += spacing
            } else if text == "" {
                inputHeight = 40
            }
        }
        
        func textViewDidChangeSelection(_ textView: UITextView) {
            self.text = textView.text ?? ""
        }
        
        func textViewDidBeginEditing(_ textView: UITextView) {
            self.isFocused = true
        }
        
        func textViewDidEndEditing(_ textView: UITextView) {
            self.isFocused = false
        }
    }
}

//struct WriteTextView_Previews: PreviewProvider {
//    static var previews: some View {
//        WriteTextView()
//    }
//}
