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
    var p1InitPos = CGPoint(x: -160, y: -140)
    
    
    var p2XPos = -130
    var p2YPos = -140
    var p2InitPos = CGPoint(x: -130, y: -140)
    
    let map = SKSpriteNode(imageNamed: "map")

    var p1Node = SKLabelNode()
    var p2Node = SKLabelNode()
   
    var player1Name : String = ""
    var player1Token : String = ""
    var player2Name : String = ""
    var player2Token : String = ""
    
    var turn = 0
    
    var p1Counter = 0
    var p2Counter = 0
    
    let p1House0 = SKLabelNode(text: "🏡")
    let p1House1 = SKLabelNode(text: "🏡")
    let p1House2 = SKLabelNode(text: "🏡")
    
    let p2House0 = SKLabelNode(text: "🏠")
    let p2House1 = SKLabelNode(text: "🏠")
    let p2House2 = SKLabelNode(text: "🏠")
    
    var p1Score = 0
    var p2Score = 0
    @IBOutlet weak var p2ScoreLabel: UILabel!
    @IBOutlet weak var p1ScoreLabel: UILabel!
    
    @IBOutlet weak var dice: UILabel!
    
    @IBOutlet weak var rollButton: UIButton!
    
    
    @IBOutlet weak var who: UILabel!
    
    
    @IBAction func roll(_ sender: Any) {
        
        
        let num = Int.random(in: 1 ..< 13)
        dice.text = "Dice: \(num)"
        
        //begin with first player
        if(turn == 0 && p1Counter < 3){// handle player 1
            
            p1Node.isHidden = false
            
            
            
            print("num: \(num)")
            
            
            p1Counter = p1Counter + 1
            
            switch num {
            case 1...3:
                //print("P1Y: \(p1YPos)")
                //print(firstPosGenerator(num: 3, who: 0))
                
                let currentPoint: CGPoint = firstPosGenerator(num: num, who: turn)
                let amove = SKAction.move(to: currentPoint, duration: 1.5)
                p1Node.run(amove)
                
                
                //houseGenerator(who: 0, point: firstPosGenerator(num: num))
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    self.houseGenerator(who: 0, which: self.p1Counter, point: currentPoint)
                    self.p1Node.isHidden = true
                    
                }
            
                p1Score = p1Score+1
               
                
                resetP1Location()
                
                break
                
            case 4...6:
                
                let currentPoint: CGPoint = secondPosGenerator(num: num, who: 0)
                
                let amove = SKAction.move(to: firstPosGenerator(num: 3, who: turn), duration: 1.5)
                let bmove = SKAction.move(to: currentPoint, duration: 1.5)
                p1Node.run(amove)
                
                //delayed movement
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.6) {
                    self.p1Node.run(bmove)
                }
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 3.2) {
                    self.houseGenerator(who: 0, which: self.p1Counter, point: currentPoint)
                    self.p1Node.isHidden = true
                    
                }
                
                p1Score = p1Score+1
         
                
                resetP1Location()
                
                break
                
            case 7...9:
                
                let currentPoint: CGPoint = thirdPosGenerator(num: num, who: 0)
                
                let amove = SKAction.move(to: firstPosGenerator(num: 3, who: 0), duration: 1.5)
                
               // print(firstPosGenerator(num: 3, who: 0))
                
                let bmove = SKAction.move(to: secondPosGenerator(num: 6, who: 0), duration: 1.5)
                //print(secondPosGenerator(num: 6, who: 0))
                let cmove = SKAction.move(to: currentPoint, duration: 1.5)
                
                p1Node.run(amove)
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.6) {
                    self.p1Node.run(bmove)
                }
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 3.2) {
                    self.p1Node.run(cmove)
                }
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                    self.houseGenerator(who: 0, which: self.p1Counter, point: currentPoint)
                    self.p1Node.isHidden = true
                    
                }
                
                p1Score = p1Score+2
              
                
                resetP1Location()
                break
                
            case 10...12:
                
                
                let currentPoint: CGPoint = fourthPosGenerator(num: num, who: 0)
                
                let amove = SKAction.move(to: firstPosGenerator(num: 3, who: 0), duration: 1.5)
                
                // print(firstPosGenerator(num: 3, who: 0))
                
                let bmove = SKAction.move(to: secondPosGenerator(num: 6, who: 0), duration: 1.5)
                //print(secondPosGenerator(num: 6, who: 0))
                let cmove = SKAction.move(to: thirdPosGenerator(num: 9, who: 0), duration: 1.5)
                
                let dmove = SKAction.move(to: currentPoint, duration: 1.5)
                
                p1Node.run(amove)
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.6) {
                    self.p1Node.run(bmove)
                }
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 3.2) {
                    self.p1Node.run(cmove)
                }
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 4.8) {
                    self.p1Node.run(dmove)
                }
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 6.5) {
                    self.houseGenerator(who: 0, which: self.p1Counter, point: currentPoint)
                    self.p1Node.isHidden = true
                    
                }
                
                p1Score = p1Score+2
           
                
                resetP1Location()
                break
                
            default:
                break
            }
            
            who.text = "Turn: \(player2Name)"
            turn = 1
        }else if(turn == 1 && p2Counter < 3){//handle player 2
            
            p2Node.isHidden = false
            
            p2Counter = p2Counter + 1
           
            switch num{
            case 1...3:
                let currentPoint: CGPoint = firstPosGenerator(num: num, who: turn)
                let amove = SKAction.move(to: currentPoint, duration: 1.5)
                p2Node.run(amove)
                
                
                //houseGenerator(who: 0, point: firstPosGenerator(num: num))
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    self.houseGenerator(who: 1, which: self.p2Counter, point: currentPoint)
                    self.p2Node.isHidden = true
                    
                }
                
                p2Score = p2Score+2
                
                resetP2Location()
                break
                
            case 4...6:
                
                let currentPoint: CGPoint = secondPosGenerator(num: num, who: 1)
                
                let amove = SKAction.move(to: firstPosGenerator(num: 3, who: turn), duration: 1.5)
                let bmove = SKAction.move(to: currentPoint, duration: 1.5)
                p2Node.run(amove)
                
                //delayed movement
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.6) {
                    self.p2Node.run(bmove)
                }
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 3.2) {
                    self.houseGenerator(who: 1, which: self.p2Counter, point: currentPoint)
                    self.p2Node.isHidden = true
                    
                }
                
                p2Score = p2Score+2
                
                resetP2Location()
                
                break
                
            case 7...9:
                
                let currentPoint: CGPoint = thirdPosGenerator(num: num, who: 1)
                
                let amove = SKAction.move(to: firstPosGenerator(num: 3, who: 1), duration: 1.5)
                
                // print(firstPosGenerator(num: 3, who: 0))
                
                let bmove = SKAction.move(to: secondPosGenerator(num: 6, who: 1), duration: 1.5)
                //print(secondPosGenerator(num: 6, who: 0))
                let cmove = SKAction.move(to: currentPoint, duration: 1.5)
                
                p2Node.run(amove)
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.6) {
                    self.p2Node.run(bmove)
                }
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 3.2) {
                    self.p2Node.run(cmove)
                }
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                    self.houseGenerator(who: 1, which: self.p2Counter, point: currentPoint)
                    self.p2Node.isHidden = true
                    
                }
                
                 p2Score = p2Score+1
                
                resetP2Location()
                break
                
            case 10...12:
                
                
                let currentPoint: CGPoint = fourthPosGenerator(num: num, who: 1)
                
                let amove = SKAction.move(to: firstPosGenerator(num: 3, who: 1), duration: 1.5)
                
                // print(firstPosGenerator(num: 3, who: 0))
                
                let bmove = SKAction.move(to: secondPosGenerator(num: 6, who: 1), duration: 1.5)
                //print(secondPosGenerator(num: 6, who: 0))
                let cmove = SKAction.move(to: thirdPosGenerator(num: 9, who: 1), duration: 1.5)
                
                let dmove = SKAction.move(to: currentPoint, duration: 1.5)
                
                p2Node.run(amove)
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.6) {
                    self.p2Node.run(bmove)
                }
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 3.2) {
                    self.p2Node.run(cmove)
                }
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 4.8) {
                    self.p2Node.run(dmove)
                }
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 6.5) {
                    self.houseGenerator(who: 1, which: self.p2Counter, point: currentPoint)
                    self.p2Node.isHidden = true
                    
                }
                
                p2Score = p2Score+1
                
                resetP2Location()
                break
                
            default:
                break
            }
            
            
            
            
           
            
            who.text = "Turn: \(player1Name)"
            turn = 0
        }
        
        p1ScoreLabel.text = "P1 Score: \(p1Score)"
        p2ScoreLabel.text = "P2 Score: \(p2Score)"
        
        if(p1Counter == 3 && p2Counter == 3){
            rollButton.isHidden = true
            
            
            if(p1Score > p2Score){
                who.text = "\(player1Name), Wins ✌️"
            }else if(p1Score < p2Score){
                who.text = "\(player2Name), Wins ✌️"
            }else{
                who.text = "Draw 😮"
            }
            
            
            
            print("end")
        }
    }
    
    
    func resetP1Location(){
        p1Node.position = p1InitPos
        p1XPos = Int(p1InitPos.x)
        p1YPos = Int(p1InitPos.y)
        p1Node.isHidden = false
    }
    
    
    func resetP2Location(){
        p2Node.position = p2InitPos
        p2XPos = Int(p2InitPos.x)
        p2YPos = Int(p2InitPos.y)
        p2Node.isHidden = false
    }
    
    //dice == 1 to 3
    func firstPosGenerator(num: Int, who: Int) -> CGPoint{
        
        if(who == 0){
        
            var pos = CGPoint(x: p1XPos, y: p1YPos)
        
            switch num {
            case 1:
                pos = CGPoint(x: -160, y: -50)
                
                break
            case 2:
                pos = CGPoint(x: -160, y: 40)
               
                break
            case 3:
                pos = CGPoint(x: -160, y: 130)
               
                break
            default:
                break
        }
            return pos
            
        }else{
            
            var pos = CGPoint(x: p2XPos, y: p2YPos)
            
            switch num {
            case 1:
                pos = CGPoint(x: -130, y: -50)
                
                break
            case 2:
                pos = CGPoint(x: -130, y: 40)
               
                break
            case 3:
                pos = CGPoint(x: -130, y: 130)
                
            default:
                break
            }
            
            return pos
            
        }
    }
    
    
    //dice == 4 to 6
    func secondPosGenerator(num: Int, who: Int) -> CGPoint{
        
        if(who == 0){
        
            var pos = CGPoint(x: p1XPos, y: 130)
        
        
            switch num {
            case 4:
                pos = CGPoint(x: -70, y: 130)
                
                break
            case 5:
                pos = CGPoint(x: 20, y: 130)
                
                break
            case 6:
                pos = CGPoint(x: 110, y: 130)
                
                break
            default:
                break
                
           }
            
            return pos
            
        }else{
            
            var pos = CGPoint(x: p2XPos, y: 130)
            
            
            switch num {
            case 4:
                pos = CGPoint(x: -40, y: 130)
               
                break
            case 5:
                pos = CGPoint(x: 50, y: 130)
                
                break
            case 6:
                pos = CGPoint(x: 140, y: 130)
               
                break
            default:
                break
                
            }
            
            return pos
            
        }
        
    }
    
    func thirdPosGenerator(num: Int, who: Int) -> CGPoint{
        
        if(who == 0){
            
            var pos = CGPoint(x: p1XPos, y: p1YPos)
            
            switch num {
            case 7:
                
                pos = CGPoint(x: 110, y: 40)
                
                break
            case 8:
                
                pos = CGPoint(x: 110, y: -50)
               
                break
            case 9:
                pos = CGPoint(x: 110, y: -140)
                
            default:
                break
            }
            return pos
            
        }else{
            
            var pos = CGPoint(x: p2XPos, y: p2YPos)
            
            switch num {
            case 7:

                pos = CGPoint(x: 140, y: 40)
               
                break
            case 8:
               
                pos = CGPoint(x: 140, y: -50)
                
                break
            case 9:
                pos = CGPoint(x: 140, y: -140)
                
                break
            default:
                break
            }
            
            return pos
            
        }
        
        
    }
    
    func fourthPosGenerator(num: Int, who: Int) -> CGPoint{
        
        
        if(who == 0){
            
            var pos = CGPoint(x: p1XPos, y: 130)
            
            
            switch num {
            case 10:
                pos = CGPoint(x: 20, y: -140)
                
                break
            case 11:
                pos = CGPoint(x: -70, y: -140)
                
                break
            case 12:
                pos = CGPoint(x: -160, y: -140)
               
                break
            default:
                break
                
            }
            
            return pos
            
        }else{
            
            var pos = CGPoint(x: p2XPos, y: 130)
            
            switch num {
            case 10:
                pos = CGPoint(x: 50, y: -140)
                
                break
            case 11:
                pos = CGPoint(x: -40, y: -140)
               
                break
            case 12:
                pos = CGPoint(x: -130, y: -140)
               
                break
            default:
                break
                
            }
            
            
            return pos
        }
        
        
        
    }
    
    
    
    func houseGenerator(who: Int, which: Int, point: CGPoint){
        
        print("in")
        if(who == 0){
            
            switch which{
                
            case 1:
                p1House0.position = CGPoint(x: point.x, y: point.y)
                p1House0.isHidden = false
                print("added!")
                break
            case 2:
                p1House1.position = CGPoint(x: point.x, y: point.y)
                p1House1.isHidden = false
                print("added 1!")
                break
            case 3:
                p1House2.position = CGPoint(x: point.x, y: point.y)
                p1House2.isHidden = false
                print("added 2!")
                break
            default:
                break
            }
            //test.addChild(p1House)
            
            
            if(p1House0.position == p1House1.position){
                p1House1.position = CGPoint(x: p1House1.position.x, y: p1House1.position.y + 20)
            }else if(p1House0.position == p1House2.position){
                p1House2.position = CGPoint(x: p1House2.position.x, y: p1House2.position.y + 40)
            }
            
            
        }else{
            
            switch which{
                
            case 1:
                p2House0.position = CGPoint(x: point.x, y: point.y)
                p2House0.isHidden = false
                print("p2 added!")
                break
            case 2:
                p2House1.position = CGPoint(x: point.x, y: point.y)
                p2House1.isHidden = false
                print("p2 added 1!")
                break
            case 3:
                p2House2.position = CGPoint(x: point.x, y: point.y)
                p2House2.isHidden = false
                print("p2 added 2!")
                break
            default:
                break
            }
            //test.addChild(p1House)
            
            
            if(p2House0.position == p2House1.position){
                p2House1.position = CGPoint(x: p2House1.position.x, y: p2House1.position.y + 20)
            }else if(p2House0.position == p2House2.position){
                p2House2.position = CGPoint(x: p2House2.position.x, y: p2House2.position.y + 40)
            }
            
        }
        
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
        let alert = UIAlertController(title: "Welcome", message: "Player 1: \(player1Name)\(player1Token)\n Player 2: \(player2Name)\(player2Token) \n Touch Screnn To Place the Map", preferredStyle: .alert)
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
        
        
        
        p1Node = SKLabelNode(text: player1Token)
        p2Node = SKLabelNode(text: player2Token)
        
       
        
        map.zPosition = 200
        //test.size = CGSize(width: 32, height: 32)
        map.position = CGPoint(x: 30, y: 30)
        
        
        
        //labelNode.zPosition = 10000
        //labelNode1.size = CGSize(width: 9, height: 9)
        
        p2Node.horizontalAlignmentMode = .center
        p2Node.verticalAlignmentMode = .center
        
        p1Node.horizontalAlignmentMode = .center
        p1Node.verticalAlignmentMode = .center
        
        
        p1Node.position = CGPoint(x: p1XPos, y: p1YPos)
        p2Node.position = CGPoint(x: p2XPos, y: p2YPos)
        
        
        p1House0.position=CGPoint(x: p1XPos, y: p1YPos)
        map.addChild(p1House0)
        p1House0.isHidden = true
        
        p1House1.position=CGPoint(x: p1XPos, y: p1YPos)
        map.addChild(p1House1)
        p1House1.isHidden = true
        
        p1House2.position=CGPoint(x: p1XPos, y: p1YPos)
        map.addChild(p1House2)
        p1House2.isHidden = true
        
        p2House0.position = CGPoint(x: p2XPos, y: p2YPos)
        map.addChild(p2House0)
        p2House0.isHidden = true
        
        p2House1.position = CGPoint(x: p2XPos, y: p2YPos)
        map.addChild(p2House1)
        p2House1.isHidden = true
        
        p2House2.position = CGPoint(x: p2XPos, y: p2YPos)
        map.addChild(p2House2)
        p2House2.isHidden = true
        
        map.addChild(p1Node)
        map.addChild(p2Node)
        
        return map;

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
