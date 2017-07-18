//
//  HighScoreViewModel.swift
//  Jeopardy
//
//  Created by Young Tech on 7/18/17.
//  Copyright © 2017 Microsoft. All rights reserved.
//

import Foundation

struct HighScoreViewModel{
    let name: String
    let score: Int
    
    init(name: String, score: Int){
        self.name = name
        self.score = score
    }
}
