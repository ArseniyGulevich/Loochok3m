import SwiftUI

struct StartOnboardingS: View {
    @State private var onboardingDone = UserDefaults.standard.bool(forKey: "onboardingDone")
    let data = OnbordingM.data
    
    var body: some View {
        Group {
            if !onboardingDone {
                OnboardingPureS(data: data) {
                    self.onboardingDone = true
                    UserDefaults.standard.setValue(onboardingDone, forKey: "onboardingDone")
                    print("Onboarding done.")
                }
            } else {
                MainCV()
            }
        }
        .background(LinearGradient(gradient: Gradients.darkPurpleToLightGray, startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all))
    }
}
