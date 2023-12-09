//
//  DisplayShape.swift
//  Calculator_UI
//


import SwiftUI

struct DisplayShape: Shape {
    
    
    func path(in rect: CGRect) -> Path {
        let cX: CGFloat = rect.midX
        let cY: CGFloat = rect.midY
        
        var path = Path()
        
        path.move(to: CGPoint(x: 0, y: cY * 2))
        path.addLine(to: CGPoint(x: cX * 2, y: cY * 2))
        path.addLine(to: CGPoint(x: cX * 2, y: 0))
        path.addLine(to: CGPoint(x: cX / 2 - 40, y: 0))
        
        path.addLine(to: CGPoint(x: 0, y: cY - 62))
        path.closeSubpath()
        
        return path
    }
    
}

struct DisplayShape_Previews: PreviewProvider {
    static var previews: some View {
        DisplayShape()
            .stroke(lineWidth: 2)
            .frame(height: 274)
    }
}
