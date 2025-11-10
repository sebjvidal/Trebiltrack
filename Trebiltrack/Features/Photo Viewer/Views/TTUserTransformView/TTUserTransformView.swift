//
//  TTUserTransformView.swift
//  Trebiltrack
//
//  Created by Seb Vidal on 10/11/2025.
//

import UIKit

class TTUserTransformView: UIView, UIScrollViewDelegate {
    // MARK: - Private Properties
    private var scrollView: UIScrollView!
    private var imageView: UIImageView!
    
    // MARK: - Public Properties
    var contentView: UIImageView {
        return imageView
    }
    
    var image: UIImage? {
        get {
            return imageView.image
        } set {
            imageView.image = newValue
        }
    }
    
    var maximumZoomScale: CGFloat {
        get {
            return scrollView.maximumZoomScale
        } set {
            scrollView.maximumZoomScale = newValue
        }
    }
    
    var minimumZoomScale: CGFloat {
        get {
            return scrollView.minimumZoomScale
        } set {
            scrollView.minimumZoomScale = newValue
        }
    }
    
    // MARK: - init(frame:)
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupScrollView()
        setupImageView()
    }
    
    // MARK: - init(coder:)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Methods
    private func setupScrollView() {
        scrollView = UIScrollView()
        scrollView.delegate = self
        scrollView.clipsToBounds = false
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.contentInsetAdjustmentBehavior = .never
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(scrollView)
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    private func setupImageView() {
        imageView = UIImageView()
        imageView.backgroundColor = .tertiarySystemFill
        imageView.cornerConfiguration = .uniformCorners(20)
        
        scrollView.addSubview(imageView)
    }
    
    // MARK: - Lifecycle
    override func layoutSubviews() {
        super.layoutSubviews()
        updateImageViewFrame()
        updateScrollViewContentSize()
        updateScrollViewContentInsets()
    }
    
    // MARK: - UIScrollViewDelegate
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }
    
    func scrollViewDidZoom(_ scrollView: UIScrollView) {
        updateScrollViewContentInsets()
    }
    
    func scrollViewDidEndZooming(_ scrollView: UIScrollView, with view: UIView?, atScale scale: CGFloat) {
        guard scrollView.isDragging == false else { return }
        scrollView.setZoomScale(1, animated: true)
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        scrollView.setZoomScale(1, animated: true)
    }
}

extension TTUserTransformView {
    // MARK: - Scroll View Helpers
    private func calculateImageViewSize() -> CGSize {
        return scrollView.bounds.size
    }
    
    private func updateImageViewFrame() {
        let transform = CGAffineTransform(scale: scrollView.zoomScale)
        let size = calculateImageViewSize().applying(transform)
        imageView.frame = CGRect(origin: .zero, size: size)
    }
    
    private func updateScrollViewContentSize() {
        let transform = CGAffineTransform(scale: scrollView.zoomScale)
        let size = calculateImageViewSize().applying(transform)
        scrollView.contentSize = size
    }
    
    private func updateScrollViewContentInsets() {
        let topInset = max((scrollView.bounds.height - scrollView.contentSize.height) * 0.5, 0)
        let leftInset = max((scrollView.bounds.width - scrollView.contentSize.width) * 0.5, 0)
        scrollView.contentInset = UIEdgeInsets(top: topInset, left: leftInset)
    }
}
