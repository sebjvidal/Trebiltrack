//
//  TTPhotoPageViewController.swift
//  Trebiltrack
//
//  Created by Seb Vidal on 10/11/2025.
//

import UIKit

class TTPhotoPageViewController: TTViewController, UIPageViewControllerDelegate, UIPageViewControllerDataSource {
    // MARK: - Private Properties
    private var pageViewController: UIPageViewController!
    
    // MARK: - init(nibName:bundle:)
    override init(nibName: String?, bundle: Bundle?) {
        super.init(nibName: nibName, bundle: bundle)
        setupNavigationItem()
        setupToolbarItems()
        setupPageViewController()
    }
    
    // MARK: - init(coder:)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Methods
    private func setupNavigationItem() {
        navigationItem.title = "Melbourne, Australia"
        navigationItem.subtitle = "5 November 2025"
    }
    
    private func setupToolbarItems() {
        let previousBarButtonItem = UIBarButtonItem(title: "Previous")
        previousBarButtonItem.setTarget(self, action: #selector(previousBarButtonTapped))
        
        let nextBarButtonItem = UIBarButtonItem(title: "Next")
        nextBarButtonItem.setTarget(self, action: #selector(nextBarButtonTapped))
        
        toolbarItems = [previousBarButtonItem, .flexibleSpace(), nextBarButtonItem]
    }
    
    @objc private func previousBarButtonTapped(_ sender: UIButton) {
        let viewController = TTPhotoViewController()
        pageViewController.setViewControllers([viewController], direction: .reverse, animated: true)
    }
    
    @objc private func nextBarButtonTapped(_ sender: UIButton) {
        let viewController = TTPhotoViewController()
        pageViewController.setViewControllers([viewController], direction: .forward, animated: true)
    }
    
    private func setupPageViewController() {
        pageViewController = UIPageViewController(transitionStyle: .scroll)
        pageViewController.delegate = self
        pageViewController.dataSource = self
        pageViewController.setViewControllers([TTPhotoViewController()])
        pageViewController.view.translatesAutoresizingMaskIntoConstraints = false
        
        addChild(pageViewController)
        view.addSubview(pageViewController.view)
        pageViewController.didMove(toParent: self)
        
        NSLayoutConstraint.activate([
            pageViewController.view.topAnchor.constraint(equalTo: view.topAnchor),
            pageViewController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            pageViewController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            pageViewController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    // MARK: - UIPageViewControllerDataSource
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        return TTPhotoViewController()
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        return TTPhotoViewController()
    }
}
