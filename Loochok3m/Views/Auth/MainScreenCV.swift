import SwiftUI

struct MainScreenCV: View {
    @Binding var navigationState: NavigationState
    @Binding var errorState: ErrorState
    
    var body: some View {
        VStack {
            DataV(errorState: $errorState.animation())
            Text("Authorized user screen. Press to logout").onTapGesture {
                self.navigationState = .Auth
                UserDefaults.standard.setValue("", forKey: "token")
            }
        }
    }
}
