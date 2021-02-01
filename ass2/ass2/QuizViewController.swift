//
//  QuizViewController.swift
//  ass2
//
//  Created by Мас on 30.01.2021.
//

import UIKit

protocol ScoreDelegate: class {
    func passScore(newScore: String, newAttempt: String)
}

class QuizViewController: UIViewController {

    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var answer1: UIButton!
    @IBOutlet weak var answer2: UIButton!
    @IBOutlet weak var answer3: UIButton!
    @IBOutlet weak var answer4: UIButton!
    @IBOutlet weak var prevB: UIButton!
    @IBOutlet weak var nextB: UIButton!
    
    var currentQuestion: Question?
    var currentQuestionPosition = 0
    var score = 0
   
    var delegate: ScoreDelegate?
    
    var questions: [Question] = [
        Question(question: "How are you?", answers: ["OK", "VERY GOOD", "GOOD", "BAD"], correctAnswer: 1, isAnswered: false),
        Question(question: "20*20", answers: ["400", "100", "250", "760"], correctAnswer: 0, isAnswered: false),
        Question(question: "4+4", answers: ["4", "5", "8", "formula"], correctAnswer: 2, isAnswered: false),
        Question(question: "4:4", answers: ["16", "23", "1", "formula"], correctAnswer: 2, isAnswered: false),
        Question(question: "3*9", answers: ["18", "8", "5", "27"], correctAnswer: 3, isAnswered: false)
        
     ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currentQuestion = questions[0]
        setQuestion()
    }
    
    @IBAction func ansWer1(_ sender: UIButton) {
        checkAnswer(i: 0, sender)
    }
    @IBAction func ansWer2(_ sender: UIButton) {
        checkAnswer(i: 1, sender)
    }
    @IBAction func ansWer3(_ sender: UIButton) {
        checkAnswer(i: 2, sender)
    }
    @IBAction func ansWer4(_ sender: UIButton) {
        checkAnswer(i: 3, sender)
    }
    
    var attempt: Int = 1
    
    
    @IBAction func nextQ(_ sender: Any) {
        if(currentQuestionPosition + 1 < questions.count) {
            currentQuestionPosition += 1
            currentQuestion = questions[currentQuestionPosition]
            setQuestion()
        } else {
            performSegue(withIdentifier: "quizResult", sender: nil)
            
            delegate?.passScore(newScore: "\(score)", newAttempt: "\(attempt) attempt")
            dismiss(animated: true, completion: nil)
            attempt += 1
        }
    }
    
    @IBAction func prevQ(_ sender: Any) {
        if(currentQuestionPosition + 1 == 1) {
            prevB.isHidden = true
            prevB.isEnabled = false
        } else {
            prevB.isHidden = false
            prevB.isEnabled = true
            currentQuestionPosition -= 1
            currentQuestion = questions[currentQuestionPosition]
            setQuestion()
        }
    }
    

    
    
    func checkAnswer(i: Int, _ sender: UIButton) {
        if(i == currentQuestion!.correctAnswer) {
            score += 1
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
        answer1.isEnabled = false
        answer2.isEnabled = false
        answer3.isEnabled = false
        answer4.isEnabled = false
        questions[currentQuestionPosition].isAnswered = true
    }
    
    func setQuestion() {
        if(currentQuestionPosition + 1 == 1) {
            prevB.isHidden = true
            prevB.isEnabled = false
        } else {
            prevB.isHidden = false
            prevB.isEnabled = true
        }
       
        questionLabel.text = currentQuestion!.question
        answer1.setTitle(currentQuestion!.answers[0], for: .normal)
        answer1.backgroundColor = UIColor.opaqueSeparator
        
        answer2.setTitle(currentQuestion!.answers[1], for: .normal)
        answer2.backgroundColor = UIColor.opaqueSeparator
        
        answer3.setTitle(currentQuestion!.answers[2], for: .normal)
        answer3.backgroundColor = UIColor.opaqueSeparator
        
        answer4.setTitle(currentQuestion!.answers[3], for: .normal)
        answer4.backgroundColor = UIColor.opaqueSeparator
        
        if(currentQuestion?.isAnswered == true) {
            answer1.isEnabled = false
            answer2.isEnabled = false
            answer3.isEnabled = false
            answer4.isEnabled = false
        } else {
            answer1.isEnabled = true
            answer2.isEnabled = true
            answer3.isEnabled = true
            answer4.isEnabled = true
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "quizResult") {
            let vc = segue.destination as! ResultViewController
            vc.totalScore = score
            vc.totalQuestions = questions.count
        }
    }
   
}







