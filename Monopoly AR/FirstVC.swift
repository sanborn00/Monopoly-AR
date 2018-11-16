//
//  FirstVC.swift
//  Monopoly AR
//
//  Created by 李双全 on 11/1/18.
//  Copyright © 2018 Shuangquan Li. All rights reserved.
//

import UIKit



class FirstVC: UIViewController, GameDelegate, HistoryDelegate{
    
    
    @IBOutlet weak var name1: UITextField!
    @IBOutlet weak var name2: UITextField!
    
    
    @IBOutlet weak var player1PickerView: UIPickerView!
    @IBOutlet weak var player1Selection: UILabel!
    
    @IBOutlet weak var player2PickerView: UIPickerView!
    @IBOutlet weak var player2Selection: UILabel!
    
    let standardDefaults0 = UserDefaults.standard
    let standardDefaults1 = UserDefaults.standard
    let standardDefaults2 = UserDefaults.standard
    
    
    var firstPlayerHistory1 = ""
    var firstTokenHistort1 = ""
    var secondPlayerHistory1 = ""
    var secondTokenHistort1 = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        
        player2PickerView.dataSource = self
        player2PickerView.delegate = self
        
        player1PickerView.dataSource = self
        player1PickerView.delegate = self
        
    }
    
    
    
    
    
    //Sending player's name and token to game controller
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        
        
        let vc = segue.destination
        
        if let vc = vc as? ViewController{
            
            vc.player1Name = name1.text!
            vc.player1Token = player1Selection.text!
            vc.player2Name = name2.text!
            vc.player2Token = player2Selection.text!
        }else if let vc = vc as? HistoryVC{
            
            if(name1.text == "" && firstPlayerHistory1 != ""){
                vc.standardDefaults0.set(firstPlayerHistory1+" "+firstTokenHistort1, forKey: "p1Name")
                vc.standardDefaults0.set(secondPlayerHistory1+" "+secondTokenHistort1, forKey: "p2Name")
                print("sent to his!!!!"+firstPlayerHistory1+firstTokenHistort1)
                
            }
        }
    }
    
    
    
    
    
}

let dataSource = ["Selecte Character","😂", "😒", "🌚", "🤔"]

extension FirstVC: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if(pickerView == player1PickerView){
            return dataSource.count
            
        }else{
            return dataSource.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        if(pickerView == player2PickerView){
            player2Selection.text = dataSource[row]
            
        }else{
            player1Selection.text = dataSource[row]
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        if(pickerView == player1PickerView){
            return dataSource[row]
            
        }else{
            return dataSource[row]
        }
    }
}
