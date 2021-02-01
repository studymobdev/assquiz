//
//  ViewController.swift
//  ass2
//
//  Created by Мас on 30.01.2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBAction func start(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(identifier: "QuizVC") as! QuizViewController
        navigationController?.pushViewController(vc, animated: true)
    }

    @IBAction func history(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(identifier: "History") as! HistoryViewController
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}


