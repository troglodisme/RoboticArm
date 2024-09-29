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
    
    @State private var scene: Entity?
        
    var body: some View {
        
        VStack{
            
            HStack{
                VStack{
                    Text("ARM 1")
                        .font(.largeTitle)
                    
                    Button {
                        if let arm1 = scene?.findEntity(named: "Arm1") {
                            rotateArm1(arm1)
                        }
                    } label: {
                        Image(systemName: "arrow.clockwise")
                            .padding(20)
                    }
                    
                    Button {
                        if let arm1 = scene?.findEntity(named: "Arm1") {
                            rotateArm1Inverse(arm1)
                        }
                    } label: {
                        Image(systemName: "arrow.counterclockwise")
                            .padding(20)
                    }
                    
                }
                
                VStack{
                    Text("ARM 2")
                        .font(.largeTitle)
                    
                    Button {
                        if let arm2 = scene?.findEntity(named: "Arm2") {
                            rotateArm2(arm2)
                        }
                    } label: {
                        Image(systemName: "arrow.clockwise")
                            .padding(20)
                    }
                    
                    Button {
                        if let arm2 = scene?.findEntity(named: "Arm2") {
                            rotateArm2Inverse(arm2)
                        }
                    } label: {
                        Image(systemName: "arrow.counterclockwise")
                            .padding(20)
                    }
                }
                
                VStack{
                    Text("ARM 3")
                        .font(.largeTitle)
                    
                    Button {
                        if let arm3 = scene?.findEntity(named: "Arm3") {
                            rotateArm3(arm3)
                        }
                    } label: {
                        Image(systemName: "arrow.clockwise")
                            .padding(20)
                    }
                    
                    Button {
                        if let arm3 = scene?.findEntity(named: "Arm3") {
                            rotateArm2Inverse(arm3)
                        }
                    } label: {
                        Image(systemName: "arrow.counterclockwise")
                            .padding(20)
                    }
                }
                
                
                
                // New button to control both Arm 7A and 7B together
                Button("Open Claws") {
                    
                    if let arm7A = scene?.findEntity(named: "Arm7A"), let arm7B = scene?.findEntity(named: "Arm7B") {
                        openArms7Aand7B(arm7A: arm7A, arm7B: arm7B)
                    }
                }
                
                Button("Close Claws") {
                    
                    if let arm7A = scene?.findEntity(named: "Arm7A"), let arm7B = scene?.findEntity(named: "Arm7B") {
                        closeArms7Aand7B(arm7A: arm7A, arm7B: arm7B)
                    }
                }
                
            }
            .padding(60)
            .background(Color.black)
            .cornerRadius(20)
            
            
            RealityView { content, attachements in
                if let loadedScene = try? await Entity(named: "RoboticArm0_1", in: realityKitContentBundle) {
                    loadedScene.transform.translation = [0, 0, -2] // Place 2 meters in front of the viewer
                    content.add(loadedScene)
                    print("Loaded Scene")
                    
                    scene = loadedScene
                }
            }attachments: {
                Attachment(id: "progMove") {
                    Text("Test")
                        .padding(20)
                        .glassBackgroundEffect()
                }
            }
            
        }
    }
    
    // Helper function to apply rotation to Arm1
    func rotateArm1(_ arm1: Entity) {
        let rotation = simd_quatf(angle: .pi / 4, axis: [0, 0, 1]) // 90 degrees in radians
        arm1.move(to: Transform(rotation: rotation), relativeTo: arm1, duration: 2.0)
    }
    
    func rotateArm1Inverse(_ arm1: Entity) {
        let rotation = simd_quatf(angle: -.pi / 4, axis: [0, 0, 1]) // 90 degrees in radians
        arm1.move(to: Transform(rotation: rotation), relativeTo: arm1, duration: 2.0)
    }
    
    func rotateArm2(_ arm2: Entity) {
        let rotation = simd_quatf(angle: .pi / 8, axis: [0, 1, 0]) // 90 degrees in radians
        arm2.move(to: Transform(rotation: rotation), relativeTo: arm2, duration: 1.0)
    }
    
    func rotateArm2Inverse(_ arm2: Entity) {
        let rotation = simd_quatf(angle: -.pi / 8, axis: [0, 1, 0]) // 90 degrees in radians
        arm2.move(to: Transform(rotation: rotation), relativeTo: arm2, duration: 1.0)
    }
    
    
    func rotateArm3(_ arm3: Entity) {
        let rotation = simd_quatf(angle: .pi / 8, axis: [0, 1, 0]) // 90 degrees in radians
        arm3.move(to: Transform(rotation: rotation), relativeTo: arm3, duration: 0.6)
    }
    
    
    func rotateArm3Inverse(_ arm3: Entity) {
        let rotation = simd_quatf(angle: -.pi / 8, axis: [0, 1, 0]) // 90 degrees in radians
        arm3.move(to: Transform(rotation: rotation), relativeTo: arm3, duration: 0.6)
    }
        
    
    func openArms7Aand7B(arm7A: Entity, arm7B: Entity) {
        let rotationA = simd_quatf(angle: .pi / 16, axis: [0, 0, 1])
        let rotationB = simd_quatf(angle: -.pi / 16, axis: [0, 0, 1])
        
        arm7A.move(to: Transform(rotation: rotationA), relativeTo: arm7A, duration: 0.2)
        arm7B.move(to: Transform(rotation: rotationB), relativeTo: arm7B, duration: 0.2)
    }
    
    func closeArms7Aand7B(arm7A: Entity, arm7B: Entity) {
        let rotationA = simd_quatf(angle: -.pi / 16, axis: [0, 0, 1])
        let rotationB = simd_quatf(angle: .pi / 16, axis: [0, 0, 1])
        
        arm7A.move(to: Transform(rotation: rotationA), relativeTo: arm7A, duration: 0.2)
        arm7B.move(to: Transform(rotation: rotationB), relativeTo: arm7B, duration: 0.2)
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
