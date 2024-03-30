//  Created by Арсений Гулевич  on 09.03.2024.
//

import SwiftUI

struct AsyncImageCV: View {
    
    var url: String
    var width: CGFloat
    var height: CGFloat
    
    var body: some View {
        if #available(iOS 15.0, *) {
                AsyncImage(url: URL(string: url)) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: width, height: height)
                        .cornerRadius(20)

                } placeholder: {
                    Color(.gray).opacity(0.3)
                }
        } else {
            // Is not supported on earlier versions
        }
    }
}
