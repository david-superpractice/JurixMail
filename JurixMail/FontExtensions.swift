import SwiftUI

extension Font {
    static func customHeading(size: CGFloat) -> Font {
        return Font.custom("VeryVogue-Display", size: size) // Ensure this matches PostScript Name
    }

    static func customParagraph(size: CGFloat) -> Font {
        return Font.custom("Inter", size: size) // Ensure this matches PostScript Name
    }
}
