//
//  FirstVC.swift
//  Monopoly AR
//
//  Created by 李双全 on 11/1/18.
//  Copyright © 2018 Shuangquan Li. All rights reserved.
//

import UIKit



class FirstVC: UIViewController, GameDelegate{

    
    @IBOutlet weak var name1: UITextField!
    @IBOutlet weak var name2: UITextField!
    
    
    @IBOutlet weak var player1PickerView: UIPickerView!
    @IBOutlet weak var player1Selection: UILabel!
    
    @IBOutlet weak var player2PickerView: UIPickerView!
    @IBOutlet weak var player2Selection: UILabel!
    
    @IBOutlet weak var lable: UILabel!
    
    @IBAction func hidde(_ sender: Any) {
        
        lable.isHidden = true
    }
    

    
    
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        player2PickerView.dataSource = self
        player2PickerView.delegate = self
        
        player1PickerView.dataSource = self
        player1PickerView.delegate = self
        
    }
    
    
    
    
    
    //Sending player's name and token to game controller
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! ViewController
        vc.player1Name = name1.text!
        vc.player1Token = player2Selection.text!
        vc.player2Name = name2.text!
        vc.player2Token = "a"
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
