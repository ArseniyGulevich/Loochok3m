//
//  IconCV.swift
//  Loochok3m
//
//  Created by Арсений Гулевич  on 27.03.2024.
//

import SwiftUI

struct IconCV: View {
    
    var size: CGFloat
    var image: String
    
    var body: some View {
        Circle()
            .frame(width: size, height: size)
            .foregroundColor(.black)
            .overlay(
                Image(image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 16)
            )
    }
}

struct IconCV_Previews: PreviewProvider {
    static var previews: some View {
        IconCV(size: 46, image: "Property 1=Filter")
    }
}
