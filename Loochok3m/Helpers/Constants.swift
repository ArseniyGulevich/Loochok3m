//  Created by Арсений Гулевич  on 19.03.2024.
//

import SwiftUI

public struct Constants {
    
    static var avatarImageSize1: CGFloat = 32
    static var avatarImageSize2: CGFloat = 46
    static var cornerRadius16: CGFloat = 16
    static var cornerRadius20: CGFloat = 20
    
    
    // MARK: - Текстовые стили
    
    // Desktop
    static let title1D: Font = .custom(.semibold, size: 42)
    static let title2D: Font = .custom(.semibold, size: 24)
    static let title3D: Font = .custom(.semibold, size: 20)
    static let paragraph1D: Font = .custom(.regular, size: 18)
    static let paragraph2D: Font = .custom(.regular, size: 16)
    static let subtitleD: Font = .custom(.medium, size: 16)
    static let captionD: Font = .custom(.medium, size: 13)
    static let subheadD: Font = .custom(.regular, size: 14)

    // Mobile
    static let title1M: Font = .custom(.semibold, size: 28)
    static let title2M: Font = .custom(.semibold, size: 24)
    static let title3M: Font = .custom(.semibold, size: 20)
    static let subtitleM: Font = .custom(.medium, size: 13)
    
}
