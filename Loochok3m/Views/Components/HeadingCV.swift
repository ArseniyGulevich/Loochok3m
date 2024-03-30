//
//  HeadingCV.swift
//  Loochok3m
//
//  Created by Арсений Гулевич  on 27.03.2024.
//

import SwiftUI

struct HeadingCV: View {
    
    var text: String
    var type: Int = 0
    
    var body: some View {
        
        switch type {
        case 0:
            HStack {
                Text(text.uppercased())
                    .font(Constants.title1M)
                    .foregroundColor(Colors.Typography.inverse)
                    .lineLimit(3)
                    .padding(8)
                    .multilineTextAlignment(.leading)
                Spacer()
            }
            .background(.black)
        case 1:
            Text(text.uppercased())
                .font(Constants.title1M)
                .foregroundColor(Colors.Typography.inverse)
                .lineLimit(1)
                .padding(8)
                .multilineTextAlignment(.leading)
                .background(.black)
                .padding(14)
        default:
            Text("текст")
        }
    }
}

//struct HeadingCV_Previews: PreviewProvider {
//    static var previews: some View {
//        HeadingCV(text: "Что посмотрим?")
//    }
//}
