//
//  testtest.swift
//  Family-health-care
//
//  Created by seokhyeon on 2023/05/16.
//

import SwiftUI
import Firebase

struct testtest: View {
    @EnvironmentObject private var ttest : Test
    var body: some View {
        VStack{
            Text("\(ttest.born)")
            Text("\(ttest.t)")
            Button(action: {ttest.born=9999
                ttest.t=Timestamp()
            }){
                Text("눌러봐라")
            }
        }
    }
}

struct testtest_Previews: PreviewProvider {
    static var previews: some View {
        testtest()
    }
}
