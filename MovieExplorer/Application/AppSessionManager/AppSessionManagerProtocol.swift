//
//  AppSessionManagerProtocol.swift
//  MovieExplorer
//
//  Created by Nalou Nguyen on 3/6/25.
//

import Foundation

protocol AppSessionManagerProtocol: AnyObject {
    var accessToken: String? { get }
}
