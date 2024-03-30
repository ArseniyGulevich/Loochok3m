//
//  ButtonCV.swift
//  Loochok3m
//
//  Created by Арсений Гулевич  on 25.03.2024.
//

import SwiftUI
import Foundation


enum ButtonType: String {
    case like = "Like"
    case details = "Property 1=ellipsis"
}

enum ButtonState: String {
    case isActive = ""
}

struct ButtonCV: View {
    
    var type: ButtonType
    var isActive: Bool = false
    
    var body: some View {
        switch type {
        case .like:
            Button {
                print("like button was tappped")
            } label: {
                Image(isActive ? "LikeActive" : "LikeInactive")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 32)
            }
        case .details:
            Button {
                print("moreButton was tappped")
            } label: {
                Image("Property 1=ellipsis")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 36)
            }
        default:
            Button {
                print("some button was tappped")
            } label: {
                Text("Some button")
                    .foregroundColor(Colors.Typography.black)
                    .background(Colors.Icon.accent)
            }
        }
    }
}
//
//struct ButtonCV_Previews: PreviewProvider {
//    static var previews: some View {
//        ButtonCV()
//    }
//}
