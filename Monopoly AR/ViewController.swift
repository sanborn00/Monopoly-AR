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



class ViewController: UIViewController, ARSKViewDelegate, HistoryDelegate, GameDelegate {

    var p1XPos = -160
    var p1YPos = -140
    
    var p2XPos = -130
    var p2YPos = -140
    
    let test = SKSpriteNode(imageNamed: "map")

    var labelNode = SKLabelNode()
    var labelNode1 = SKLabelNode()
   
    var player1Name : String = ""
    var player1Token : String = ""
    var player2Name : String = ""
    var player2Token : String = ""
    
    var turn = 0
    
    var p1Counter = 0
    var p2Counter = 0
    @IBOutlet weak var dice: UILabel!
    
   
    
    @IBOutlet weak var who: UILabel!
    
    
    @IBAction func roll(_ sender: Any) {
        
        //let point = move()
        
        
        //begin with first player
        if(turn == 0 && p1Counter < 3){
            
            let num = Int.random(in: 1 ..< 7)
            //let num = 6
            dice.text = "Dice: \(num)"
            who.text = "Turn: \(player1Name)"
            
            
            print("num: \(num)")
            
            
            switch num {
            case 1...3:
                print("P1Y: \(p1YPos)")
                let amove = SKAction.move(to: firstPosGenerator(num: num), duration: 1.5)
                labelNode.run(amove)
                break
                
            case 4...6:
                let amove = SKAction.move(to: firstPosGenerator(num: 3), duration: 1.5)
                let bmove = SKAction.move(to: secondPosGenerator(num: num), duration: 1.5)
                labelNode.run(amove)
                
                //delayed movement
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.6) {
                    self.labelNode.run(bmove)
                }
            default:
                break
            }
            
            
            turn = 1
        }else if(turn == 1 && p2Counter < 3){
            
            who.text = "Turn: \(player2Name)"
            
            turn = 0
        }
        
    }
    
    //dice == 1 to 3
    func firstPosGenerator(num: Int) -> CGPoint{
        var pos = CGPoint(x: p1XPos, y: p1YPos)
        
        switch num {
        case 1:
            p1YPos = p1YPos + 90
            pos = CGPoint(x: -160, y: p1YPos)
            break
        case 2:
            p1YPos = p1YPos + 90 * 2
            pos = CGPoint(x: -160, y: p1YPos)
        case 3:
            p1YPos = p1YPos + 90 * 3
            pos = CGPoint(x: -160, y: p1YPos)
        default:
            break
        }
        
        return pos
    }
    
    
    //dice == 4 to 6
    func secondPosGenerator(num: Int) -> CGPoint{
        
        var pos = CGPoint(x: p1XPos, y: 130)
        
        switch num {
        case 4:
            p1XPos = p1XPos + 90
            pos = CGPoint(x: p1XPos, y: 130)
            break
        case 5:
            p1XPos = p1XPos + 90 * 2
            pos = CGPoint(x: p1XPos, y: 130)
        case 6:
            p1XPos = p1XPos + 90 * 3
            pos = CGPoint(x: p1XPos, y: 130)
        default:
            break
        }
        
        return pos
    }
    
    
    @IBOutlet var sceneView: ARSKView!
    
    
    override func viewDidLoad() {
        
        
       
        
        super.viewDidLoad()
        
       
       //init who label
        who.text = "Turn: \(player1Name)"
        
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
   
    func view(_ view: ARSKView, nodeFor anchor: ARAnchor) -> SKNode? {
        // Create and configure a node for the anchor added to the view's session.
        
        
        
        labelNode = SKLabelNode(text: player1Token)
        labelNode1 = SKLabelNode(text: player2Token)
        
       
        
        test.zPosition = 200
        //test.size = CGSize(width: 32, height: 32)
        test.position = CGPoint(x: 30, y: 30)
        
        
        
        //labelNode.zPosition = 10000
        //labelNode1.size = CGSize(width: 9, height: 9)
        
        labelNode1.horizontalAlignmentMode = .center
        labelNode1.verticalAlignmentMode = .center
        
        labelNode.horizontalAlignmentMode = .center
        labelNode.verticalAlignmentMode = .center
        
        
        labelNode.position = CGPoint(x: p1XPos, y: p1YPos)
        labelNode1.position = CGPoint(x: p2XPos, y: p2YPos)
        
        test.addChild(labelNode)
        test.addChild(labelNode1)
        
        return test;

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
