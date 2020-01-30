//
//  DetailsViewController.swift
//  Exemplo1
//
//  Created by Miguel Barone - MBA on 29/01/20.
//  Copyright © 2020 Miguel Barone - MBA. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {
    @IBOutlet weak var labelModel: UILabel!
    @IBOutlet weak var labelBrand: UILabel!
    
    var viewModel: CarDetailsViewModel?
    
    init(viewModel: CarDetailsViewModel?, nibName:String? = nil){
        super.init(nibName: nibName, bundle: nil)
        self.viewModel = viewModel
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    func setup() {
        labelModel.text = viewModel?.car.name
        labelBrand.text = viewModel?.car.brand
    }
}
