//
//  CarCoordinator.swift
//  Exemplo1
//
//  Created by Miguel Barone - MBA on 29/01/20.
//  Copyright © 2020 Miguel Barone - MBA. All rights reserved.
//

import UIKit

class CarCoordinator: BaseCoordinator {
    
    var window: UIWindow
    let viewModel: CarViewModel
    var view: UIViewController?
    var navigation: UINavigationController?
    
    init(window: UIWindow) {
        self.window = window
        self.viewModel = CarViewModel()
        self.viewModel.delegate = self
    }
    func start() {
        self.view = CarsViewController(viewModel: viewModel)
        navigation = UINavigationController(rootViewController: view!)
        window.rootViewController = navigation
        window.makeKeyAndVisible()
    }
    
    func stop() {
        
    }
}

extension CarCoordinator: CarViewModelDelegate {
    func didSelectItem(_ car: Car) {
        let viewModel = CarDetailsViewModel(car: car)
        view = DetailsViewController(viewModel: viewModel)
        navigation?.pushViewController(view!, animated: true)
    }
    
    func didSelectRegister(_ viewModel: CarViewModel) {
        view = RegisterViewController(viewModel: viewModel)
        navigation?.pushViewController(view!, animated: true)
    }
    
    func didSelectRegisterConfirm(_ viewModel: CarViewModel) {
        navigation?.popViewController(animated: true)
    }
}
