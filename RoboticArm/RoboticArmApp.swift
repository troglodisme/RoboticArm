//
//  RoboticArmApp.swift
//  RoboticArm
//
//  Created by Giulio on 28/09/24.
//

import SwiftUI


@main
struct RobotArmControllerApp: App {

    var body: some Scene {
        WindowGroup() {
            ContentView()
        }
        .defaultSize(CGSize(width: 300, height: 400))


        // Definition of the Immersive Space.
        ImmersiveSpace(id: "MyImmersiveSpaceID") {
            ImmersiveRobotArmView()
        }
    }
    
}


