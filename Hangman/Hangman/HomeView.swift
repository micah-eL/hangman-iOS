import SwiftUI

struct HomeView: View {
    @State var wordToGuessUserInput = ""
    @State var wordToGuessUserInputArray = [String]()
    @State var wordLength = 0
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                
                Text("Enter and confirm a word then pass the phone to your friend!")
                    .padding()
                
                TextField("Enter a word", text: $wordToGuessUserInput)
                    .padding()
                    .frame(width: 350.0, height: 50.0)
                    .border(Color.blue)
                
                Button("Confirm word", action: {
                    wordToGuessUserInputArray = Array(wordToGuessUserInput).map {String($0)}
                    wordLength = wordToGuessUserInputArray.count
                })
                .padding()
                
                Spacer()
                
                NavigationLink(
                    destination: MainGameView(wordToGuess: wordToGuessUserInputArray, wordLength: wordLength),
                    label: {
                        Text("Start game")
                    })
                
                Spacer()
            }
            .navigationBarTitle("Home")
        }
    }
}
