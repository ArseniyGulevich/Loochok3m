//  Created by Арсений Гулевич  on 24.03.2024.
//

import SwiftUI

struct CommentCV: View {
    
    var comment: Comment
    var game: Game
    
    var body: some View {
        HStack(alignment: .top) {
            UserImageCV(url: game.thumb, type: .forCard, size: 46)
                .frame(width: 46, height: 46)
            VStack(alignment: .leading) {
                HStack{
                    Text("@\("username")")
                        .font(Constants.subheadD)
                        .foregroundColor(Colors.Typography.primary)
                    Spacer()
                    Text(comment.date.uppercased())
                        .font(Constants.subtitleM)
                        .foregroundColor(Colors.Typography.secondary)
                }
                Text(comment.body)
                    .lineLimit(4)
                    .font(Constants.subheadD)
                    .foregroundColor(Colors.Typography.secondary)
            }
        }
    }
}
//
//struct CommentCV_Previews: PreviewProvider {
//    static var previews: some View {
//        CommentCV()
//    }
//}
