//
//  AppCoordinator.swift
//  Exemplo1
//
//  Created by Miguel Barone - MBA on 29/01/20.
//  Copyright © 2020 Miguel Barone - MBA. All rights reserved.
//

import UIKit

class AppCoordinator: BaseCoordinator {
    
    var window: UIWindow
    var carCoordinator: CarCoordinator?
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        showCars()
    }
    
    func stop() {
        
    }
    
    func showCars() {
        carCoordinator = CarCoordinator(window: window)
        carCoordinator?.start()
    }
}
