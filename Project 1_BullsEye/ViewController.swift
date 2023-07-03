//
//  ViewController.swift
//  Project 1_BullsEye
//
//  Created by Gulazor Gulmamadova on 21/06/2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var GuessingLabel: UILabel!
    
    @IBOutlet weak var ScoreLabel: UILabel!
    
    @IBOutlet weak var RoundLabel: UILabel!
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var rulesLabel: UILabel!
    
    
    @IBOutlet weak var buttonView: UIView!
    
    //    @IBOutlet weak var greenView: UIView!
    let gameManager = GameManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print  ("Guess the number: ", gameManager.guessingNumber)
        
        //CALayer
//        greenView.layer.cornerRadius = 75
//        greenView.layer.borderWidth = 10
//        greenView.layer.borderColor = UIColor.yellow.cgColor
//        greenView.backgroundColor = UIColor.green
        
        buttonView.layer.cornerRadius = 20
        buttonView.layer.borderWidth = 7
        buttonView.layer.borderColor = UIColor.white.cgColor
//        buttonView.backgroundColor = UIColor.purple
        
        //UIView
        
       // let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        
       // let longPressTap = UILongPressGestureRecognizer(target:self, action:#selector(handleLongPressTap))
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        
        let longPressTap = UILongPressGestureRecognizer(target:self, action:#selector(handleLongPressTap))
        
        let thumbImage = UIImage(named: "Nub")
        slider.setThumbImage(thumbImage, for: .normal)
        
        buttonView.addGestureRecognizer(tapGesture)
        buttonView.addGestureRecognizer(longPressTap)
        
        rulesLabel.text = rulesLabel.text?.uppercased() //lowercased()
        updateLabels()
    }
    
    @objc func handleLongPressTap() {
        print("Long tap")
    }
    
    @objc func handleTap() {
        print("tap-нули на меня")
    }
    
    @IBAction func handleButtonTap(_ sender: Any) {
        print (slider.value)
        
        let selectedNumber = Int(slider.value)
        if  selectedNumber == gameManager.guessingNumber {
            print ("Вы угадали число")
            gameManager.score += 100 //gameManager.score = gameManager.score + 100
        } else if abs(gameManager.guessingNumber - selectedNumber) <= 10 {
            gameManager.score += 50
        }
        
        if gameManager.round < 10 {
            gameManager.nextRound()
        } else {
            let myAlert = UIAlertController(title: "Game over", message: "Заработанные очки: \(gameManager.score) Начать новую игру? ", preferredStyle: .actionSheet)
            
            let handler: ((UIAlertAction) -> Void)? = { action in
                print ("Стартуем новую игру")
                self.updateLabels()
                self.gameManager.startNewGame()
                
            }
            let action = UIAlertAction(title: "Начать", style: .default, handler: handler)
            myAlert.addAction(action)
            
            let cancelAction = UIAlertAction(title: "Закончить игру?", style: .cancel)
            myAlert.addAction(cancelAction)
            
            show(myAlert, sender: self)
        }
        
        //        gameManager.nextRound()
        updateLabels()
    }
    
    func updateLabels() {
        GuessingLabel.text = String (gameManager.guessingNumber)
        RoundLabel.text = String (gameManager.round)
    }
}


