//
//  FaqTVExt.swift
//  ShareBill
//
//  Created by Mugurel Moscaliuc on 07/11/2018.
//  Copyright © 2018 yakis. All rights reserved.
//

import UIKit



extension FaqVC: UITableViewDataSource, UITableViewDelegate {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return questions.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: FaqCell.nibName, for: indexPath) as? FaqCell {
            let question = questions[indexPath.row]
            cell.setupWith(question: question)
            return cell
        }
        return UITableViewCell()
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Need implementation to display detailed info for selected question
        let question = questions[indexPath.row]
        let answerVC = AnswerVC(nibName: AnswerVC.nibName, bundle: nil)
        self.navigationController?.pushViewController(answerVC, animated: true)
        answerVC.answer = Answer(title: question, image: "meter", content: "Energy meters are different, but the reading principle is quite the same: read the numbers from left to right, and when something is displayed differently, you stop. No matter if we are talking about a number written with red color, a dot or another dial type (for analogue meters), you just read the first set of numbers until one of the elements changes. See the examples below:")
        
    }
    
    
    
    func setupTableView() {
        let nib = UINib(nibName: FaqCell.nibName, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: FaqCell.nibName)
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    
}
