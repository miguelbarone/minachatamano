//
//  RegisterViewController.swift
//  Exemplo1
//
//  Created by Miguel Barone - MBA on 29/01/20.
//  Copyright © 2020 Miguel Barone - MBA. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {
    @IBOutlet weak var modelTextField: UITextField!
    @IBOutlet weak var brandTextField: UITextField!
    
    var viewModel: CarViewModel?
    
    init(viewModel: CarViewModel?, nibName:String? = nil){
        super.init(nibName: nibName, bundle: nil)
        self.viewModel = viewModel
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Detalhes"

        // Do any additional setup after loading the view.
    }
    @IBAction func didTapSave(_ sender: Any) {
        let car = Car(brand: brandTextField.text ?? "", name: modelTextField.text ?? "")
        viewModel?.addCar(car)
        viewModel?.refreshList()
        viewModel?.didFinishRegister()
        
    }
}
