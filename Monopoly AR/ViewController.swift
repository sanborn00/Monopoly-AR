//
//  ViewController.swift
//  Monopoly AR
//
//  Created by 李双全 on 11/1/18.
//  Copyright © 2018 Shuangquan Li. All rights reserved.
//

import UIKit
import SpriteKit
import ARKit

protocol GameDelegate {

}



class ViewController: UIViewController, ARSKViewDelegate {
    
   
    var player1Name : String = ""
    var player1Token : String = ""
    var player2Name : String = ""
    var player2Token : String = ""
   
    
    
    
    @IBOutlet var sceneView: ARSKView!
    

    
    override func viewDidLoad() {
        
        
       
        
        super.viewDidLoad()
        
        
       
        
        print("1st name:"+player1Name)
        print("2ed name:"+player2Name)
        
        // Set the view's delegate
        sceneView.delegate = self
        
        // Show statistics such as fps and node count
        sceneView.showsFPS = true
        sceneView.showsNodeCount = true
        
        // Load the SKScene from 'Scene.sks'
        if let scene = SKScene(fileNamed: "Scene") {
            sceneView.presentScene(scene)
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let alert = UIAlertController(title: "Welcome", message: "Player 1: \(player1Name)\(player1Token)\n Player 2: \(player2Name)\(player2Token)", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        
        self.present(alert, animated: true, completion: nil)
    }
    
   
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()

        // Run the view's session
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }
    
    // MARK: - ARSKViewDelegate
    var turn = 0
    func view(_ view: ARSKView, nodeFor anchor: ARAnchor) -> SKNode? {
        // Create and configure a node for the anchor added to the view's session.
        
        
        let labelNode = SKLabelNode(text: player1Token)
        let labelNode1 = SKLabelNode(text: player1Token)
        
       
        labelNode1.horizontalAlignmentMode = .center
        labelNode1.verticalAlignmentMode = .center
        
        labelNode.horizontalAlignmentMode = .center
        labelNode.verticalAlignmentMode = .center
        
             if(turn == 0){
                turn = 1
                return labelNode;
            
             }else{
            
            turn = 0
            return labelNode1;
        }
    }
    
    func session(_ session: ARSession, didFailWithError error: Error) {
        // Present an error message to the user
        
    }
    
    func sessionWasInterrupted(_ session: ARSession) {
        // Inform the user that the session has been interrupted, for example, by presenting an overlay
        
    }
    
    func sessionInterruptionEnded(_ session: ARSession) {
        // Reset tracking and/or remove existing anchors if consistent tracking is required
        
    }
}
