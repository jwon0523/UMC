//
//  DiceModel.swift
//  Dice_3st
//
//  Created by jaewon Lee on 10/10/24.
//

import Foundation

struct DiceModel {
  let diceImage: String
  let diceName: String
}

final class dummyDiceModel {
  static let diceDatas: [DiceModel] = [
    DiceModel(diceImage: "Dice01", diceName: "주사위 1"),
    DiceModel(diceImage: "Dice02", diceName: "주사위 2"),
    DiceModel(diceImage: "Dice03", diceName: "주사위 3"),
    DiceModel(diceImage: "Dice04", diceName: "주사위 4"),
    DiceModel(diceImage: "Dice05", diceName: "주사위 5"),
    DiceModel(diceImage: "Dice06", diceName: "주사위 6")
  ]
}
