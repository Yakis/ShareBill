//
//  AnswerTVExt.swift
//  ShareBill
//
//  Created by Mugurel Moscaliuc on 07/11/2018.
//  Copyright © 2018 yakis. All rights reserved.
//

import UIKit



extension AnswerVC: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let answerTitleCell = tableView.dequeueReusableCell(withIdentifier: AnswerTitleCell.nibName) as! AnswerTitleCell
        let answerImageCell = tableView.dequeueReusableCell(withIdentifier: AnswerImageCell.nibName) as! AnswerImageCell
        let answerContentCell = tableView.dequeueReusableCell(withIdentifier: AnswerContentCell.nibName) as! AnswerContentCell
        switch indexPath.row {
        case 0:
            answerTitleCell.setupWith(title: answer!.title)
            return answerTitleCell
        case 1:
            answerContentCell.setupWith(content: answer!.content)
            return answerContentCell
        case 2:
            answerImageCell.setupWith(image: answer!.image)
            return answerImageCell
        default:
            return UITableViewCell()
        }
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 2:
            return UIScreen.main.bounds.width
        default:
            return UITableView.automaticDimension
        }
    }
    
    
    
    func setupTableView() {
        let titleNib = UINib(nibName: AnswerTitleCell.nibName, bundle: nil)
        tableView.register(titleNib, forCellReuseIdentifier: AnswerTitleCell.nibName)
        let imageNib = UINib(nibName: AnswerImageCell.nibName, bundle: nil)
        tableView.register(imageNib, forCellReuseIdentifier: AnswerImageCell.nibName)
        let contentNib = UINib(nibName: AnswerContentCell.nibName, bundle: nil)
        tableView.register(contentNib, forCellReuseIdentifier: AnswerContentCell.nibName)
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    
}
