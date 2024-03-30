import SwiftUI

struct StartScreenCV: View {
    @State private var navigationState: NavigationState = .Auth
    @State private var errorState: ErrorState = .None
    
    var body: some View {
        VStack {
            switch navigationState {
            case .Auth:
                AuthScreen(navigationState: $navigationState.animation(), errorState: $errorState.animation())
            case .Main:
                MainScreenCV(navigationState: $navigationState.animation(), errorState: $errorState)
            }
            
        }
        .overlay(
            ErrorView(errorState: $errorState)
        )
    }
}
