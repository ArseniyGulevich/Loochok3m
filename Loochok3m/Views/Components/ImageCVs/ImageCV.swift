//
//  ImageCV.swift
//  Loochok3m
//
//  Created by Арсений Гулевич  on 27.03.2024.
//

import SwiftUI

struct ImageCV: View {
    
    var image: String
    var width: CGFloat
    var height: CGFloat
    var cornerRaduis: CGFloat = 20
    
    var body: some View {
        Image(image)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: width, height: height)
            .cornerRadius(cornerRaduis)
    }
}
