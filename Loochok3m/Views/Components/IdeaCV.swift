//  Created by Арсений Гулевич  on 09.03.2024.
//

import SwiftUI

struct IdeaCV: View {
    var item: Game
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 25) {
                
                AsyncImageCV(url: item.thumb, width: 358, height: 328)
                    .frame(width: 358, height: 328, alignment: .center)
                    .cornerRadius(20)
                    .padding(.top, 32)
                
                Text("час назад".uppercased())
                    .font(Constants.subtitleM)
                    .foregroundColor(Colors.Typography.secondary)
                
                HStack(alignment: .center) {
                    UserImageCV(url: item.thumb, type: .forCard, size: 32)
                    VStack(alignment: .leading) {
                        Text("Имя Фамилия")
                            .font(Constants.subheadD)
                            .foregroundColor(Colors.Typography.primary)
                        Text("@\("sexy_procrastinator3000")")
                            .font(Constants.subheadD)
                            .foregroundColor(Colors.Typography.secondary)
                    }
                    Spacer()
                    ButtonCV(type: .details)
                }
                
                HStack(alignment: .top) {
                    TagCV(item: item)
                    TagCV(item: item)
                    Spacer()
                    ButtonCV(type: .like, isActive: false)
                }

                VStack(alignment: .leading, spacing: 10) {
                    Text(item.title)
                        .font(Constants.title2D)
                        .foregroundColor(Colors.Typography.black)
                    Text("Здесь какое-то описание, длинный текстик")
                        .font(Constants.paragraph1D)
                        .foregroundColor(Colors.Typography.primary)
                }
                        
                CommentSectionCV(comments:[
                    Comment(postID: "01", userID: "01", date: "вчера", body: "Здесь должен быть текст первого комментария. Должен быть текст комментария. Круто. Идейные соображения высшего порядка, а также сложившаяся структура организации требуют от нас анализа модели развития. Значимость этих проблем настолько очевидна, что постоянный количественный рост и сфера нашей активности требуют от нас анализа систем массового участия. "),
                    Comment(postID: "02", userID: "02", date: "сегодня", body: "Текст другого коммента")
                ], game: item)
                
            }
            .padding(.horizontal, 16)
            .navigationTitle(
                "@\("nickname")"
                    .uppercased()
            )
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        print("some button was tapped")
                    } label: {
                        IconCV(size: 32, image: "Property 1=ellipsis")
                    }
                }
            }
            .font(Constants.subtitleM)
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: BackButtonCV())
        }
    }
}
