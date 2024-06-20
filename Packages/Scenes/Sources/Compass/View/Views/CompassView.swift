//
//  File.swift
//  
//
//  Created by Daniil Polenskii on 06.06.2024.
//

import UIKit

final class CompassView: UIView {
    
     var heading: CGFloat = 0 {
        didSet {
            setNeedsDisplay()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    private func commonInit() {
        backgroundColor = .clear
    }
    
    override func draw(_ rect: CGRect) { 
        guard let context = UIGraphicsGetCurrentContext() else { return }
        
        let center = CGPoint(x: rect.midX, y: rect.midY)
        let radius = min(rect.width, rect.height) / 2 - 20
        let headingRadians = heading * .pi / 180
        
        drawCenterLines(context: context, radius: radius, center: center)
        
        drawDegreeMarks(context: context, center: center, radius: radius, headingRadians: headingRadians)
        
        drawDegreeNumbers(context: context, center: center, radius: radius, headingRadians: headingRadians)
        
        drawCompassDirections(context: context, center: center, radius: radius, headingRadians: headingRadians)
        
        drawDirectionTriangle(context: context, radius: radius, center: center, headingRadians: headingRadians)
    }
}

private extension CompassView {
    
    
    func drawLine(context: CGContext, from angle: CGFloat, startRadius: CGFloat, endRadius: CGFloat, center: CGPoint, isMajor: Bool = true) {
        
        let start = CGPoint(
            x: center.x + startRadius * cos(angle),
            y: center.y + startRadius * sin(angle))
        
        let end = CGPoint(
            x: center.x + endRadius * cos(angle),
            y: center.y + endRadius * sin(angle)
        )
        context.setStrokeColor(isMajor ? UIColor.white.cgColor : UIColor.lightGray.withAlphaComponent(0.7).cgColor)
        context.setLineWidth(1)
        context.move(to: start)
        context.addLine(to: end)
        context.strokePath()
    }
    
    func drawDirectionTriangle(context: CGContext, radius: CGFloat, center: CGPoint, headingRadians: CGFloat) {
        context.saveGState()
        context.setFillColor(UIColor.red.cgColor)
        
        let topPoint = CGPoint(
                   x: center.x,
                   y: center.y - radius
               )
               
        let leftPoint = CGPoint(
            x: center.x - 8,
            y: center.y - radius + 12
        )
               
        let rightPoint = CGPoint(
            x: center.x + 8,
            y: center.y - radius + 12
        )
            
        context.beginPath()
        context.move(to: topPoint)
        context.addLine(to: leftPoint)
        context.addLine(to: rightPoint)
        context.closePath()
        context.fillPath()
        context.restoreGState()
    }
    
    func drawCenterLines(context: CGContext, radius: CGFloat, center: CGPoint) {
        drawLine(context: context, from: 0, startRadius: radius / 2, endRadius: -radius / 2 , center: center)
        drawLine(context: context, from: .pi / 2, startRadius: radius / 2, endRadius: -radius / 2, center: center)
        
    }
    
    func drawDegreeMarks(context: CGContext, center: CGPoint, radius: CGFloat, headingRadians: CGFloat ) {
        for i in stride(from: 0, to: 360, by: 5) {
            let angle = CGFloat(i) * .pi / 180 - headingRadians
            let startRadius = i % 30 == 0 ? radius - 35 : radius - 25
            let endRadius = radius - 15
            drawLine(context: context, from: angle, startRadius: startRadius, endRadius: endRadius, center: center, isMajor: i % 30 == 0)
        }
    }
    
    func drawDegreeNumbers(context: CGContext, center: CGPoint, radius: CGFloat, headingRadians: CGFloat) {
        let degreeAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 14),
            .foregroundColor: UIColor.white
        ]
        
        for i in stride(from: 0, to: 360, by: 30) {
            let angle = CGFloat(i) * .pi / 180 - headingRadians - .pi / 2
            let radius = radius + 7
            let degreeString = NSAttributedString(string: "\(i)", attributes: degreeAttributes)
            drawText(context: context, center: center, radius: radius, text: degreeString, at: angle)
        }
    }
    
    func drawCompassDirections(context: CGContext, center: CGPoint, radius: CGFloat, headingRadians: CGFloat) {
        let directionRadius = radius - 57
        let directions = ["N", "E", "S", "W"]
        let attributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 24),
            .foregroundColor: UIColor.lightGray
        ]
        
        for (i, direction) in directions.enumerated() {
            let angle = CGFloat(i) * .pi / 2 - headingRadians - .pi / 2
            let attributedString = NSAttributedString(string: direction, attributes: attributes)
          drawText(context: context, center: center, radius: directionRadius, text: attributedString, at: angle)
        }
    }
    
    
    func drawText(context: CGContext, center: CGPoint, radius: CGFloat, text: NSAttributedString, at angle: CGFloat) {
        let stringSize = text.size()
        let textPosition = CGPoint(
            x: center.x + radius * cos(angle) - stringSize.width / 2,
            y: center.y + radius * sin(angle) - stringSize.height / 2
        )
        text.draw(at: textPosition)
    }
}

