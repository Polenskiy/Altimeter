//
//  MapViewControllerOutput.swift
//	Where my children
//

protocol MapViewControllerOutput: BaseViewControllerOutput { 
    func onCompassControl()
    func onShareControl()
    func onPositionControl()
}
