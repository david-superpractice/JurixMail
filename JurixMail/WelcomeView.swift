import SwiftUI
import AppKit

struct WelcomeView: View {
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea() // Background color

            VStack {
                Spacer() // Push content to the center

                VStack(spacing: 40) { // Set consistent spacing
                    // Image
                    if let imagePath = Bundle.main.path(forResource: "superpractice-icon-sil", ofType: "png"),
                       let nsImage = NSImage(contentsOfFile: imagePath) {
                        Image(nsImage: nsImage)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 42, height: 42)
                    } else {
                        Text("Image not found")
                            .foregroundColor(.white)
                    }

                    // Title
                    TextStyles.h2("Let's supercharge your inbox.")

                    // Subtitle
                    TextStyles.p("Streamline your email with AI. Save hours every week by automating responses and organizing your inbox effortlessly.")
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 30) // Fixed horizontal padding
                        .frame(maxWidth: 700) // Set maximum width for the paragraph

                    // Button
                    TextStyles.button("Connect Email Account")
                }
                .frame(maxWidth: .infinity, alignment: .center) // Center horizontally

                Spacer() // Push content to the center
            }
            .frame(maxWidth: .infinity, maxHeight: 320) // Ensure full screen usage
        }
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
