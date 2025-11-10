//
//  TTMapViewController.swift
//  Trebiltrack
//
//  Created by Seb Vidal on 25/10/2025.
//

import UIKit
import MapKit

class TTMapViewController: TTViewController, MKMapViewDelegate {
    // MARK: - Private Properties
    private var mapView: MKMapView!
    private var mapViewNeedsZoomToFitWorld: Bool = true
    
    // MARK: - init(nibName:bundle:)
    override init(nibName: String?, bundle: Bundle?) {
        super.init(nibName: nibName, bundle: bundle)
        setupToolbarItem()
        setupMapView()
    }
    
    // MARK: - init(coder:)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Properties
    private func setupToolbarItem() {
        let mostRecentBarButtonItem = UIBarButtonItem(title: "Most Recent")
        mostRecentBarButtonItem.setTarget(self, action: #selector(mostRecentBarButtonTapped))
        
        toolbarItems = [mostRecentBarButtonItem]
    }
    
    @objc private func mostRecentBarButtonTapped(_ sender: UIBarButtonItem) {
        let photoPageViewController = TTPhotoPageViewController()
        navigationController?.pushViewController(photoPageViewController, animated: true)
    }
    
    private func setupMapView() {
        mapView = MKMapView()
        mapView.showsCompass = false
        mapView.preferredConfiguration = .realisticImagery
        mapView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(mapView)
        
        NSLayoutConstraint.activate([
            mapView.topAnchor.constraint(equalTo: view.topAnchor),
            mapView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mapView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            mapView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private func zoomMapViewToFitWorldIfNeeded() {
        guard mapViewNeedsZoomToFitWorld else { return }
        mapViewNeedsZoomToFitWorld = false
        mapView.zoomToFitWorld()
    }
    
    // MARK: - Lifecycle
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        zoomMapViewToFitWorldIfNeeded()
    }
}
