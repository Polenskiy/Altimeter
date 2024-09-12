//
//
//
//  MapViewControllerInput.swift
//	Where my children
//
protocol MapViewControllerInput: BaseViewControllerInput {
//    func updateData(
//        viewModelBarometer: MapViewController.InformationViewModel.Barometer,
//        viewModelLocation: MapViewController.InformationViewModel.Location
//    )
    
    //TODO: Сделать два метода для вывода информации
    func updateLocation(viewModelLocation: MapViewController.InformationViewModel.Location)
    func updateBarometer( viewModelBarometer: MapViewController.InformationViewModel.Barometer)
}
