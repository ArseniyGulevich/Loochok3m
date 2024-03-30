import SwiftUI

struct OnboardingStepV: View {
    let data: OnbordingM
    
    var body: some View {
        VStack(spacing: 50) {
            Image(data.titleImage)
                .resizable()
                .scaledToFit()
                .frame(width: 318, height: 132)
            Image(data.image)
                .resizable()
                .scaledToFit()
                .frame(height: 276)
            Text(data.heading)
                .font(Constants.subtitleD)
                .foregroundColor(.white)
        }
    }
}
