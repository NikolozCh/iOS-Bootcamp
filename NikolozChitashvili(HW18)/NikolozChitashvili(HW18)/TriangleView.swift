//
//  TriangleView.swift
//  NikolozChitashvili(HW18)
//
//  Created by Nikoloz Chitashvili on 19.07.22.
//


// Copied from https://stackoverflow.com/a/66206575

import UIKit

public class TriangleButtonView: UIButton {
    
    private let triangle = UIBezierPath()
    private(set) var buttonColor: UIColor
    
    init(frame: CGRect, color: UIColor) {
        buttonColor = color
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func draw(_ rect: CGRect) {
        super.draw(rect)
        triangle.move(to: CGPoint(x: 0, y: rect.height))
        triangle.addLine(to: CGPoint(x:rect.width/2, y: 0))
        triangle.addLine(to: CGPoint(x:rect.width, y:rect.height))
        triangle.close()
        buttonColor.setFill()
        triangle.fill()
    }
    
    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // This is for allow touches only in shape area.
        if triangle.contains(touches.first?.location(in: self) ?? .zero) {
            super.touchesBegan(touches, with: event)
            // or you can use send action
            // self.sendActions(for: .touchUpInside)
//            print("Clicked")
        }
    }
}
