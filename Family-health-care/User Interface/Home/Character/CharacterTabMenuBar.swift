//
//  CharacterTabMenuBar.swift
//  Family-health-care
//
//  Created by seokhyeon on 2023/05/29.
//

import SwiftUI

struct CharacterTabMenuBar: View {
    @Binding var selected : Int
    let buttons = [
            ButtonInfo(title: "내 캐릭터", selectionValue: 0),
            ButtonInfo(title: "캐릭터 변경", selectionValue: 1)
        ]

        var body: some View {
            HStack {
                ForEach(buttons.indices, id: \.self) { index in
                    Button(action: { withAnimation { selected = buttons[index].selectionValue } }) {
                        Text(buttons[index].title)
                    }
                    .buttonStyle(TabMenuButtonStyle(isSelected: selected == buttons[index].selectionValue))
                }
            }
            .padding()
            .background(Color.mainBeige)
        }
}

struct ButtonInfo {
    let title: String
    let selectionValue: Int
}

struct TabMenuButtonStyle: ButtonStyle {
    let isSelected: Bool

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(width: 120)
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(Color.mainLightBeige)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .fill(isSelected ? Color.mainLightBeige : Color.mainBeige)
                    )
            )
            .foregroundColor(Color.black)
    }
}

//struct CharacterTabMenuBar_Previews: PreviewProvider {
//    static var previews: some View {
//        CharacterTabMenuBar()
//    }
//}
