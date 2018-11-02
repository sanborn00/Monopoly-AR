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
    

    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var selection: UILabel!
    
    @IBOutlet weak var lable: UILabel!
    
    @IBAction func hidde(_ sender: Any) {
        
        lable.isHidden = true
    }
    

    
    
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pickerView.dataSource = self as? UIPickerViewDataSource
        pickerView.delegate = self as? UIPickerViewDelegate
        
    }
    
    
    
    
    
    //Sending player's name and token to game controller
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! ViewController
        vc.player1Name = name1.text!
        vc.player1Token = selection.text!
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
        return dataSource.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selection.text = dataSource[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return dataSource[row]
    }
}
