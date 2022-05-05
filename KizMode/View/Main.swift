//
//  Main.swift
//  KizMode
//
//  Created by Hyeon-sang Lee on 2022/05/05.
//

import SwiftUI

struct Main: View {
    var body: some View {
        NavigationView {
            VStack{
                Text("키즈모드")
                
                Spacer()
                    .frame(height: 50)
                
                NavigationLink (
                    destination:
                        Playground()
                        .navigationBarHidden(true)
                ) {
                    Text("시작하기")
                }
            }
        }
    }
}

struct Main_Previews: PreviewProvider {
    static var previews: some View {
        Main()
    }
}
