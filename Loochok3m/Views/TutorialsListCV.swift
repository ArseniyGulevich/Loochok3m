//  Created by Арсений Гулевич  on 19.03.2024.
//

import SwiftUI

struct TutorialsListCV: View {
    
    @State var games = [Game]()
//    @State var posts = []
    @State var searchText: String = ""
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 16) {
                    VStack(spacing: 16) {
                        Image("TutorialsBanner")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 315)
                            .padding(.top, 20)
                        VStack(spacing: 6) {
                            HeadingCV(text: "Чему научимся?")
                            SearchBarCV(bindingText: searchText, barText: "Поиск по туториалам", type: .withFilers)
                        }
                        
                    }
                    .padding(.horizontal, 20)
                    
                    ForEach(games) { game in
                        NavigationLink(destination: TutorialCV(item: game)) {
                            CardCV(game: game, type: .tutorial)
                        }
                        .background(.white)
                        .frame(width: 361)
                        .cornerRadius(28)
                        .shadow(color: .black.opacity(0.16), radius: 4, x: 0, y: 3)
                        .padding(.horizontal, 20)
                    }
                }
            }
            .background(
                Gradient(colors: [Color.white, Colors.gray.opacity(0.1)])
    
            )
//            .navigationTitle("Туториалы")
            .onAppear() {
                Api().loadData(url: "https://www.cheapshark.com/api/1.0/deals?storeID=1&upperPrice=15") { games in
                    self.games = games
                }
            }
//            .onAppear() {
//                Api().loadData(url: "http://localhost:3000/tutorial_posts") { games in
//                    self.games = games
//                }
//            }
        }
    }
}
