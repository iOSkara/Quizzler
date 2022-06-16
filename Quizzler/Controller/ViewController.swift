//
//  ViewController.swift
//  Quizzler
//
//  Created by Mac on 14.06.2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var choiceOneButton: UIButton!
    @IBOutlet weak var choiceTwoButton: UIButton!
    @IBOutlet weak var choiceThreeButton: UIButton!
    @IBOutlet weak var scoreLabel: UILabel!
    
    var quizBrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // round the corners of progressBar
        progressBar.layer.cornerRadius = 5
        progressBar.clipsToBounds = true
        progressBar.layer.sublayers![1].cornerRadius = 5
        progressBar.subviews[1].clipsToBounds = true
        
        updateUI()
    }
    
    @IBAction func answerButtonSelected(_ sender: UIButton) {
        
        let userAnswer = (sender.titleLabel?.text!)! // True or Flase
        let userGotItRight = quizBrain.checkAnswer(userAnswer)
        
        if userGotItRight {
            sender.tintColor = UIColor.green
        } else {
            sender.tintColor = UIColor.red
        }
        

        quizBrain.nextQuestion()
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
        
        
    }
    
    @objc func updateUI() {
        questionLabel.text = quizBrain.getQuestionText()
        progressBar.progress = quizBrain.getProgress()
        scoreLabel.text = "Score: \(quizBrain.getScore())"
        choiceOneButton.setTitle(quizBrain.getChoices(0), for: .normal)
        choiceTwoButton.setTitle(quizBrain.getChoices(1), for: .normal)
        choiceThreeButton.setTitle(quizBrain.getChoices(2), for: .normal)
        choiceOneButton.tintColor = UIColor.clear
        choiceTwoButton.tintColor = UIColor.clear
        choiceThreeButton.tintColor = UIColor.clear
    }
    
    
    
}

