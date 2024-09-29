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
        
        Text("Robotic Arm Controller")
        
        Button(isImmersiveSpaceOpened ? "Exit Robotic Arm Controller" : "Launch Robotic Arm Controller", role: isImmersiveSpaceOpened ? .destructive : .none) {
            Task {
                if isImmersiveSpaceOpened {
                    await dismissImmersiveSpace()
                    isImmersiveSpaceOpened = false
                } else {
                    let result = await openImmersiveSpace(id: "MyImmersiveSpaceID")
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


