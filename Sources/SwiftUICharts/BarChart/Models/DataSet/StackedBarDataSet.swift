//
//  StackedBarDataSet.swift
//  
//
//  Created by Will Dale on 18/04/2021.
//

import SwiftUI

/**
 Main data set for a stacked bar chart.
 */
public struct StackedBarDataSets: CTMultiDataSetProtocol {
    
    public let id: UUID = UUID()
    public var dataSets: [StackedBarDataSet]
    public var maxValue: Double = 0.0
    
    /// Initialises a new data set for a Stacked Bar Chart.
    public init(dataSets: [StackedBarDataSet]) {
        self.dataSets = dataSets
        var x = 0.0
        for dataSet in dataSets {
            x = dataSet.maxValue > x ? dataSet.maxValue : x
        }
        self.maxValue = x
    }
}

/**
 Individual data sets for stacked bars charts.
 */
public struct StackedBarDataSet: CTMultiBarChartDataSet {
    
    public let id: UUID = UUID()
    public var dataPoints: [StackedBarDataPoint]
    public var setTitle: String
    /// Used to statically calculate height
    public var maxValue: Double = 0.0
    
    /// Initialises a new data set for a Stacked Bar Chart.
    public init(
        dataPoints: [StackedBarDataPoint],
        setTitle: String = ""
    ) {
        self.dataPoints = dataPoints
        self.setTitle = setTitle
        let sum = dataPoints
            .map { $0.value}
            .reduce(0, +)
        self.maxValue = sum > self.maxValue ? sum : self.maxValue
    }
    
    public typealias ID = UUID
    public typealias DataPoint = StackedBarDataPoint
}
