//
//  InfoBox.swift
//  
//
//  Created by Will Dale on 15/02/2021.
//

import SwiftUI

internal struct InfoBox<T>: ViewModifier where T: ChartData {
    
    @ObservedObject var chartData: T
    
    @State private var boxFrame   : CGRect    = CGRect(x: 0, y: 0, width: 0, height: 50)
    
    internal func body(content: Content) -> some View {
        VStack {
            switch chartData.chartStyle.infoBoxPlacement {
            case .floating:
                floating
            case .fixed:
                fixed
            case .header:
                EmptyView()
            }
            content
        }
    }
    
    var floating: some View {
        TouchOverlayBox(isTouchCurrent   : chartData.infoView.isTouchCurrent,
                        selectedPoints   : chartData.infoView.touchOverlayInfo,
                        specifier        : chartData.infoView.touchSpecifier,
                        valueColour      : chartData.chartStyle.infoBoxValueColour,
                        descriptionColour: chartData.chartStyle.infoBoxDescriptionColor,
                        boxFrame         : $boxFrame)
            .position(x: setBoxLocationation(touchLocation: chartData.infoView.positionX,
                                             boxFrame     : boxFrame,
                                             chartSize    : chartData.infoView.frame),
                      y: 15)
            .frame(height: 40)
    }

    
    var fixed: some View {
        LazyHGrid(rows: [GridItem(.flexible())]) {
            ForEach(chartData.infoView.touchOverlayInfo, id: \.self) { point in
                HStack {
                    Text("\(point.value, specifier: chartData.infoView.touchSpecifier)")
                        .font(.body)
                        .foregroundColor(chartData.chartStyle.infoBoxValueColour)
                    if let label = point.pointDescription {
                        Text(label)
                            .font(.body)
                            .foregroundColor(chartData.chartStyle.infoBoxDescriptionColor)
                    }
                }
            }
        }.frame(height: 40)
    }
    
    
    /// Sets the point info box location while keeping it within the parent view.
    /// - Parameters:
    ///   - boxFrame: The size of the point info box.
    ///   - chartSize: The size of the chart view as the parent view.
    internal func setBoxLocationation(touchLocation: CGFloat, boxFrame: CGRect, chartSize: CGRect) -> CGFloat {

        var returnPoint : CGFloat = .zero

        if touchLocation < chartSize.minX + (boxFrame.width / 2) {
            returnPoint = chartSize.minX + (boxFrame.width / 2)
        } else if touchLocation > chartSize.maxX - (boxFrame.width / 2) {
            returnPoint = chartSize.maxX - (boxFrame.width / 2)
        } else {
            returnPoint = touchLocation
        }
        return returnPoint + chartData.infoView.yAxisLabelWidth
    }
}

extension View {
    public func infoBox<T: ChartData>(chartData: T) -> some View {
        self.modifier(InfoBox(chartData: chartData))
    }
}
