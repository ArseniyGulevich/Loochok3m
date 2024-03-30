//  Created by Арсений Гулевич  on 19.03.2024.
//

import SwiftUI

struct HomePageCV: View {
    
    @State var games = [Game]()
    @State var searchText: String = ""
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 16) {
                    SearchBarCV(bindingText: searchText, barText: "Туториал, подборка, идея...", type: .withFilers)
                        .padding(.top, 32)
                    
                    ImageCV(image: "A_MainPageBanner_Ios", width: 358, height: 314)
                    
                    VStack {
                        HeadingCV(text: "Подборки")
                        ScrollView(.horizontal) {
                            HStack(alignment: .top) {
                                SelectionCardCV(text: "Эко", image: "M_CollectionCard-3")
                                SelectionCardCV(text: "Шитьё", image: "M_CollectionCard-2")
                                SelectionCardCV(text: "Профи", image: "M_CollectionCard-0")
                                SelectionCardCV(text: "Лёгкие", image: "M_CollectionCard-1")
                            }
                        }
                        .scrollIndicators(.hidden)
                    }
                    
                    VStack {
                        HeadingCV(text: "Какой-то ещё раздел")
                        VStack {
                            // Карточки туториалов и подборок?
                        }
                    }
                    
                    VStack {
                        HeadingCV(text: "Новое")
                        VStack {
                            // Карточки туториалов и подборок?
                        }
                    }
                }
                .padding(.horizontal, 16)
            }
            .background(
                Gradient(colors: [Color.white, Colors.gray.opacity(0.1)])
    
            )
            .onAppear() {
                Api().loadData(url: "https://www.cheapshark.com/api/1.0/deals?storeID=1&upperPrice=15") { games in
                    self.games = games
                }
            }
        }
    }
}

struct ExploreCV_Previews: PreviewProvider {
    static var previews: some View {
        HomePageCV()
    }
}
