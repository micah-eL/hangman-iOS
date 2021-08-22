import SwiftUI

struct MainGameView: View {
    var currImgArray = ["Start", "OneWrong", "TwoWrong", "ThreeWrong", "FourWrong", "FiveWrong", "GameOver", "Win"]
    @State var wordToGuess = [String]()
    @State var currImg = ""
    @State var wordLength = 0
    @State var guessedWord = Array(repeating: "_", count: 3)
    @State var guessedWordStringToDisplay = ""
    @State var wrongGuesses = 0
    @State var correctGuesses = 0
    @State var guessedLetter = ""
    @State var letterMatch = false
    
    var body: some View {
            VStack {
                Button("Confirm player 2", action: {
                    guessedWord = Array(repeating: "_", count: wordLength)
                    guessedWordStringToDisplay = guessedWord.joined(separator: " ")
                    currImg = "Start"
                })
                
                Spacer()
                
                Image(currImg)
                    .resizable()
                    .scaledToFit()
                
                Spacer()
                
                Text(guessedWordStringToDisplay)
                
                Spacer()
            
                Text("You have \(6 - wrongGuesses) guesses remaining!")
                    .padding()
                
                TextField("Enter a letter", text: $guessedLetter)
                    .padding()
                    .frame(width: 350.0, height: 50.0)
                    .border(Color.blue)
                
                Button("Guess", action: {
                    letterMatch = false
                    
                    for (index, letter) in wordToGuess.enumerated() {
                        if (guessedLetter.lowercased() == letter || guessedLetter.uppercased() == letter) {
                            correctGuesses+=1
                            if (correctGuesses == wordLength) {
                                currImg = "Win"
                            }
                            guessedWord[index] = letter
                            guessedWordStringToDisplay = guessedWord.joined(separator: " ")
                            letterMatch = true
                        }
                    }
                    
                    if (letterMatch == false) {
                        if (wrongGuesses < 6){
                            wrongGuesses+=1
                            currImg = currImgArray[wrongGuesses]
                        }
                    }
                })
                .padding()
                
        }
    }
}
