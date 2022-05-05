//
//  ContentView.swift
//  KizMode
//
//  Created by Hyeon-sang Lee on 2022/05/05.
//

import SwiftUI

struct Playground: View {
    
    let viewWidth = UIScreen.main.bounds.width
    let viewHeight = UIScreen.main.bounds.height
    let imageArray = ["dancingDuck", "lovelyChick", "moppingChick", "movingCat"]
    @State var tapPosition: CGPoint = CGPoint(x: 0.0, y: 0.0)
    @State var shapeArray: [ShapeModel] = []
    
    var body: some View {
        ZStack {
            Rectangle()
                .frame(
                    width: viewWidth,
                    height: viewHeight
                )
                .foregroundColor(.white)
            
            ForEach(shapeArray) {shape in
                GIFImage(imageArray[Int.random(in: 0..<imageArray.count)])
                    .frame(width: 100, height: 100)
                    .position (
                        x: shape.x,
                        y: shape.y
                    )
                    .onAppear(perform: {
                        playSound(sound: "blobSound", type: "mp3")
                    })
            }
        } // ZStack
        // ✅ Gesture Actions
        // 🔥 gesture
        .gesture (
            DragGesture(minimumDistance: 0)
                .onEnded { (value) in
                    tapPosition = CGPoint(
                        x: value.location.x,
                        y: value.location.y
                    )
                }
        ) // .gesture
        // 🔥 onChange
        .onChange(of: tapPosition) { _ in
            shapeArray.append(ShapeModel(
                x: tapPosition.x,
                y: tapPosition.y
            ))
        } // onChange tapPosition
        .onChange(of: shapeArray) { _ in
                if shapeArray.count >= 10 {
                    shapeArray
                        .remove(at: 0)
                } else {
                    return
            }
        } // onChange shapeArray
    } // body
} // ContentView

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Playground()
            .previewInterfaceOrientation(.landscapeRight)
    }
}
