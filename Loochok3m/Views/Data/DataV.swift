import SwiftUI

struct DataV: View {
    @StateObject private var viewModel = AuthViewModel()
    @Binding var errorState: ErrorState
    
    var body: some View {
        Text(viewModel.data)
            .onAppear() {
                viewModel.getData(token: viewModel.token, completion: {
                    response in
                    if response.id == 0  {
                        errorState = .Success(message: "Data received from server successfully.")
                    } else {
                        errorState = .Error(message: response.token)
                    }
                })
            }
    }
}
