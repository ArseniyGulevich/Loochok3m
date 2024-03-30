//
//  SearchBarCV.swift
//  Loochok3m
//
//  Created by Арсений Гулевич  on 27.03.2024.
//

import SwiftUI

enum SearchBarType: Int {
    case withFilers = 0
    case full = 1
}

struct SearchBarCV: View {
    @State var bindingText: String
    var barText: String
    var type: SearchBarType
    
    var body: some View {
        switch type {
        case .full:
            HStack {
                Image("Property 1=magnifyingglass")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 26)
                    .padding(.leading, 10)
                TextField(barText, text: $bindingText)
                    .foregroundColor(Colors.Typography.primary)
            }
            .padding(.vertical, 10)
            .border(Colors.Typography.primary, width: 1)
            
        case .withFilers:
            HStack {
                HStack {
                    Image("Property 1=magnifyingglass")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 26)
                        .padding(.leading, 10)
                    TextField(barText, text: $bindingText)
                        .foregroundColor(Colors.Typography.primary)
                }
                .padding(.vertical, 10)
                .border(Colors.Typography.primary, width: 1)
                IconCV(size: 46, image: "Property 1=Filter")
            }
        }
    }
}
