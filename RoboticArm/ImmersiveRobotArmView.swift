//
//  ImmersiveView.swift
//  RoboticArm
//
//  Created by Giulio on 28/09/24.
//

import RealityKit
import RealityKitContent
import SwiftUI

struct ImmersiveRobotArmView: View {
    
    @State private var scene: Entity? // Store the scene entity here
    
    var body: some View {
        
        VStack{
            HStack{
                Button("Move Arm 1") {
                    print("Move Arm 1 button pressed")
                    
                    if let arm1 = scene?.findEntity(named: "Arm1") {
                        rotateArm1(arm1)
                    }
                }
                
                Button("Move Arm 2") {
                    print("Move Arm 2 button pressed")
                    
                    if let arm2 = scene?.findEntity(named: "Arm2") {
                        rotateArm2(arm2)
                    }
                }
                
                Button("Move Arm 3") {
                    print("Move Arm 3 button pressed")
                    
                    if let arm3 = scene?.findEntity(named: "Arm3") {
                        rotateArm3(arm3)
                    }
                }
                
            }
            
            
            RealityView { content in
                if let loadedScene = try? await Entity(named: "RoboticArm0_1", in: realityKitContentBundle) {
                    loadedScene.transform.translation = [0, 0, -2] // Place 2 meters in front of the viewer
                    content.add(loadedScene)
                    print("Loaded Scene")
                    
                    // Store the scene in the @State variable
                    scene = loadedScene
                    
                    // Perform rotation after a delay (3 seconds in this example)
//                    DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
//                        if let arm1 = loadedScene.findEntity(named: "Arm1") {
//                            rotateArm1(arm1)
//                        }
//                    }
                }
            }
        }
    }
    
    // Helper function to apply rotation to Arm1
    func rotateArm1(_ arm1: Entity) {
        // Rotate Arm1 90 degrees around the X-axis
        let rotation = simd_quatf(angle: .pi / 4, axis: [0, 0, 1]) // 90 degrees in radians
        arm1.move(to: Transform(rotation: rotation), relativeTo: arm1, duration: 2.0) // 2 seconds animation
    }
    
    func rotateArm2(_ arm2: Entity) {
        // Rotate Arm1 90 degrees around the X-axis
        let rotation = simd_quatf(angle: .pi / 8, axis: [0, 1, 0]) // 90 degrees in radians
        arm2.move(to: Transform(rotation: rotation), relativeTo: arm2, duration: 1.0) // 2 seconds animation
    }
    
    func rotateArm3(_ arm3: Entity) {
        // Rotate Arm1 90 degrees around the X-axis
        let rotation = simd_quatf(angle: .pi / 8, axis: [0, 1, 0]) // 90 degrees in radians
        arm3.move(to: Transform(rotation: rotation), relativeTo: arm3, duration: 1.0) // 2 seconds animation
    }
    
    
}

#Preview {
    ImmersiveRobotArmView()
}



//    func applyTransformToArm1() {
//        guard let scene = scene else {
//            print("Scene is not loaded yet")
//            return
//        }
//        if let armEntity = scene.findEntity(named: "Arm1") {
//            print("Found Arm1")
//            var newTransform = armEntity.transform
//            newTransform.rotation = simd_quatf(angle: .pi / 4, axis: [0, 1, 0]) // 45 degrees rotation
//            armEntity.move(to: newTransform, relativeTo: armEntity, duration: 1.0)
//        }
//    }
//
//    func applyTransformToArm2() {
//        guard let scene = scene else {
//            print("Scene is not loaded yet")
//            return
//        }
//        if let armEntity = scene.findEntity(named: "Arm2") {
//            print("Found Arm2")
//            var newTransform = armEntity.transform
//            newTransform.rotation = simd_quatf(angle: .pi / 4, axis: [0, 1, 0]) // 45 degrees rotation
//            armEntity.move(to: newTransform, relativeTo: armEntity, duration: 1.0)
//        }
//    }
//
//    func applyTransformToArm3() {
//        guard let scene = scene else {
//            print("Scene is not loaded yet")
//            return
//        }
//        if let armEntity = scene.findEntity(named: "Arm3") {
//            print("Found Arm3")
//            var newTransform = armEntity.transform
//            newTransform.rotation = simd_quatf(angle: .pi / 4, axis: [0, 1, 0]) // 45 degrees rotation
//            armEntity.move(to: newTransform, relativeTo: armEntity, duration: 1.0)
//        }
//    }
//
//    func applyTransformToArm7A() {
//        guard let scene = scene else {
//            print("Scene is not loaded yet")
//            return
//        }
//        if let armEntity = scene.findEntity(named: "Arm7A") {
//            print("Found Arm7A")
//            var newTransform = armEntity.transform
//            newTransform.rotation = simd_quatf(angle: .pi / 4, axis: [0, 1, 0]) // 45 degrees rotation
//            armEntity.move(to: newTransform, relativeTo: armEntity, duration: 1.0)
//        }
//    }


//        VStack {
//            HStack {
//                Button(action: {
//                    applyTransformToArm1()
//                }) {
//                    Text("Move Arm 1")
//                        .font(.largeTitle)
//                        .padding(20)
//                }
//                Button(action: {
//                    applyTransformToArm2()
//                }) {
//                    Text("Move Arm 2")
//                        .font(.largeTitle)
//                        .padding(20)
//                }
//                Button(action: {
//                    applyTransformToArm3()
//                }) {
//                    Text("Move Arm 3")
//                        .font(.largeTitle)
//                        .padding(20)
//                }
//                Button(action: {
//                    applyTransformToArm7A()
//                }) {
//                    Text("Move Arm 7A")
//                        .font(.largeTitle)
//                        .padding(20)
//                }
//            }
