//  Created by Арсений Гулевич  on 25.03.2024.
//

import SwiftUI

extension Font {
    static func custom(_ font: CustomFont, size: CGFloat) -> SwiftUI.Font {
        SwiftUI.Font.custom(font.rawValue, size: size)
    }
}
