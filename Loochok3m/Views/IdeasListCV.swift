//  Created by Арсений Гулевич  on 09.03.2024.
//

import SwiftUI

struct IdeasListCV: View {
    
    @State var games = [Game]()
    @State var searchText: String = ""
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 16) {
                    VStack(spacing: 16) {
                        Image("IdeasBanner")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 315)
                            .padding(.top, 20)
                        VStack(spacing: 6) {
//                            ZStack(alignment: .leading) {
//                                Colors.Icon.primary
//                                Text("Что посмотрим?".uppercased())
//                                    .font(Constants.title1M)
//                                    .foregroundColor(Colors.Typography.inverse)
//                                    .padding(8)
//                            }
                            HeadingCV(text: "Что посмотрим?")
                            SearchBarCV(bindingText: searchText, barText: "Поиск по идеям", type: .full)
                        }
                        
                    }
                    .padding(.horizontal, 20)
                    
                    ForEach(games) { game in
                        NavigationLink(destination: IdeaCV(item: game)) {
                            CardCV(game: game, type: .idea)
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
//            .navigationTitle("")
            .onAppear() {
                Api().loadData(url: "https://www.cheapshark.com/api/1.0/deals?storeID=1&upperPrice=15") { games in
                    self.games = games
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        IdeasListCV()
    }
}
