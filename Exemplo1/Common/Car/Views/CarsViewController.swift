//
//  ViewController.swift
//  Exemplo1
//
//  Created by Miguel Barone - MBA on 29/01/20.
//  Copyright © 2020 Miguel Barone - MBA. All rights reserved.
//

import UIKit

class CarsViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
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
        
        setup()
        
    }
    
    func setup() {
        tableView.delegate = self
        tableView.dataSource = self
        viewModel?.delegateView = self
        
        self.title = "Carros"
        let rightButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(navigateToRegister))
        self.navigationItem.rightBarButtonItem = rightButtonItem
    }
    
    @objc func navigateToRegister() {
       viewModel?.callRegisterCar()
    }
    
}

extension CarsViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.cars.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") ?? UITableViewCell(style: .default, reuseIdentifier: "cell")
        cell.textLabel?.text = "\(viewModel?.cars[indexPath.row].brand ?? "") - \(viewModel?.cars[indexPath.row].name ?? "")"
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel?.showDetails(index: indexPath)
    }
    
    
}

extension CarsViewController: CarViewModelViewContract {
    func didFinishRegister() {
        tableView.reloadData()
    }
    
    
}
