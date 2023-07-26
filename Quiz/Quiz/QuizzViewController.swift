//
//  QuizzViewController.swift
//  Quiz
//
//  Created by Banut Raul on 08.07.2023.
//

import UIKit

class QuizzViewController: UIViewController {
    
    @IBOutlet var questionLabel: UILabel!
    @IBOutlet var answerLabel: UILabel!
    
    let questions = [
        "What is the capital of Romania?",
        "Where is Cluj-Napoca located?",
        "What is 7+7?"
    ]
    
    let answers = [
        "Bucharest",
        "Transylvania",
        "14"
    ]
    
    var currentQuestionIndex = 0
    
    @IBAction func showNextQuestion(_ sender: UIButton) {
        currentQuestionIndex += 1
        
        if currentQuestionIndex == questions.count {
            currentQuestionIndex = 0
        }
        
        let question = questions[currentQuestionIndex]
        questionLabel.text = question
        answerLabel.text = "???"
    }
    
    @IBAction func showAnswer(_ sender: UIButton) {
        let answer = answers[currentQuestionIndex]
        answerLabel.text = answer
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        questionLabel.text = questions[currentQuestionIndex]
    }
}

