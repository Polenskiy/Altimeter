//
//
//
//  MapViewControllerInput.swift
//	Where my children
//
protocol MapViewControllerInput: BaseViewControllerInput {
    func updateLocation(viewModelLocation: MapViewController.InformationViewModel.Location)
    func updateBarometer( viewModelBarometer: MapViewController.InformationViewModel.Barometer)
}
