//
//  ContentView.swift
//  RoboticArm
//
//  Created by Giulio on 28/09/24.
//

import SwiftUI
import RealityKit
import RealityKitContent



struct ContentView: View {

    @State private var isImmersiveSpaceOpened = false

    @Environment(\.openImmersiveSpace) var openImmersiveSpace
    @Environment(\.dismissImmersiveSpace) var dismissImmersiveSpace

    var body: some View {
        Button(isImmersiveSpaceOpened ? "Exit Immersive Space" : "Show Immersive Space", role: isImmersiveSpaceOpened ? .destructive : .none) {
            Task {
                if isImmersiveSpaceOpened {
                    await dismissImmersiveSpace()
                    isImmersiveSpaceOpened = false
                } else {
                    let result = await openImmersiveSpace(id: "MyImmersiveSpaceID")  // Corrected the ID
                    if result == .opened {
                        isImmersiveSpaceOpened = true
                    }
                }
            }
        }
    }
}

#Preview() {
    ContentView()
}

//struct ContentView: View {
//    var body: some View {
//        VStack {
//            Model3D(named: "Scene", bundle: realityKitContentBundle)
//                .padding(.bottom, 50)
//
//            Text("Hello, world!")
//        }
//        .padding()
//    }
//}

//struct ContentView: View {
//
//    @State private var scale: Float = 1.0
//
//    var body: some View {
//        VStack(spacing: 18) {
//            RealityView { content in
//                if let roboticArm = try? await ModelEntity(named: "RoboticArm") {
//                    content.add(roboticArm)
//                    roboticArm.position = [0,-0.2,0]
//                    roboticArm.transform.scale = [0.01, 0.01, 0.01]
//
//                }
//            } update: { content in
//                if let roboticArm = content.entities.first {
//                    roboticArm.transform.scale = [scale, scale, scale]
//                }
//            } placeholder: {
//                ProgressView()
//            }
//
//        Slider(value: $scale, in: 0.01...0.1)
//            .padding()
//            .glassBackgroundEffect()
//        }
//    }
//}
