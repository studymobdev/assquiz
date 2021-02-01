//
//  ResultViewController.swift
//  ass2
//
//  Created by Мас on 30.01.2021.
//
import UIKit
class ResultViewController: UIViewController {
    @IBOutlet weak var resultL: UILabel!
    @IBOutlet weak var titleL: UILabel!
    var totalScore = 0
    var totalQuestions = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        var quizResult = Double(totalScore) / Double(totalQuestions)
        quizResult *= 100
        resultL.text = "\(quizResult)%"
        if(quizResult < 50) {
            titleL.text = "Bad"
        } else if(quizResult < 70) {
            titleL.text = "Not bad"
        } else if(quizResult < 90){
            titleL.text = "Good"
        } else if(quizResult == 100){
            titleL.text = "Excellent"
        }
    }
    
    @IBAction func tryagain(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(identifier: "QuizVC") as! QuizViewController
        navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func homePage(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
    }
}
