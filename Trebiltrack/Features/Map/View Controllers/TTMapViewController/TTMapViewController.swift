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
    
    // MARK: - Lifecycle
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        mapView.zoomToFitWorld()
    }
}
