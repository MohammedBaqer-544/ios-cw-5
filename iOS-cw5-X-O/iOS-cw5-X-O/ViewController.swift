//
//  ViewController.swift
//  iOS-cw5-X-O
//
//  Created by moahammed on 6/27/20.
//  Copyright © 2020 Almousawi2002. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var turnLable: UILabel!
    
    @IBOutlet weak var b1: UIButton!
    @IBOutlet weak var b2: UIButton!
    @IBOutlet weak var b3: UIButton!
    @IBOutlet weak var b4: UIButton!
    @IBOutlet weak var b5: UIButton!
    @IBOutlet weak var b6: UIButton!
    @IBOutlet weak var b7: UIButton!
    @IBOutlet weak var b8: UIButton!
    @IBOutlet weak var b9: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    var counter = 0
    @IBAction func press(_ sender: UIButton) {
        
        if counter % 2 == 0 {
            sender.setTitle("X", for: .normal)
            sender.setTitleColor(.green, for: .normal)
            turnLable.text = "O Turn"
        }
        else {
            sender.setTitle("O", for: .normal)
            sender.setTitleColor(.red, for: .normal)
            turnLable.text = "X Turn"
        }
        counter += 1
        sender.isEnabled = false
        
        if winning(winner: "X") {
            okAlert(title: "X Wins!", message: "مبرووووك X 😍")
        }
        else if winning(winner: "O") {
            okAlert(title: "O Wins!", message: "مبرووووك O 😍")
        }
        else if counter == 9 {
            okAlert(title: "Draw!", message: "reset the game!")
        }
        
    }
    
    
    func winning(winner: String) -> Bool
    {
        
        let f1 = b1.titleLabel?.text
        let f2 = b2.titleLabel?.text
        let f3 = b3.titleLabel?.text
        let f4 = b4.titleLabel?.text
        let f5 = b5.titleLabel?.text
        let f6 = b6.titleLabel?.text
        let f7 = b7.titleLabel?.text
        let f8 = b8.titleLabel?.text
        let f9 = b9.titleLabel?.text
        
        let r1 = (f1, f2 , f3) == (winner, winner, winner)
        let r2 = (f4, f5 , f6) == (winner, winner, winner)
        let r3 = (f7, f8 , f9) == (winner, winner, winner)
        let c1 = (f1, f4 , f7) == (winner, winner, winner)
        let c2 = (f2, f5 , f8) == (winner, winner, winner)
        let c3 = (f3, f6 , f9) == (winner, winner, winner)
        let d1 = (f1, f5 , f9) == (winner, winner, winner)
        let d2 = (f3, f5 , f7) == (winner, winner, winner)
        
        if r1 || r2 || r3 || c1 || c2 || c3 || d1 || d2 {
            return true
        }
        else {
            return false
        }
    }
    
    
    @IBAction func reset(_ sender: Any) {
        b1.titleLabel?.text = ""
        b2.titleLabel?.text = ""
        b3.titleLabel?.text = ""
        b4.titleLabel?.text = ""
        b5.titleLabel?.text = ""
        b6.titleLabel?.text = ""
        b7.titleLabel?.text = ""
        b8.titleLabel?.text = ""
        b9.titleLabel?.text = ""
        
        b1.setTitle("", for: .normal)
        b2.setTitle("", for: .normal)
        b3.setTitle("", for: .normal)
        b4.setTitle("", for: .normal)
        b5.setTitle("", for: .normal)
        b6.setTitle("", for: .normal)
        b7.setTitle("", for: .normal)
        b8.setTitle("", for: .normal)
        b9.setTitle("", for: .normal)
        
        b1.isEnabled = true
        b2.isEnabled = true
        b3.isEnabled = true
        b4.isEnabled = true
        b5.isEnabled = true
        b6.isEnabled = true
        b7.isEnabled = true
        b8.isEnabled = true
        b9.isEnabled = true
        
        counter = 0
        
    }
    func okAlert(title: String, message: String)
    {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .cancel)
        alertController.addAction(okAction)
        present(alertController, animated: true)
    }
}

