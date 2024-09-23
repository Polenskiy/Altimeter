//
//
//
//  MapViewControllerInput.swift
//	Where my children
//
protocol MapViewControllerInput: BaseViewControllerInput {
    func updateLocation(viewModel: MapViewController.InformationViewModel.Location)
    func updateBarometer(viewModel: MapViewController.InformationViewModel.Barometer)
}
