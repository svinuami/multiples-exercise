//
//  ViewController.swift
//  multiples
//
//  Created by Vinodh Srinivasan on 4/30/16.
//  Copyright © 2016 creaTech. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let multipleLimit = 10;
   
    var currentMultCnt = 0
    var multipleNumber = 0;
    var currentResult = 0;
    var prevResult = 0;
    
    @IBOutlet weak var logoImg : UIImageView!
    @IBOutlet weak var playBtn : UIButton!
    @IBOutlet weak var numberInpt : UITextField!
    @IBOutlet weak var pressAddLbl : UILabel!
    @IBOutlet weak var addBtn : UIButton!
    @IBOutlet weak var resultLbl : UILabel!
    
    @IBAction func onPlayBtn(sender: UIButton) {
        if(numberInpt.text != nil && numberInpt.text != "") {
            multipleNumber = Int(numberInpt.text!)!
            currentResult = 0
            prevResult = 0
            currentMultCnt = 0
            
            hideShowObjects(true, hideScreen2: false, hideScreen3: true)
        }
        
    }
    
    @IBAction func onAddBtn(sender: UIButton){
        hideShowObjects(true, hideScreen2: true, hideScreen3: false)
        currentMultCnt+=1
        prevResult = currentResult
        currentResult = currentResult + multipleNumber
        
        if(isTaskOver()) {
            restartAdd()
        }else{
            resultLbl.text = "\(prevResult) + \(multipleNumber) = \(currentResult)"
        }
        
    }
    
    func restartAdd() {
        hideShowObjects(false, hideScreen2: true, hideScreen3: true)
        numberInpt.text = ""
    }
    
    func isTaskOver() -> Bool {
        return currentMultCnt > multipleLimit
    }
    
    func hideShowObjects(hideScreen1 : Bool, hideScreen2 : Bool, hideScreen3 : Bool) {
        
        logoImg.hidden = hideScreen1
        playBtn.hidden = hideScreen1
        numberInpt.hidden = hideScreen1
        
        pressAddLbl.hidden = hideScreen2
        addBtn.hidden = (hideScreen2 && hideScreen3)
        
        resultLbl.hidden = hideScreen3
    }
    
    
    


}

