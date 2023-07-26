//
//  ConversionProgViewController.swift
//  WorldTrotter
//
//  Created by Banut Raul on 13.07.2023.
//

import Foundation
import UIKit

class ConversionProgViewController: UIViewController {

    var stackView: UIStackView!
    
    override func loadView() {
        stackView = UIStackView()
        
        let label212 = UILabel()
        label212.text = "212"
        label212.textColor = .orange
        label212.font = .boldSystemFont(ofSize: 70.0)
        
        let labelFahrenheit = UILabel()
        labelFahrenheit.text = "degrees Fahrenheit"
        labelFahrenheit.font = .systemFont(ofSize: 46.0, weight: .thin)
        
        let labelReally = UILabel()
        labelReally.text = "is really"
        labelReally.font = .systemFont(ofSize: 60.0, weight: .medium)
        
        let label100 = UILabel()
        label100.text = "100"
        label100.textColor = .orange
        label100.font = .systemFont(ofSize: 65.0, weight: .heavy)
        
        let labelCelsius = UILabel()
        labelCelsius.text = "degrees Celsius"
        labelCelsius.font = .systemFont(ofSize: 48.0, weight: .thin)
        
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .equalCentering
        stackView.spacing = 50.0
        
        stackView.addArrangedSubview(label212)
        stackView.addArrangedSubview(labelFahrenheit)
        stackView.addArrangedSubview(labelReally)
        stackView.addArrangedSubview(label100)
        stackView.addArrangedSubview(labelCelsius)
        stackView.isLayoutMarginsRelativeArrangement = true
        
        view = stackView
        view.backgroundColor = .white
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.view.backgroundColor = UIColor.random
    }
}
