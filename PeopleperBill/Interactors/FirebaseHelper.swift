//
//  FirebaseHelper.swift
//  PeopleperBill
//
//  Created by Mugurel Moscaliuc on 27/11/2018.
//  Copyright © 2018 yakis. All rights reserved.
//

import Foundation
import Firebase


class FirebaseHelper {
    
    static let shared = FirebaseHelper()
    var ref: DatabaseReference!
    
    
    
    private init(){}
    
    
    func getAnswers(completion: @escaping ([Answer]) ->()) {
        var answers = [Answer]()
        
        ref = Database.database().reference()
        ref.child("answers").observe(.childAdded) { (snap) in
            let value = snap.value as? NSDictionary
            let title = value!["title"] as! String
            let image = value!["image"] as! String
            let content = value!["content"] as! String
            let newAnswer = Answer(title: title, image: image, content: content)
            answers.append(newAnswer)
            completion(answers)
        }
    }
    
    
}
