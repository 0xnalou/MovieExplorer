//
//  UIPassThroughWindow.swift
//  MovieExplorer
//
//  Created by Nalou Nguyen on 3/6/25.
//

import Foundation
import UIKit

// Reference: https://developer.apple.com/forums/thread/762292
final class UIPassThroughWindow: UIWindow {
    
    private static func touchPointCheck(
        _ point: CGPoint,
        with event: UIEvent?,
        view: UIView,
        depth: Int = 0
    ) -> (view: UIView, depth: Int)? {
        var deepest: (view: UIView, depth: Int)?
        
        /// views are ordered back-to-front
        for subview in view.subviews.reversed() {
            let converted = view.convert(point, to: subview)
            
            guard subview.isUserInteractionEnabled,
                  !subview.isHidden,
                  subview.alpha > 0,
                  subview.point(inside: converted, with: event)
            else {
                continue
            }
            
            let result = if let hit = Self.touchPointCheck(
                converted,
                with: event,
                view: subview,
                depth: depth + 1
            ) {
                hit
            } else {
                (view: subview, depth: depth)
            }
            
            let currentDepth = deepest?.depth ?? Int.min
            if deepest == nil || result.depth > currentDepth {
                deepest = result
            }
        }
        
        return deepest
    }
    
    override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        if #available(iOS 18, *) {
            guard let view = rootViewController?.view else {
                return false
            }
            
            let hit = Self.touchPointCheck(
                point,
                with: event,
                view: subviews.count > 1 ? self : view
            )
            
            return hit != nil
        } else {
            return super.point(inside: point, with: event)
        }
    }
    
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        if #available(iOS 18, *) {
            return super.hitTest(point, with: event)
        } else {
            guard let hitView = super.hitTest(point, with: event) else {
                return nil
            }
            return rootViewController?.view == hitView ? nil : hitView
        }
    }
}
