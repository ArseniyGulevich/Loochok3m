//
//  SelectionCardCV.swift
//  Loochok3m
//
//  Created by Арсений Гулевич  on 27.03.2024.
//

import SwiftUI

struct SelectionCardCV: View {
    var text: String
    var image: String
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            RoundedRectangle(cornerRadius: 20)
                .foregroundColor(Colors.gray)
                .overlay(
                    Image(image)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                )
            RoundedRectangle(cornerRadius: 20)
                .strokeBorder(style: StrokeStyle(lineWidth: 4))
                .foregroundColor(.black)
            Text(text.uppercased())
                .font(Constants.title1M)
                .foregroundColor(Colors.Typography.inverse)
                .lineLimit(1)
                .padding(8)
                .multilineTextAlignment(.leading)
                .background(.black)
                .padding(14)
        }
        .frame(width: 210, height: 210)
    }
}
