//
//  ContentView.swift
//  CustomShapesWithCurves
//
//  Created by ramil on 13.09.2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            ZStack {
                QuadSample()
                    .frame(width: 200, height: 200)
                    .offset(x: -30)
                    .foregroundColor(.red)
                
                QuadSampleReversed()
                    .frame(width: 200, height: 200)
                    .offset(x: 30)
                    .foregroundColor(.red)
            }.offset(y: 80)
            
            ArcSample()
                .stroke(lineWidth: 5)
                .frame(width: 200, height: 200)
            
            ShapeWithArc()
                //.stroke(lineWidth: 5)
                .frame(width: 200, height: 200)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ArcSample: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: CGPoint(x: rect.midX, y: rect.midY))
            path.addArc(
                center: CGPoint(x: rect.midX, y: rect.midY),
                radius: rect.height / 2,
                startAngle: Angle(degrees: -20),
                endAngle: Angle(degrees: 20),
                clockwise: true
            )
        }
    }
}

struct ShapeWithArc: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: CGPoint(x: rect.minX, y: rect.minY))
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.midY))
            //path.addLine(to: CGPoint(x: rect.midX, y: rect.maxY))
            path.addArc(
                center: CGPoint(x: rect.midX, y: rect.midY),
                radius: rect.height / 2,
                startAngle: Angle(degrees: 0),
                endAngle: Angle(degrees: 180),
                clockwise: false
            )
            path.addLine(to: CGPoint(x: rect.minX, y: rect.midY))
        }
    }
}

struct QuadSample: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: .zero)
            path.addQuadCurve(
                to: CGPoint(x: rect.midX, y: rect.midY),
                control: CGPoint(x: rect.minX, y: rect.maxY)
            )
        }
    }
}

struct QuadSampleReversed: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: CGPoint(x: rect.maxX, y: rect.minY))
            path.addQuadCurve(
                to: CGPoint(x: rect.midX, y: rect.midY),
                control: CGPoint(x: rect.maxX, y: rect.maxY)
            )
        }
    }
}
