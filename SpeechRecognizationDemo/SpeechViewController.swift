//
//  ViewController.swift
//  SpeechRecognizationDemo
//
//  Created by Vikash Kumar on 26/06/17.
//  Copyright © 2017 Vikash Kumar. All rights reserved.
//

import UIKit
import Speech

class SpeechViewController: UIViewController {


    @IBOutlet weak var lblResult: UILabel!
    @IBOutlet weak var speechView: SpeechView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        speechView.requestSpeechAuthorization()
        setSpeechViewBlocks()
    }
    
    func setSpeechViewBlocks() {
        speechView.resultBlock = {[unowned self] str in
         self.lblResult.text = str
        }
        
        speechView.errorBlock = {error in
           print(error.localizedDescription)
        }
    }
}


extension SpeechViewController {
    ///func for recognize live speech. Just tap on Start button and speek, you would see your words as text.
    func showAlert(message: String) {
        let alert = UIAlertController(title: "Speech Recognizer Error", message: message, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }

}

