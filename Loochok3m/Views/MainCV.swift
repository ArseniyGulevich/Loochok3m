//  Created by Арсений Гулевич  on 19.03.2024.
//

import SwiftUI

enum Tab: String, CaseIterable {
    case home
    case tutorials
    case add
    case ideas
    case profile
}

struct MainCV: View {
//    @Binding var selectedTab: Tab
//    private var activeImage: String {
//        selectedTab.rawValue + "Active"
//    }
    
    var body: some View {
        TabView {
            Group {
                HomePageCV()
                    .tabItem {
                        Label("Главная", image: "home")
                    }
                TutorialsListCV()
                    .tabItem {
                        Label("Туториалы", image: "tutorials")
                    }
                AddCV()
                    .tabItem {
                        Label("Добавить", image: "add")
                    }
                IdeasListCV()
                    .tabItem {
                        Label("Идеи", image: "ideas")
                    }
                ProfileCV()
                    .tabItem {
                        Label("Профиль", image: "profile")
                    }
            }
            .toolbar(.visible, for: .tabBar)
            .toolbarBackground(Colors.Icon.primary, for: .tabBar)
        }
        .tint(.yellow)
    }
}

struct MainCV_Previews: PreviewProvider {
    static var previews: some View {
        MainCV()
    }
}
