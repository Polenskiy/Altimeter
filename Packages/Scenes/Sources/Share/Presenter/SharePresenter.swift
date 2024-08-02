//
//
//
//  SharePresenter.swift
//	Where my children
//
import CoreLocation

final class SharePresenter: BasePresenter {
    
    var interactor: ShareInteractorInput!
    weak var view: ShareViewControllerInput! {
        didSet {
            setupStrongView(view)
        }
    }
    var router: ShareRouterInput!
    
    // MARK: - Functions
    override func didTriggerViewReadyEvent() {
        super.didTriggerViewReadyEvent()
        view.setupInitialState()
    }
}

// MARK: - ShareModuleInput
extension SharePresenter: ShareModuleInput {
    var inputView: BaseViewControllerInput! {
        return view
    }
}

// MARK: - ShareInteractorOutput
extension SharePresenter: ShareInteractorOutput {
    func authorizationForbiddenForPhotoLibrary() {
        router.needPhotoLibraryPermissionAlert()
    }
    
    func authorizationForbiddenForCamera() {
        router.needCameraPermissionAlert()
    }
}

// MARK: - ShareViewControllerOutput
extension SharePresenter: ShareViewControllerOutput {
    
    func cameraButtonTapped() {
        if interactor.canOpenCamera() {
            router.showImagePicker(sourceType: .camera) { [weak self] photo in
                self?.view.didChoose(image: photo)
                self?.setLocation()
            }
        } else {
            interactor.requestPermissionCamera { _ in
                
            }
        }
    }
    
    
    func addPhotoButtonTapped() {
        if interactor.canOpenPhotoLibrary() {
            router.showImagePicker(sourceType: .photoLibrary) { [weak self] photo in
                guard let self else {
                    return
                }
                self.view.didChoose(image: photo)
                self.setLocation()
            }
        } else {
            interactor.requestPermissionPhotoLibrary { [weak self] hasPermission in
                if hasPermission {
                    self?.addPhotoButtonTapped()
                } else {
                    self?.interactor.requestAuthorizationIfForbiddenPhotoLibrary()
                }
            }
        }
    }
    
    func photoButtonTapped() {
        router.showActivityViewController()
    }
}

private extension SharePresenter {
    func setLocation() {
        guard let location = self.interactor.getLocation() else {
            return
        }
        let geocoder = CLGeocoder()
        geocoder.reverseGeocodeLocation(location) { [weak self] (placemarks, error) in
            guard let self = self, let placemark = placemarks?.first, error == nil else { return }
            
            let addressComponents = [
                placemark.thoroughfare,
                placemark.country,
                placemark.locality
            ].compactMap { $0 }
            
            let address = addressComponents.joined(separator: ", ")
            let viewModel = ShareViewController.AddressViewModel(
                altitude: location.verticalAccuracy.description,
                latitude: location.coordinate.latitude.description,
                longitude: location.coordinate.longitude.description,
                address: address
            )
            
            self.view.updateLocation(with: viewModel)
        }
    }
}
