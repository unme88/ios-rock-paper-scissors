//
//  RockPaperScissors - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

var isFirst : Bool = true
var randomNumberOfComputer : Int = 0

/// 사용자가 이겼으면 1을 반환한다.
/// 사용자가 졌으면 -1을 반환한다.
/// 비겼으면 0을 반환한다.
func checkGameResult(userNumber : Int, computerNumber : Int) -> Int {

    if userNumber == computerNumber {
        return 0
    } else if (userNumber == 1 && computerNumber == 3) || (userNumber == 2 && computerNumber == 1) && (userNumber == 3 && computerNumber == 2) {
        return 1
    } else {
        return -1
    }
    
}

func startGame() {
    while true {
        
        if isFirst {
            randomNumberOfComputer = Int.random(in: 1...3)
            isFirst = false
        }
        
        print("가위(1). 바위(2). 보(3)! <종료 : 0> : ", terminator: "")
    
        let userInput : Int? = Int(readLine()!)
    
        guard let userInputIsInt = userInput else {
            print("잘못된 입력입니다. 다시 시도해주세요.")
            continue
        }
        
        if userInputIsInt == 0 {
            print("게임 종료")
            return
        } else if userInputIsInt < 1 || userInputIsInt > 3 {
            print("잘못된 입력입니다. 다시 시도해주세요.")
            continue
        }
        
        let gameResultNumber : Int = checkGameResult(userNumber: userInputIsInt, computerNumber: randomNumberOfComputer)
        
        if gameResultNumber == 1 {
            print("이겼습니다!")
        } else if gameResultNumber == 0 {
            print("비겼습니다!")
        } else {
            print("졌습니다!")
        }
    
        isFirst = true
    }
}

startGame()
