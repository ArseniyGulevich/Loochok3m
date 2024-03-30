//
//  TutorialCV.swift
//  Loochok3m
//
//  Created by Арсений Гулевич  on 27.03.2024.
//

import SwiftUI

struct TutorialCV: View {
    var item: Game
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 25) {
                HStack {
                    UserImageCV(url: item.thumb, type: .forCard, size: 32)
                    VStack(alignment: .leading) {
                        Text("Имя Фамилия")
                            .font(Constants.subheadD)
                            .foregroundColor(Colors.Typography.primary)
                        Text("@\("sexy_procrastinator3000")")
                            .font(Constants.subheadD)
                            .foregroundColor(Colors.Typography.secondary)
                    }
                }
                .padding(.top, 32)
                
                HStack(alignment: .center) {
                    TagCV(item: item)
                    TagCV(item: item)
                    Spacer()
                    Text("Сегодня в 13:06".uppercased())
                        .font(Constants.subtitleM)
                        .foregroundColor(Colors.Typography.secondary)
                }
                
                HeadingCV(text: item.title)
                                
                ZStack {
                    RoundedRectangle(cornerRadius: 20)
                        .fill(.shadow(.inner(color: .black.opacity(0.2), radius: 2, x: 0, y: 5)))
                        .foregroundColor(.white)
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(style: StrokeStyle(lineWidth: 1, dash: [4]))
                        .foregroundColor(.black)
                    Text("Если вы начинающий ценитель моды, обычные тканевые кеды идеально подойдут для экспериментов. Можно превратить пару скучных белых кед во что-нибудь действительно впечатляющее. Однако для раскраски тканевой обуви необходимо приложить усилия, ведь вам придется проработать дизайн, подготовить необходимые материалы")
                        .font(Constants.paragraph2D)
                        .foregroundColor(Colors.Typography.black)
                        .multilineTextAlignment(.leading)
                        .padding(24)
                }

                AsyncImageCV(url: item.thumb, width: 358, height: 328)
                    .frame(width: 358, height: 328, alignment: .center)
                    .cornerRadius(20)

                VStack(alignment: .leading, spacing: 5) {
                    Text("Какой-то заголовок")
                        .font(Constants.title2D)
                        .foregroundColor(Colors.Typography.black)
                    Text("Идейные соображения высшего порядка, а также сложившаяся структура организации требуют от нас анализа модели развития. Значимость этих проблем настолько очевидна, что постоянный количественный рост и сфера нашей активности требуют от нас анализа систем массового участия.")
                        .font(Constants.paragraph1D)
                        .foregroundColor(Colors.Typography.primary)
                }
                                        
                CommentSectionCV(comments:[
                    Comment(postID: "01", userID: "01", date: "вчера", body: "Здесь должен быть текст первого комментария. Должен быть текст комментария. Круто. Идейные соображения высшего порядка, а также сложившаяся структура организации требуют от нас анализа модели развития. Значимость этих проблем настолько очевидна, что постоянный количественный рост и сфера нашей активности требуют от нас анализа систем массового участия."),
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
