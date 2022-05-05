//
//  SampleShape.swift
//  KizMode
//
//  Created by Hyeon-sang Lee on 2022/05/05.
//

import SwiftUI

struct SampleShape: View {
    var body: some View {
        Rectangle()
            .frame(width: 50, height: 50)
            .foregroundColor(.red)
    }
}

struct SampleShape_Previews: PreviewProvider {
    static var previews: some View {
        SampleShape()
    }
}
