//
//  HeartShape.swift
//  LanguagePopoverMenu
//
//  Created by christian on 08/06/24.
//

import SwiftUI

    //#-learning-task(heartPulse)

/*#-code-walkthrough(2.heartPulse)*/
/*#-code-walkthrough(1.heartPulse)*/
struct HeartShape: Shape {
    /*#-code-walkthrough(1.heartPulse)*/
    /*#-code-walkthrough(1.heartPulse)*/
    func path(in rect: CGRect) -> Path {
        var path = Path()
        /*#-code-walkthrough(2.heartPulse)*/

        /*#-code-walkthrough(3.heartPulse)*/
        path.move(to: CGPoint(x: rect.midX, y: rect.maxY ))
        /*#-code-walkthrough(3.heartPulse)*/

        /*#-code-walkthrough(4.heartPulse)*/
        path.addCurve(to: CGPoint(x: rect.minX, y: rect.height/4),
                      control1:CGPoint(x: rect.midX, y: rect.height*3/4),
                      control2: CGPoint(x: rect.minX, y: rect.midY))
        /*#-code-walkthrough(4.heartPulse)*/

        /*#-code-walkthrough(5.heartPulse)*/
        path.addArc(center: CGPoint( x: rect.width/4,y: rect.height/4),
                    radius: (rect.width/4),
                    startAngle: Angle(radians: Double.pi),
                    endAngle: Angle(radians: 0),
                    clockwise: false)
        path.addArc(center: CGPoint( x: rect.width * 3/4,y: rect.height/4),
                    radius: (rect.width/4),
                    startAngle: Angle(radians: Double.pi),
                    endAngle: Angle(radians: 0),
                    clockwise: false)
        /*#-code-walkthrough(5.heartPulse)*/

        /*#-code-walkthrough(4.heartPulse)*/
        path.addCurve(to: CGPoint(x: rect.midX, y: rect.height),
                      control1: CGPoint(x: rect.width, y: rect.midY),
                      control2: CGPoint(x: rect.midX, y: rect.height*3/4))
        /*#-code-walkthrough(4.heartPulse)*/
        return path
    }
}


#Preview {
    HeartShape()
}
