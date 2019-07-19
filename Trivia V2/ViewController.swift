//
//  ViewController.swift
//  Trivia V2
//
//  Created by Chicken Nugget on 2019. 07. 18..
//  Copyright © 2019. Nitin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {


    var questions = ["1.What has holes but can hold water?",
                     "2.What had three feet but no toes?",
                     "3.What is tall when its young and short when its old?",
                     "4.Who spends the day at the window, goes to the table for meals and hides at night?",
                     "5.What can an elephant make that no other animal can make?",
                     "6.I don’t have eyes, but once I did see. Once I had thoughts, but now I’m white and empty. What am I?",
                     "7.A seven letter word containing thousands of letters?",
                     "8.What word starts with the letter E ends with the letter E but only has one letter in it?",
                     "9.Rearrange the letters: NOR DO WE to make one word.",
                     "10.What crime can you get arrested for if you attempt it, but not if you commit it?",
                     "11.Not my sister nor my brother but still the child of my mother and father. Who am I?",
                     "12.What can’t be burned in a fire nor drowned in water?",
                     "13.What stays where it is when it goes off?",
                     "14.I have cities, but no houses. I have mountains, but no trees. I have water, but no fish. What am I?",
                     "15.What English word has three consecutive double letters?",
                     "16.I come from a mine and get surrounded by wood always. Everyone uses me. What am I?",
                     "17.What disappears as soon as you say its name?,",
                     "18.I have keys, but no locks and space, and no rooms. You can enter, but you can’t go outside. What am I?",
                     "19.Which word in the dictionary is always spelled incorrectly?",
                     "20.The more you take, the more you leave behind. What am I?",
                     "21.What word looks the same upside down and backwards?",
                     "22.Give me food, and I will live. Give me water, and I will die. What am I?",
                     "23.]
    var currQn = 0
    var answers = ["Sponge", "Yardstick", "Candle", "Fly", "Baby Elephant", "Skull", "Mailbox", "Envelope", "One Word", "Suicide", "Myself", "Ice", "Alarm Clock", "Map", "Bookkeeper", "Pencil Lead", "Silence", "Keyboard", "Incorectly", "Fingerprints", "Swims", "Fire",]
    var score = 0
    var reset = false
    
    @IBOutlet weak var userAnswerTextField: UITextField!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var validationLabel: UILabel!
    @IBOutlet weak var endOfGameMessageLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var showAnswerSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        questionLabel.text = questions[currQn]
    }
    
    func processAnswer(){
        if(reset == true)
        {
            nextButton.setTitle("Check", for: .normal)
            userAnswerTextField.text = ""
            validationLabel.text = ""
            endOfGameMessageLabel.text = ""
            questionLabel.text = ""
            score = 0
            currQn = 0
            questionLabel.text = questions[currQn]
            reset = false
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
            if (showAnswerSwitch.isOn)
            {
                validationLabel.text = "Incorrect. The correct answer is \(correctAnswer)"
            }
            else
            {
                validationLabel.text = "Incorrect."
            }
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
    
    @IBAction func textFieldEnterPress(_ sender: Any) {
        processAnswer()
    }
    @IBAction func checkButtonClick(_ sender: Any) {
        processAnswer()
}
}
