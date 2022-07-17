//
//  Pie.swift
//  Memorize
//
//  Created by Сергей Копаницкий on 10.01.2021.
//

import SwiftUI

struct Pie: Shape {
    public let startAngle: Angle
    public let endAngle: Angle
    public var clockwise: Bool = false
    
    public func path(in rect: CGRect) -> Path {
        var path = Path()
        
        let center = CGPoint(x: rect.midX, y: rect.midY)
        path.move(to: center)
        
        let radius = min(rect.height, rect.width) / 2
        let start = CGPoint(x: center.x + radius * cos(CGFloat(startAngle.radians)),
                            y: center.y + radius * sin(CGFloat(startAngle.radians)))
        path.addLine(to: start)
        
        path.addArc(center: center,
                    radius: radius,
                    startAngle: startAngle,
                    endAngle: endAngle,
                    clockwise: clockwise)
        
        path.addLine(to: center)
        return path
    }
}

