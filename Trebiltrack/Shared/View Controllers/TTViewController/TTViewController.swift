//
//  TTViewController.swift
//  Trebiltrack
//
//  Created by Seb Vidal on 10/11/2025.
//

import UIKit

class TTViewController: UIViewController {
    // MARK: - init(nibName:bundle:)
    override init(nibName: String?, bundle: Bundle?) {
        super.init(nibName: nibName, bundle: bundle)
        setupView()
    }
    
    // MARK: - init(coder:)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Methods
    private func setupView() {
        view.backgroundColor = .systemBackground
    }
}
