//
//  Extension+Dictionary.swift
//  Networking
//
//  Created by Nalou Nguyen on 2/6/25.
//

import Foundation

public extension Dictionary where Key == String {
    func prettyPrint() -> String {
        var string = ""
        var options: JSONSerialization.WritingOptions
        if #available(iOS 13.0, macOS 11, *) {
            options = [.prettyPrinted, .withoutEscapingSlashes]
        } else {
            options = [.prettyPrinted]
        }
        if let data = try? JSONSerialization.data(withJSONObject: self, options: options) {
            if let nstr = NSString(data: data, encoding: String.Encoding.utf8.rawValue) {
                string = nstr as String
            }
        }
        return string
    }
}
