//
//  JurixMailApp.swift
//  JurixMail
//
//  Created by David Scott on 11/16/24.
//

import SwiftUI

@main
struct JurixMailApp: App {
    init() {
        // Initialize the database
        print("Initializing DatabaseManager...")
        _ = DatabaseManager.shared
        print("DatabaseManager initialized successfully.")

        // Register fonts
        registerFonts()

        // Debug image loading
        if let imagePath = Bundle.main.path(forResource: "superpractice-icon-sil", ofType: "png") {
            print("Image found at path: \(imagePath)")
        } else {
            print("Image not found in the bundle!")
        }
    }

    var body: some Scene {
        WindowGroup {
            WelcomeView() // Ensure WelcomeView is the starting screen
        }
    }
}

private func registerFonts() {
    let fontsToRegister = [
        ("VeryVogue-Display", "otf"),
        ("Inter-VariableFont", "ttf")
    ]

    for (fontName, fontExtension) in fontsToRegister {
        guard let fontURL = Bundle.main.url(forResource: fontName, withExtension: fontExtension),
              let fontDataProvider = CGDataProvider(url: fontURL as CFURL),
              let font = CGFont(fontDataProvider) else {
            print("Failed to load font \(fontName).\(fontExtension)")
            continue
        }

        var error: Unmanaged<CFError>?
        if !CTFontManagerRegisterGraphicsFont(font, &error) {
            print("Failed to register font \(fontName): \(String(describing: error?.takeUnretainedValue()))")
        } else {
            print("Font \(fontName) registered successfully")
        }
    }
}
