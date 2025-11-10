//
//  TTPhotoViewController.swift
//  Trebiltrack
//
//  Created by Seb Vidal on 10/11/2025.
//

import UIKit

class TTPhotoViewController: TTViewController, UIScrollViewDelegate {
    // MARK: - Private Properties
    private var userTransformView: TTUserTransformView!
    
    // MARK: - init(nibName:bundle:)
    override init(nibName: String?, bundle: Bundle?) {
        super.init(nibName: nibName, bundle: bundle)
        setupUserTranformView()
    }

    // MARK: - init(coder:)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Methods
    private func setupUserTranformView() {
        userTransformView = TTUserTransformView()
        userTransformView.maximumZoomScale = 20
        userTransformView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(userTransformView)
        
        NSLayoutConstraint.activate([
            userTransformView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            userTransformView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            userTransformView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            // Temporary...
            userTransformView.heightAnchor.constraint(equalTo: userTransformView.widthAnchor, multiplier: 1.33)
        ])
    }
}
