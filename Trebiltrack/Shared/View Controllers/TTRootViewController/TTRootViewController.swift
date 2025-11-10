//
//  TTRootViewController.swift
//  Trebiltrack
//
//  Created by Seb Vidal on 10/11/2025.
//

import UIKit

class TTRootViewController: UINavigationController {
    // MARK: - Public Properties
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }
    
    // MARK: - init(nibName:bundle:)
    override init(nibName: String? = nil, bundle: Bundle? = nil) {
        super.init(nibName: nibName, bundle: bundle)
        setupNavigationController()
        setupMapViewController()
    }
    
    // MARK: - init(coder:)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Methods
    private func setupNavigationController() {
        isToolbarHidden = false
    }
    
    private func setupMapViewController() {
        let mapViewController = TTMapViewController()
        viewControllers = [mapViewController]
    }
}
