//
//  testtest.swift
//  Family-health-care
//
//  Created by seokhyeon on 2023/05/16.
//

import SwiftUI
import Firebase

struct testtest: View {
    @EnvironmentObject private var Fam : Family
    var body: some View {
        VStack{
            ForEach(Fam.users,id:\.userId){ i in
                Text("Username : " + "\(i.userName)")
                Text("UserId : " + "\(i.userId)")
                Text("Weight : " + "\(i.weight)")
                Text("Height : " + "\(i.height)")
                VStack{
                    ForEach(i.medicineState,id:\.time){ med in
                        HStack{
                            Text("\(med.medicineName)")
                            Text("\(String(med.isComplete))")
                            Text("\(med.time)")
                        }
                    }
                }
                Text("")
            }
            Text(String(Fam.users.count))}
    }
}

struct testtest_Previews: PreviewProvider {
    static var previews: some View {
        testtest()
    }
}
