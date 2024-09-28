//
//  GenerateLocalizedString.swift
//  SwiftGenCustomTemplate
//
//  Created by Serhan Khan on 27/09/2024.
//

import Foundation

@main
struct GenerateLocalizedString {
    static func main() {
        // Define the input and output file paths
        let jsonFilePath = "SwiftGenCustomTemplate/Resources/LocalizedStrings.json"
        let outputFilePath = "SwiftGenCustomTemplate/Generated/LocalizedStringKeys.swift"
        print("Start of the parsing")
        
        // Read JSON from the file
        guard let data = FileManager.default.contents(atPath: jsonFilePath),
              let json = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: String] else {
            print("❌ Failed to read or parse JSON")
            return
        }
        
        // Start creating the Swift enum
        var swiftEnum = """
            // LocalizedStrings.swift (Generated by Swift Script)
            
            import Foundation
            
            enum LocalizedStringKeys: String {
            """
        
        // Iterate through each key in the JSON
        for key in json.keys.sorted() {
            let caseName = key.replacingOccurrences(of: "%", with: "Percent")
                .replacingOccurrences(of: " ", with: "")
            swiftEnum += "\n    case \(caseName) = \"\(key)\""
        }
        
        // Close the enum declaration
        swiftEnum += "\n}"
        
        // Write to the output Swift file
        do {
            try swiftEnum.write(toFile: outputFilePath, atomically: true, encoding: .utf8)
            print("✅ Successfully generated LocalizedStringKeys.swift")
        } catch {
            print("❌ Failed to write to file: \(error.localizedDescription)")
        }
    }
}

