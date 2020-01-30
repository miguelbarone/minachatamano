//
//  CarViewModel.swift
//  Exemplo1
//
//  Created by Miguel Barone - MBA on 29/01/20.
//  Copyright © 2020 Miguel Barone - MBA. All rights reserved.
//

import Foundation

protocol CarViewModelDelegate: class {
    func didSelectRegister(_ viewModel: CarViewModel)
    func didSelectRegisterConfirm(_ viewModel: CarViewModel)
    func didSelectItem(_ car: Car)
}

protocol CarViewModelViewContract: class {
    func didFinishRegister()
}

class CarViewModel {
    var cars: [Car] = []
    
    weak var delegateView: CarViewModelViewContract?
    weak var delegate: CarViewModelDelegate?
    
    init () {
        initCars()
    }
    func initCars() {
        let cars = [
            Car(brand: "Iteris", name: "Volkswagen"),
            Car(brand: "Fiat", name: "Ferrari"),
            Car(brand: "Banana", name: "SAAS"),
            Car(brand: "Iteris", name: "Volkswagen"),
            Car(brand: "Iteris", name: "FiiF"),
            Car(brand: "Donga", name: "Sai"),
            Car(brand: "Bomso", name: "DDDDDDDD")
        ]
        
        self.cars.append(contentsOf: cars)
    }
    
    func addCar(_ car: Car){
        self.cars.append(car)
    }
    
    func callRegisterCar() {
        delegate?.didSelectRegister(self)
    }
    
    func refreshList() {
        delegateView?.didFinishRegister()
    }
    
    func didFinishRegister () {
        delegate?.didSelectRegisterConfirm(self)
    }
    func showDetails(index: IndexPath) {
        let car = cars[index.row]
        delegate?.didSelectItem(car)
    }
}
