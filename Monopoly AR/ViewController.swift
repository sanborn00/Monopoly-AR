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



class ViewController: UIViewController, ARSKViewDelegate,HistoryDelegate {

    
    
   
    var player1Name : String = ""
    var player1Token : String = ""
    var player2Name : String = ""
    var player2Token : String = ""
    
    @IBOutlet weak var dice: UILabel!
    
   
    
    @IBAction func roll(_ sender: Any) {
        let num = Int.random(in: 1 ..< 7)
        dice.text = "Dicd: \(num)"
        
    }
    
    
    
    
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
        
        //configuration.planeDetection = [.horizontal]

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
        let labelNode1 = SKLabelNode(text: player2Token)
        
        let test = SKSpriteNode(imageNamed: "1024")
        
        test.zPosition = 200
        test.size = CGSize(width: 32, height: 32)
        test.position = CGPoint(x: 30, y: 30)
        
        
        
        labelNode.zPosition = 10000
        //labelNode1.size = CGSize(width: 9, height: 9)
        
        labelNode1.horizontalAlignmentMode = .center
        labelNode1.verticalAlignmentMode = SKLabelVerticalAlignmentMode(rawValue: 50)!
        
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
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        
        if let vc = segue.destination as? FirstVC{
            vc.firstPlayerHistory1 = player1Name
            vc.firstTokenHistort1 = player1Token
            vc.secondPlayerHistory1 = player2Name
            vc.secondTokenHistort1 = player2Token
            print("sussed"+player1Name+player1Token)
        }
       
    }
    
}
