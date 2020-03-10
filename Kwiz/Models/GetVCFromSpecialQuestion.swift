//
//  GetVCFromSpecialQuestion.swift
//  Kwiz
//
//  Created by Angela Garrovillas on 2/28/20.
//  Copyright © 2020 2Legit2Quit. All rights reserved.
//

import UIKit

func getVCFromSpecial(question: SpecialQuestion?) -> UIViewController {
    switch question {
    case is Advertisement:
        return PreAdvertiseVC()
    case is Tickle:
        return TickleQuestionVC()
    case is Scale:
        return ScaleVC()
    case is Lock:
        return LockVC()
    case is MovingImage:
        return MovingImageVC()
    case .none:
        return ResultsVC()
    default:
        return ResultsVC()
    }
}

func useNextTypeToCallVC(nextType: NextTypeOfQuestion) -> UIViewController {
    switch nextType {
    case .firstMC:
        return MultipleChoiceVC()
    case .secondMC:
        return MultipleChoiceVC()
    case .special:
        let sq = Game.shared.getCurrentSpecialQuestion()
        return getVCFromSpecial(question: sq)
    }
}
