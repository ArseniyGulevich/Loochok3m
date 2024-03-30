//  Created by Арсений Гулевич  on 25.03.2024.
//

import Foundation
import UIKit

extension UIFont {
    
    static func suisseIntlMedium(size: CGFloat) -> UIFont {
        return UIFont(name: "SuisseIntl-Medium", size: size) ?? .systemFont(ofSize: size)
    }
    
    static func suisseIntlSemibold(size: CGFloat) -> UIFont {
        return UIFont(name: "SuisseIntl-SemiBold", size: size) ?? .systemFont(ofSize: size)
    }
    
    static func suisseIntlRegular(size: CGFloat) -> UIFont {
        return UIFont(name: "SuisseIntl-Regular", size: size) ?? .systemFont(ofSize: size)
    }
    
    static func suisseIntlBold(size: CGFloat) -> UIFont {
        return UIFont(name: "SuisseIntl-Bold", size: size) ?? .systemFont(ofSize: size)
    }
    
    static func suisseIntlBlack(size: CGFloat) -> UIFont {
        return UIFont(name: "SuisseIntl-Black", size: size) ?? .systemFont(ofSize: size)
    }
    
    static func suisseIntlLight(size: CGFloat) -> UIFont {
        return UIFont(name: "SuisseIntl-Light", size: size) ?? .systemFont(ofSize: size)
    }
    
}
