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
        answerVC.answer = Answer(title: question, image: "meter", content: "For a single rate meter simply write down the five numbers as you read them from left to right, including any zeros at the start. Here, this one says: 21138.")
        
    }
    
    
    
    func setupTableView() {
        let nib = UINib(nibName: FaqCell.nibName, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: FaqCell.nibName)
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    
}
