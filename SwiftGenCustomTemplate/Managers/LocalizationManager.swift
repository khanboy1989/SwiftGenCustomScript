//
//  LocalizationManager.swift
//  SwiftGenCustomTemplate
//
//  Created by Serhan Khan on 27/09/2024.
//

import Foundation

class LocalizationManager {
    
    static let shared = LocalizationManager()
    
    private var localizedStrings: [String: String] = [:]
    
    // Load the English JSON file as a dictionary
    func loadEnglishLocalization() {
        if let url = Bundle.main.url(forResource: "LocalizedStrings", withExtension: "json") {
            do {
                // Read the data from the file
                let data = try Data(contentsOf: url)
                
                // Decode the JSON into a dictionary of String: String
                localizedStrings = try JSONDecoder().decode([String: String].self, from: data)
                print("English localization loaded successfully.")
            } catch {
                print("Error loading localization file: \(error)")
            }
        } else {
            print("LocalizedStrings.json not found in the bundle.")
        }
    }
    
    // Get localized string for a key
    func localizedString(for key: LocalizedStringKeys) -> String {
        // Fallback to the key if the localization is not found
        return localizedStrings[key.rawValue] ?? ""
    }
}
