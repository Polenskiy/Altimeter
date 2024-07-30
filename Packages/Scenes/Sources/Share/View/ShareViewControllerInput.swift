//
//
//
//  ShareViewControllerInput.swift
//	Where my children
//
import UIKit

protocol ShareViewControllerInput: BaseViewControllerInput { 
    
    func didChoose(image: UIImage)
    func updateLocation(with viewModel: ShareViewController.AddressViewModel)
}
