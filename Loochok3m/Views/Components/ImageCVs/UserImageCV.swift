//  Created by Арсений Гулевич  on 25.03.2024.
//

import SwiftUI

enum UserImageType: Int {
    case forUserProfile = 0
    case forCard = 1

}

struct UserImageCV: View {
    
    var url: String
    var type: UserImageType
    var size: CGFloat
    
    var body: some View {
        if #available(iOS 15.0, *) {
            switch type {
            case .forCard:
                AsyncImage(url: URL(string: url)) { image in
                    image
                        .resizable()
                        .frame(width: size, height: size)
                        .aspectRatio(contentMode: .fit)
                        .cornerRadius(size/2)
                } placeholder: {
                    Color(.purple)
                        .cornerRadius(size/2)
                }
            case .forUserProfile:
                AsyncImage(url: URL(string: url)) { image in
                    image
                        .resizable()
                        .frame(width: size, height: size)
                        .aspectRatio(contentMode: .fit)
                        .cornerRadius(35)
                } placeholder: {
                    Color(.purple)
                        .cornerRadius(35)
                }
            default:
                Image(systemName: "error")
            }
            
        } else {
            // Is not supported on earlier versions
        }
    }
}

//struct UserImageCV_Previews: PreviewProvider {
//    static var previews: some View {
//        UserImageCV()
//    }
//}
