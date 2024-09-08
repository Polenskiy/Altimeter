//
//  File.swift
//  
//
//  Created by Daniil Polenskii on 07.06.2024.
//

import MapKit

final class MapView: UIView {
    
    private let mapView = MKMapView()

    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupMapView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension MapView {
    func setupMapView() {
        addSubview(mapView)
        mapView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            mapView.topAnchor.constraint(equalTo: topAnchor),
            mapView.bottomAnchor.constraint(equalTo: bottomAnchor),
            mapView.leadingAnchor.constraint(equalTo: leadingAnchor),
            mapView.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
    }
}
