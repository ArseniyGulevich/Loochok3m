//
//  TagSectionCV.swift
//  Loochok3m
//
//  Created by Арсений Гулевич  on 28.03.2024.
//

import SwiftUI

struct TagSectionCV: View {
    
//    var tags: [String] = ["Первый тэг", "Второй", "Третий тэг", "Хороший тэг"]
//    @State var games = [Game]()
    
    let rows: [GridItem] = [
        GridItem(.fixed(50), spacing: 0, alignment: .center),
        GridItem(.flexible(), spacing: 0, alignment: .center),
        GridItem(.flexible(), spacing: 0, alignment: .center)
    ]
    
    var body: some View {
        LazyHGrid(rows: rows, alignment: .center, spacing: 4) {
            cell(text: "Рукоделие")
            cell(text: "Рукоделие")
            cell(text: "Рукоделие")
            cell(text: "Рукоделие")
            cell(text: "Рукоделие")
            cell(text: "Рукоделие")
            cell(text: "Рукоделие")
            cell(text: "Рукоделие")
//            ForEach(0..<16) { index in
//                 cell(text: "\(index)")
//            }
        }
    }
    
    func cell(text: String) -> some View {
        Text(text.uppercased())
            .font(Constants.captionD)
            .padding(.horizontal, 16)
            .padding(.vertical, 8)
            .foregroundColor(Colors.Typography.inverse)
            .background(.black)
            .lineLimit(1)
            .cornerRadius(Constants.cornerRadius16)
            .background(.green)
    }
    
}

struct TagSectionCV_Previews: PreviewProvider {
    static var previews: some View {
        TagSectionCV()
    }
}
