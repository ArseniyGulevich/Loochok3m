//
//  BackButtonCV.swift
//  Loochok3m
//
//  Created by Арсений Гулевич  on 28.03.2024.
//

import SwiftUI

struct BackButtonCV: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View { Button(action: {
            self.presentationMode.wrappedValue.dismiss()
            }) {
                IconCV(size: 32, image: "Property 1=chevron.backward")
            }
        }
}

struct BackButtonCV_Previews: PreviewProvider {
    static var previews: some View {
        BackButtonCV()
    }
}
