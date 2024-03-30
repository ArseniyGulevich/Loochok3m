//
//  UserProfileCV.swift
//  Loochok3m
//
//  Created by Арсений Гулевич  on 28.03.2024.
//

import SwiftUI

struct UserProfileCV: View {
    
//    var user: User
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 16) {
                    ZStack(alignment: .topTrailing) {
                        HStack {
                            Spacer()
                            VStack {
//                                UserImageCV(url: game.thumb, size: 200)
                                ImageCV(image: "DefaultUserImage", width: 200, height: 200, cornerRaduis: 35)
                                HeadingCV(text: "Имя Фамимимилия", type: 1)
                                    .frame(width: 150)
                                Text("@\("nickname")".uppercased())
                                    .font(Constants.captionD)
                                    .padding(.horizontal, 16)
                                    .padding(.vertical, 8)
                                    .foregroundColor(Colors.Typography.inverse)
                                    .background(.black)
                                    .lineLimit(1)
                                    .cornerRadius(Constants.cornerRadius16)
                                HStack {
                                    // теги
                                }
                            }
                            .padding()
                            Spacer()
                        }
                        IconCV(size: 32, image: "Property 1=gearshape")
                            .padding()
                    }
                    .background(Gradients.darkPurpleToLightGray)
                    .cornerRadius(24)
                    .padding(.top, 16)

                }
                .padding(.horizontal, 10)
            }
            .background(
                Gradient(colors: [Color.white, Colors.gray.opacity(0.1)])
            )
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
