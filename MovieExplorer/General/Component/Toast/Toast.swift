//
//  Toast.swift
//  MovieExplorer
//
//  Created by Nalou Nguyen on 2/6/25.
//

import Foundation

public struct Toast: Equatable {
    public let title: String
    public let subtitle: String
    public let icon: String
    
    public init(
        title: String,
        subtitle: String,
        icon: String
    ) {
        self.title = title
        self.subtitle = subtitle
        self.icon = icon
    }
}
