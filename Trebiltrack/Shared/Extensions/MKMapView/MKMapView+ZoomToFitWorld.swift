//
//  MKMapView+ZoomToFitWorld.swift
//  Trebiltrack
//
//  Created by Seb Vidal on 29/10/2025.
//

import MapKit
import Obfuscate

extension MKMapView {
    func zoomToFitWorld() {
        let mapLayerString = #Obfuscate("_mapLayer")
        let mapLayerSelector = NSSelectorFromString(mapLayerString)
        
        guard responds(to: mapLayerSelector) else { return }
        
        let mapLayer = value(forKey: mapLayerString) as? NSObject
        
        let updatePinchString = #Obfuscate("updatePinchWithFocusPoint:oldFactor:newFactor:")
        let updatePinchSelector = NSSelectorFromString(updatePinchString)
        
        guard let mapLayer, mapLayer.responds(to: updatePinchSelector) else { return }
        
        let type = (@convention(c) (NSObject, Selector, CGPoint, Double, Double) -> Void).self
        let implementation = mapLayer.method(for: updatePinchSelector)
        let method = unsafeBitCast(implementation, to: type)
        
        return method(mapLayer, updatePinchSelector, center, 20, 1)
    }
}
