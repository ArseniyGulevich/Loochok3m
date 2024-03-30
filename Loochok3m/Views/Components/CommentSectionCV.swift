//  Created by Арсений Гулевич  on 24.03.2024.
//

import SwiftUI

struct CommentSectionCV: View {
    
    var comments: [Comment]
    var game: Game
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                Text("Комментарии")
                    .font(Constants.title2D)
                    .foregroundColor(Colors.Typography.black)
                
//                List(comments) { comment in
//                    CommentCV(comment: comment)
//                }
                ForEach(comments) { comment in
                    CommentCV(comment: comment, game: game)
                }
            }
        }
    }
}

//struct CommentsCV_Previews: PreviewProvider {
//    static var previews: some View {
//        CommentsCV()
//    }
//}
