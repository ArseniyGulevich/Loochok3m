import SwiftUI

struct ArrowV: View {
    let curSlideIndex: Int
    @StateObject private var ovm = OnboardingVM()

    var body: some View {
        Group {
            HStack {
                Spacer()
                Text(
                    self.curSlideIndex == self.ovm.data.count - 1 ?
                    "К Лучку!".uppercased():
                    "Далее".uppercased()
                )
                .font(Constants.captionD)
                .foregroundColor(Colors.Typography.inverse)
                Spacer()
            }
            .frame(height: 44)
            .background(Color(.black))
        }
    }
}
