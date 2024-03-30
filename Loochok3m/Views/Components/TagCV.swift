//  Created by Арсений Гулевич  on 19.03.2024.
//

import SwiftUI

struct TagCV: View {
    
    var item: Game
    
    var body: some View {
        Text(item.title.uppercased())
            .font(Constants.captionD)
            .padding(.horizontal, 16)
            .padding(.vertical, 8)
            .foregroundColor(Colors.Typography.inverse)
            .background(.black)
            .lineLimit(1)
            .cornerRadius(Constants.cornerRadius16)
    }
}

//struct TagCV_Previews: PreviewProvider {
//    static var previews: some View {
//        TagCV()
//    }
//}
