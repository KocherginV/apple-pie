//
//  ViewController.swift
//  ApplePie
//
//  Created by Volodymyr Kochergin on 11.12.20.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var treeImageView: UIImageView!
    @IBOutlet var correctWordLabel: UILabel!
    @IBOutlet var scoreLabel: UILabel!
    @IBOutlet var letterButtons: [UIButton]!
    
    @IBAction func letterButtonPressed(_ sender: UIButton) {
        sender.isEnabled = false
        let letterString = sender.title(for: .normal)!
        let letter = Character(letterString.lowercased())
        currentGame.playerGuessed(letter: letter)
        updateGameState()
    }
    
    var listOfWords = ["buccaneer", "glorious", "swift", "incadescent", "program"]
    let incorrectMovesAllowed = 7
    
    
    var totalWins = 0 {
        didSet {
            newRound()
        }
    }
    var totalLosses = 0 {
        didSet {
            newRound()
        }
    }
    var totalPoints = 0
    
    var currentGame: Game!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        newRound()
    }
    
    func newRound() {
        if !listOfWords.isEmpty {
            let newWord = listOfWords.removeFirst()
            currentGame = Game(word: newWord, incorrectMovesRemaining: incorrectMovesAllowed, guessedLetters: [])
            enableLetterButtons(true)
            updateUI()
        } else {
            enableLetterButtons(false)
        }
    }
    
    func updateUI() {
        let letters = currentGame.formattedWord.map { String($0) }
        let wordsWithSpacing = letters.joined(separator: " ")
        correctWordLabel.text = wordsWithSpacing
        scoreLabel.text = "Wins: \(totalWins), Losses: \(totalLosses), Points: \(totalPoints)"
        treeImageView.image = UIImage(named: "Tree \(currentGame.incorrectMovesRemaining)")
        treeImageView.accessibilityIdentifier = "tree_\(currentGame.incorrectMovesRemaining)_id"
    }
    
    func updateGameState() {
        if currentGame.incorrectMovesRemaining == 0 {
            totalLosses += 1
        } else if currentGame.word == currentGame.formattedWord {
            totalWins += 1
            totalPoints += 1
            updateUI()
        } else {
            updateUI()
        }
    }
    
    func enableLetterButtons(_ enable: Bool) {
        for button in letterButtons {
            button.isEnabled = enable
        }
    }
    
}

