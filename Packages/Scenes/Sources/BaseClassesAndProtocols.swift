//
//  BaseAssembly.swift
//  Where my children
//
//  Created by Jura Moshkov on 13/08/2019.
//  Copyright © 2019 Line App. All rights reserved.
//
import UIKit

public protocol BaseViewControllerInput: AnyObject {
    var viewController: UIViewController { get }
    
    func setupInitialState()
}

extension BaseViewControllerInput where Self: UIViewController {
    var viewController: UIViewController {
        return self
    }
}

public protocol BaseViewControllerOutput: AnyObject {
    func didTriggerViewReadyEvent()
}

public protocol BaseModuleInput: AnyObject {
    var inputView: BaseViewControllerInput! { get }
    
    var viewController: UIViewController { get }
}

extension BaseModuleInput {
    var viewController: UIViewController {
        return inputView.viewController
    }
}

class BasePresenter: BaseViewControllerOutput {
    
    // Используя текущую библиотеку сборки, view уничтожалась
    // Еще не показавшись на экране(при этом сам модуль был создан)
    // Поэтому были введены дополнительные базовые классы, для удобства роутинга
    // И презентации
    private var strongView: Any?
    
    func setupStrongView(_ view: Any?) {
        self.strongView = view
    }
    
    func didTriggerViewReadyEvent() {
        strongView = nil
    }    
}
