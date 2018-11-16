//
//  HistoryVC.swift
//  Monopoly AR
//
//  Created by 李双全 on 11/9/18.
//  Copyright © 2018 Shuangquan Li. All rights reserved.
//

import UIKit


protocol HistoryDelegate {
    
}


class HistoryVC: UIViewController{
    
    
    @IBOutlet weak var player1: UILabel!
    @IBOutlet weak var player2: UILabel!
    
    let standardDefaults0 = UserDefaults.standard
    let standardDefaults1 = UserDefaults.standard
    let standardDefaults2 = UserDefaults.standard
    
    
    var player1Name : String = ""
    var player1Token : String = ""
    var player2Name : String = ""
    var player2Token : String = ""
    
    
    
    
    override func viewDidLoad() {

        
            //standardDefaults0.set("player1Name", forKey: "p1Name")
        player1.text = "Player1: \(standardDefaults0.object(forKey: "p1Name") as? String ?? "null")"
        player2.text = "Player2: \(standardDefaults0.object(forKey: "p2Name") as? String ?? "null")"
        
    }
    
}
