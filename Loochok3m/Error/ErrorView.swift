import SwiftUI

struct ErrorView: View {
    private let successNotificationShowTime: UInt64 = 1_500_000_000
    private let errorNotificationShowTime: UInt64 = 2_800_000_000
    
    @Binding var errorState: ErrorState
    
    var body: some View {
        VStack {
            switch errorState {
            case .Success(let message):
                Text(message)
                    .frame(maxWidth: .infinity)
                    .foregroundColor(.white)
                    .padding(.horizontal, 10)
                    .padding(.vertical, 15)
                    .background(.green)
                    .cornerRadius(15)
                    /// anim
                    .task(hideNotification)
            case .Error(let message):
                Text(message)
                    .frame(maxWidth: .infinity)
                    .foregroundColor(.white)
                    .padding(.horizontal, 10)
                    .padding(.vertical, 15)
                    .background(.red)
                    .cornerRadius(15)
                    /// anim
                    .task(hideNotification)
            case .None:
                EmptyView()
            }
            Spacer()
        }.padding(.vertical, 15)
            .padding(.horizontal, 5)
    }
    
    @Sendable private func hideNotification() async {
        switch errorState {
        case .Error(_):
            try? await Task.sleep(nanoseconds: errorNotificationShowTime)
        case .Success(_):
            try? await Task.sleep(nanoseconds: successNotificationShowTime)
        case .None:
            return
        }
        errorState = .None
    }
}
