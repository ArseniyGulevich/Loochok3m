import SwiftUI

struct ProgressV: View {
    let curSlideIndex : Int
    @StateObject private var ovm = OnboardingVM()
    var body: some View {
        HStack {
            ForEach(0..<ovm.data.count) { i in
                Circle()
                    .scaledToFit()
                    .frame(width: 8)
                    .foregroundColor(self.curSlideIndex == i ? Color(.white) : Color(.lightGray))
            }
        }
        .padding(.horizontal, 12)
        .padding(.vertical, 8)
        .background(.gray)
        .cornerRadius(50)
    }
}
