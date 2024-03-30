//  Created by Арсений Гулевич  on 19.03.2024.
//

import SwiftUI

enum CardType: Int {
    case idea = 0
    case tutorial = 1
}

struct CardCV: View {
    var game: Game
    var type: CardType
    
    var body: some View {
        switch type {
        case .idea:
            VStack(alignment: .leading, spacing: 16) {
                AsyncImageCV(url: game.thumb, width: 345, height: 327)
                    .padding(.horizontal, 8)
                    .padding(.top, 8)
                VStack(alignment: .leading, spacing: 16) {
                    HStack {
                        UserImageCV(url: game.thumb, type: .forCard, size: 32)
                            .frame(width: 32, height: 32)
                        VStack(alignment: .leading) {
                            Text(game.title)
                                .font(Constants.subheadD)
                                .foregroundColor(Colors.Typography.primary)
                                .lineLimit(1)
                            Text("@\("username")")
                                .font(Constants.subheadD)
                                .foregroundColor(Colors.Typography.secondary)
                                .lineLimit(1)
                        }
                        Spacer()
                        ButtonCV(type: .like, isActive: false)
                    }
                    HStack(alignment: .top) {
                        TagCV(item: game)
                    }
                }
                .padding(.horizontal, 16)
                .padding(.bottom, 16)
            }
        case .tutorial:
            VStack(alignment: .leading, spacing: 16) {
                AsyncImageCV(url: game.thumb, width: 345, height: 192)
                    .padding(.horizontal, 8)
                    .padding(.top, 8)
                VStack(alignment: .leading, spacing: 16) {
                    HStack(alignment: .top) {
                        Text(game.title)
                            .font(Constants.title2M)
                            .foregroundColor(Colors.Typography.primary)
                            .lineLimit(3)
                            .multilineTextAlignment(.leading)
                        Spacer()
                        ButtonCV(type: .like, isActive: false)
                    }
                    HStack(alignment: .top) {
                        TagCV(item: game)
                    }
                }
                .padding(.horizontal, 16)
                .padding(.bottom, 16)
            }
        }
    }
}
