//
//  HeaderToasterView.swift
//  MovieExplorer
//
//  Created by Nalou Nguyen on 3/6/25.
//

import SwiftUI

public struct HeaderToasterView: View {
    private let title: String
    private let subtitle: String
    private let icon: Image
    private var closeAction: (() -> Void)?
    
    public init(title: String,
                subtitle: String,
                icon: Image,
                closeAction: (() -> Void)? = nil) {
        self.title = title
        self.subtitle = subtitle
        self.icon = icon
        self.closeAction = closeAction
    }
    
    public var body: some View {
        HStack(alignment: .top, spacing: MovieExplorer.size8) {
            iconView
            VStack(spacing: MovieExplorer.size8) {
                titleView
                subtitleView
            }
            closeIcon
        }
        .padding([.leading, .trailing, .top], MovieExplorer.size8)
        .padding(.bottom, MovieExplorer.size16)
        .background(MovieExplorer.colorsBaceWhite)
        .cornerRadius(MovieExplorer.size16)
        .overlay {
            RoundedRectangle(cornerRadius: MovieExplorer.size16)
                .stroke(MovieExplorer.colorRedTertiary, lineWidth: 1)
        }
        .padding(.leading, MovieExplorer.size8)
        .background(Color("#F87171"))
        .cornerRadius(MovieExplorer.size16)
        .background {
            RoundedRectangle(cornerRadius: MovieExplorer.size16)
                .stroke(MovieExplorer.colorRedTertiary, lineWidth: 1)
        }
    }
    
    private var iconView: some View {
        icon
            .renderingMode(.template)
            .resizable()
            .frame(width: MovieExplorer.size24, height: MovieExplorer.size24)
            .padding(1.0)
            .background(MovieExplorer.colorRedPrimary)
            .foregroundStyle(MovieExplorer.colorRedSecondary)
            .clipShape(RoundedRectangle(cornerRadius: MovieExplorer.size4))
    }
    
    private var titleView: some View {
        Text(title)
            .frame(maxWidth: .infinity, alignment: .topLeading)
    }
    
    private var subtitleView: some View {
        Text(subtitle)
            .frame(maxWidth: .infinity, alignment: .topLeading)
    }
    
    private var closeIcon: some View {
        Image("icon-clear")
            .renderingMode(.template)
            .resizable()
            .frame(width: MovieExplorer.size24, height: MovieExplorer.size24)
            .onTapGesture { closeAction?() }
    }
}
