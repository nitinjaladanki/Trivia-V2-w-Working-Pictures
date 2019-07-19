//
//  ViewController.swift
//  Trivia V2
//
//  Created by Chicken Nugget on 2019. 07. 18..
//  Copyright © 2019. Nitin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {


    var questions = ["What has holes but can hold water?",
                     "What had three feet but no toes?",
                     "What is tall when its young and short when its old?",
                     "Who spends the day at the window, goes to the table for meals and hides at night?",
                     "What can an elephant make that no other animal can make?",
                     "I don’t have eyes, but once I did see. Once I had thoughts, but now I’m white and empty. What am I?",
                     "A seven letter word containing thousands of letters?",
                     "What word starts with the letter E ends with the letter E but only has one letter in it?",
                     "Rearrange the letters: NOR DO WE to make one word.",
                     "What crime can you get arrested for if you attempt it, but not if you commit it?",
                     "Not my sister nor my brother but still the child of my mother and father. Who am I?",
                     "What can’t be burned in a fire nor drowned in water?",
                     "What stays where it is when it goes off?"]
    var currQn = 0
    var answers = ["Sponge", "Yardstick", "Candle", "Fly", "Baby Elephant", "Skull", "Mailbox", "Envelope", "One Word", "Suicide", "Myself", "Ice", "Alarm Clock"]
    var score = 0
    var reset = false
    
    @IBOutlet weak var userAnswerTextField: UITextField!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var validationLabel: UILabel!
    @IBOutlet weak var endOfGameMessageLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var nextButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        questionLabel.text = questions[currQn]
    }
    
    @IBAction func checkButtonClick(_ sender: Any) {
        
        if(reset == true)
        {
            nextButton.setTitle("Check", for: .normal)
            userAnswerTextField.text = ""
            validationLabel.text = ""
            endOfGameMessageLabel.text = ""
            questionLabel.text = ""
            score = 0
            currQn = 0
            return
            
        }
        if(userAnswerTextField.text == "")
        {
            validationLabel.text = "Please enter an answer."
            return
        }
        let userAnswer = userAnswerTextField.text
        let correctAnswer = answers[currQn]
        
        if(userAnswer!.caseInsensitiveCompare(correctAnswer)) == .orderedSame
        {
            validationLabel.text = "Correct."
            score += 1
        }
        else
        {
            validationLabel.text = "Incorrect. The correct answer is \(correctAnswer)"
        }
        
        currQn += 1
        if (currQn >= questions.count)
        {
            if(score > questions.count/2)
            {
                endOfGameMessageLabel.text = "Congrats you have finished the game!\nClick restart to replay"
            }
            else
            {
                endOfGameMessageLabel.text = "Better luck next time.\n Click restart to replay"
            }
            nextButton.setTitle("Restart", for: .normal)
            reset = true
        }  else {
            questionLabel.text = questions[currQn]
        }
        userAnswerTextField.text = ""
        scoreLabel.text = "Score: \(String(score))/13"
        
    }
}

