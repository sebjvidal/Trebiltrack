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
        visibleMapRect = .world
        
        let mapLayerString = #Obfuscate("_mapLayer")
        let mapLayerSelector = NSSelectorFromString(mapLayerString)
        
        guard responds(to: mapLayerSelector) else { return }
        
        let mapLayer = value(forKey: mapLayerString) as? NSObject
        
        let updatePinchString = #Obfuscate("updatePinchWithFocusPoint:oldFactor:newFactor:")
        let updatePinchSelector = NSSelectorFromString(updatePinchString)
        
        guard let mapLayer, mapLayer.responds(to: updatePinchSelector) else { return }
        
        let updatePinchType = (@convention(c) (NSObject, Selector, CGPoint, Double, Double) -> Void).self
        let updatePinchImplementation = mapLayer.method(for: updatePinchSelector)
        let updatePinchMethod = unsafeBitCast(updatePinchImplementation, to: updatePinchType)
        
        return updatePinchMethod(mapLayer, updatePinchSelector, center, 20, 1)
    }
}
