//
//  Scene.swift
//  Monopoly AR
//
//  Created by 李双全 on 11/1/18.
//  Copyright © 2018 Shuangquan Li. All rights reserved.
//

import SpriteKit
import ARKit

protocol passing {
    
    func lol()
    
}


class Scene: SKScene{

    
    var count = 0
    var oldTime = 0

    
    
    
    override func didMove(to view: SKView) {
        // Setup your scene here
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
        
//        if Int(currentTime) >= Int(oldTime + 1) {
//            print("moving")
//
//        }
        
         //print("moving")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let sceneView = self.view as? ARSKView else {
            return
        }
        

        
        if(count == 0){
        // Create anchor using the camera's current position
            if let currentFrame = sceneView.session.currentFrame {
            
                // Create a transform with a translation of 1.4 meters in front of the camera
                var translation = matrix_identity_float4x4
                translation.columns.3.z = -1.4
                let transform = simd_mul(currentFrame.camera.transform, translation)
            
            
            
                // Add a new anchor to the session
           
                let anchor = ARAnchor(transform: transform)
                sceneView.session.add(anchor: anchor)
                
                
                
                count = 1;
            }
        }
    }
}
