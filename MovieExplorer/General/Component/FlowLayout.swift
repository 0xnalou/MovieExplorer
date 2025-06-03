//
//  FlowLayout.swift
//  MovieExplorer
//
//  Created by Nalou Nguyen on 3/6/25.
//
import SwiftUI

struct FlowLayout<Data: RandomAccessCollection, Content: View>: View where Data.Element: Hashable {
    let items: Data
    let spacing: CGFloat
    let content: (Data.Element) -> Content

    init(items: Data, spacing: CGFloat = 8, @ViewBuilder content: @escaping (Data.Element) -> Content) {
        self.items = items
        self.spacing = spacing
        self.content = content
    }

    var body: some View {
        var width = CGFloat.zero
        var height = CGFloat.zero

        return GeometryReader { geometry in
            ZStack(alignment: .topLeading) {
                ForEach(items, id: \.self) { item in
                    content(item)
                        .padding(4)
                        .alignmentGuide(.leading, computeValue: { d in
                            if abs(width - d.width) > geometry.size.width {
                                width = 0
                                height -= d.height + spacing
                            }
                            let result = width
                            if item == items.last {
                                width = 0
                            } else {
                                width -= d.width + spacing
                            }
                            return result
                        })
                        .alignmentGuide(.top, computeValue: { _ in
                            let result = height
                            if item == items.last {
                                height = 0
                            }
                            return result
                        })
                }
            }
        }
        .frame(height: 60)
    }
}
