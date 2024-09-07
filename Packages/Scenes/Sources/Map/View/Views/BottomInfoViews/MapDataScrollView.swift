//
//  File.swift
//  
//
//  Created by Daniil Polenskii on 11.08.2024.
//

import UIKit

final class MapDataScrollView: UIView {
    
    private var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.showsHorizontalScrollIndicator = false
        return scrollView
    }()
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = 32
        stackView.layoutMargins = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let fullMetricsView: MapMetricsView = {
        let view = MapMetricsView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let basicMetricsView: MapMetricsView = {
        let view = MapMetricsView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension MapDataScrollView {
    
    func setup() {
        configureScrollView()
        configureStackView()
        configureMapMetricsView()
    }
    
    func configureScrollView() {
        addSubview(scrollView)
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    
    func configureStackView() {
        scrollView.addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor)
        ])
    }
    
    func configureMapMetricsView() {
        stackView.addArrangedSubview(fullMetricsView)
        stackView.addArrangedSubview(basicMetricsView)
        NSLayoutConstraint.activate([
            fullMetricsView.heightAnchor.constraint(equalToConstant: 227),
            fullMetricsView.widthAnchor.constraint(equalToConstant: 280),
            basicMetricsView.heightAnchor.constraint(equalToConstant: 227),
            basicMetricsView.widthAnchor.constraint(equalToConstant: 280),
        ])
    }
}

extension MapDataScrollView {
    func updateLocation(with viewModel: MapViewController.MapInformationViewModel) {
        fullMetricsView.update(with: viewModel, type: .fullMetrics)
        basicMetricsView.update(with: viewModel, type: .baseMetrics)
    }
    
}