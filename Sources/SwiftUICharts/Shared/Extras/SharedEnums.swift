//
//  Enums.swift
//  
//
//  Created by Will Dale on 10/01/2021.
//

import Foundation

// MARK: - ChartViewData
/**
 The type of `DataSet` being used
 ```
 case single // Single data set - i.e LineDataSet
 case multi // Multi data set - i.e MultiLineDataSet
 ```
 
 - Tag: DataSetType
 */
public enum DataSetType {
    case single
    case multi
}

/**
 The type of chart being used.
 ```
 case line // Line Chart Type
 case bar // Bar Chart Type
 case pie // Pie Chart Type
 ```
 
 - Tag: ChartType
 */
public enum ChartType {
    /// Line Chart Type
    case line
    /// Bar Chart Type
    case bar
    /// Pie Chart Type
    case pie
}

// MARK: - Style
/**
 Type of colour styling.
 ```
 case colour // Single Colour
 case gradientColour // Colour Gradient
 case gradientStops // Colour Gradient with stop control
 ```
 
 - Tag: ColourType
 */
public enum ColourType {
    /// Single Colour
    case colour
    /// Colour Gradient
    case gradientColour
    /// Colour Gradient with stop control
    case gradientStops
}

// MARK: - TouchOverlay
/**
 Placement of the data point information panel when touch overlay modifier is applied.
 ```
 case floating // Follows input across the chart.
 case fixed // Centered in view.
 case header // Fix in the Header box. Must have .headerBox().
 ```
 
 - Tag: InfoBoxPlacement
 */
public enum InfoBoxPlacement {
    /// Follows input across the chart.
    case floating
    /// Centered in view.
    case fixed
    /// Fix in the Header box. Must have .headerBox().
    case header
}


/**
 Where the marker lines come from to meet at a specified point.
 ```
 case none // No overlay markers.
 case rectangle // Rounded rectangle.
 case vertical // Vertical line from top to bottom.
 case full // Full width and height of view intersecting at touch location.
 case bottomLeading // From bottom and leading edges meeting at touch location.
 case bottomTrailing // From bottom and trailing edges meeting at touch location.
 case topLeading // From top and leading edges meeting at touch location.
 case topTrailing // From top and trailing edges meeting at touch location.

 ```
 
 - Tag: MarkerType
 */
public enum MarkerType {
    /// No overlay markers.
    case none
    /// Rounded rectangle.
    case rectangle
    /// Vertical line from top to bottom.
    case vertical(attachment: MarkerAttachemnt)
    /// Full width and height of view intersecting at a specified point.
    case full(attachment: MarkerAttachemnt)
    /// From bottom and leading edges meeting at a specified point.
    case bottomLeading(attachment: MarkerAttachemnt)
    /// From bottom and trailing edges meeting at a specified point.
    case bottomTrailing(attachment: MarkerAttachemnt)
    /// From top and leading edges meeting at a specified point.
    case topLeading(attachment: MarkerAttachemnt)
    /// From top and trailing edges meeting at a specified point.
    case topTrailing(attachment: MarkerAttachemnt)
}

public enum BarMarkerType {
    /// No overlay markers.
    case none
    /// Vertical line from top to bottom.
    case vertical
    /// Full width and height of view intersecting at a specified point.
    case full
    /// From bottom and leading edges meeting at a specified point.
    case bottomLeading
    /// From bottom and trailing edges meeting at a specified point.
    case bottomTrailing
    /// From top and leading edges meeting at a specified point.
    case topLeading
    /// From top and trailing edges meeting at a specified point.
    case topTrailing
}
