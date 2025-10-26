//
//  TTMapViewController.swift
//  Trebiltrack
//
//  Created by Seb Vidal on 25/10/2025.
//

import UIKit
import MapKit

class TTMapViewController: UIViewController, MKMapViewDelegate {
    private var mapView: MKMapView!
    
    override init(nibName: String?, bundle: Bundle?) {
        super.init(nibName: nibName, bundle: bundle)
        setupMapView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupMapView() {
        let configuration = MKImageryMapConfiguration(elevationStyle: .realistic)
        
        mapView = MKMapView()
        mapView.delegate = self
        mapView.preferredConfiguration = configuration
        mapView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(mapView)
        
        NSLayoutConstraint.activate([
            mapView.topAnchor.constraint(equalTo: view.topAnchor),
            mapView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mapView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            mapView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
            let origin = MKMapPoint(x: 81612413.71084598, y: 43383645.564860016)
            let size = MKMapSize(width: 105381893.0065825, height: 189792266.17112705)
            let rect = MKMapRect(origin: origin, size: size)
            mapView.visibleMapRect = rect
        })
    }
    
    // MARK: - MKMapViewDelegate
    func mapViewDidChangeVisibleRegion(_ mapView: MKMapView) {
        print(mapView.visibleMapRect, "\n\n")
    }
}
