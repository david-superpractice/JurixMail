import SwiftUI

// Centralized text styles
struct TextStyles {
    // h2 style with gradient
    static func h2(_ text: String) -> some View {
        LinearGradient(
            gradient: Gradient(colors: [Color.white, Color.gray]),
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
        .mask(
            Text(text)
                .font(Font.custom("Very Vogue Display", size: 52)) // 52px font size
                .fontWeight(.semibold) // Font weight 600
                .kerning(-0.01 * 52) // Adjust kerning for 52px
        )
        .frame(maxWidth: .infinity) // Ensure it occupies full width
    }

    // p style
    static func p(_ text: String) -> some View {
        Text(text)
            .font(Font.custom("Inter", size: 16)) // 16px font size
            .fontWeight(.regular) // Regular font weight (400)
            .foregroundColor(.white) // Text color
            .lineSpacing(4.8) // Line spacing for readability
            .multilineTextAlignment(.center)
    }

    // Simplified button style
    static func button(_ text: String) -> some View {
        Text(text)
            .font(.system(size: 15)) // Font size
            .foregroundColor(buttonTextColor) // Button text color
            .padding(.vertical, 8) // Vertical padding for height
            .padding(.horizontal, 40) // Horizontal padding to add space around the text
            .background(buttonBackgroundColor) // Button background color
            .cornerRadius(12) // Rounded corners
    }

    // Centralized button colors
    static var buttonBackgroundColor: Color {
        Color(red: 230 / 255, green: 230 / 255, blue: 230 / 255) // #E6E6E6
    }

    static var buttonTextColor: Color {
        Color(red: 13 / 255, green: 21 / 255, blue: 32 / 255) // #0d1520
    }
}
