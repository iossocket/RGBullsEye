import Foundation
import Combine

class BullsEyeGame: ObservableObject {

    let objectWillChange = PassthroughSubject<Void, Never>()

    var round = 0
    var startValue = 50
    var targetValue = 50
    var scoreRound = 0
    var scoreTotal = 0
  
    init() {
        startNewGame()
    }
  
    func startNewGame() {
        round = 0
        scoreTotal = 0
        startNewRound()
    }
  
    func startNewRound() {
        round += 1
        scoreRound = 0
        startValue = 50
        targetValue = Int.random(in: 1...100)
        objectWillChange.send()
    }
  
    func checkGuess(_ guess: Int) {
        let difference = abs(targetValue - guess)
        scoreRound = 100 - difference
        scoreTotal = scoreTotal + scoreRound
        objectWillChange.send()
    }
}
