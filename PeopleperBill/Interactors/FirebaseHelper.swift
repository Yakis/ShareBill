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
    let db = Firestore.firestore()
    
    
    
    private init(){}
    
    
    func getAnswers(completion: @escaping ([Answer]) ->()) {
        var answers = [Answer]()
        db.collection("answers").getDocuments { (snap, error) in
            if let error = error {
                print("Error getting documents: \(error.localizedDescription)")
            } else {
                for answer in snap!.documents {
                    print("\(answer.documentID) => \(answer.data())")
                    let title = answer.data()["title"] as! String
                    let image = answer.data()["image"] as! String
                    let content = answer.data()["content"] as! String
                    let newAnswer = Answer(title: title, image: image, content: content)
                    answers.append(newAnswer)
                }
                completion(answers)
            }
        }
    }
    
    
}
