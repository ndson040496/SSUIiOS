//
//  SSUIArrow.swift
//  Okee
//
//  Created by Son Nguyen on 1/5/21.
//

import Foundation
import SwiftUI

public struct SSUIArrow: InsettableShape {
    
    private var insetAmount: CGFloat = 0
    private let hasTail: Bool
    
    public init(hasTail: Bool) {
        self.hasTail = hasTail
    }
    
    public func path(in rect: CGRect) -> Path {
        Path { path in

            let w = rect.size.width
            let h = rect.size.height

            path.move(to: CGPoint(x: w/2, y: insetAmount))
            path.addLine(to: CGPoint(x: insetAmount, y: h/2))
            path.addLine(to: CGPoint(x: w/2, y: h-insetAmount))
            if hasTail {
                path.move(to: CGPoint(x: insetAmount, y: h/2))
                path.addLine(to: CGPoint(x: w - insetAmount, y: h/2))
            }
        }
    }
    
    public func inset(by amount: CGFloat) -> some InsettableShape {
        var shape = self
        shape.insetAmount = amount
        return shape
    }
}
