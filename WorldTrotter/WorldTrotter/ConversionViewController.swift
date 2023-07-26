//
//  ConversionViewController.swift
//  WorldTrotter
//
//  Created by Banut Raul on 11.07.2023.
//

import UIKit

class ConversionViewController: UIViewController {
    
    @IBOutlet var celsiusLabel: UILabel!
    @IBOutlet var textField: UITextField!
    
    let numberFormater: NumberFormatter = {
        let nf = NumberFormatter()
        nf.numberStyle = .decimal
        nf.minimumFractionDigits = 0
        nf.maximumFractionDigits = 1
        return nf
    }()
    
    var fahrenheitValue: Measurement<UnitTemperature>? {
        didSet {
            updateCelsiusLabel()
        }
    }
    
    var celsiusValue: Measurement<UnitTemperature>? {
        if let fahrenheitValue = fahrenheitValue {
            return fahrenheitValue.converted(to: .celsius)
        } else {
            return nil
        }
    }
    
    func updateCelsiusLabel() {
        if let celsiusValue = celsiusValue {
            celsiusLabel.text = numberFormater.string(from: NSNumber(value: celsiusValue.value))
        } else {
            celsiusLabel.text = "???"
        }
    }
    
    @IBAction func fahrenheitDegreesDidChanged(_ textField: UITextField) {
        if let text = textField.text, let number = numberFormater.number(from: text) {
            fahrenheitValue = Measurement(value: number.doubleValue, unit: .fahrenheit)
        } else {
            fahrenheitValue = nil
        }
    }
    
    @IBAction func dismissKeyboard(_ sender: UITapGestureRecognizer) {
        textField.resignFirstResponder()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("ConversionViewController loaded its view.")
        
        updateCelsiusLabel()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.view.backgroundColor = UIColor.random
    }
    
    
    
        // MARK: - This
//        override func viewWillLayoutSubviews() {
//            let colorOne =  UIColor.purple.cgColor
//            let colorTwo = UIColor.blue.cgColor
//            let colorThree = UIColor.green.cgColor
//            let colorFour =  UIColor.yellow.cgColor
//            let colorFive = UIColor.orange.cgColor
//            let colorSix = UIColor.red.cgColor
//    
//            let gradientLayer = CAGradientLayer()
//            gradientLayer.colors = [colorOne, colorTwo, colorThree, colorFour, colorFive, colorSix]
//            gradientLayer.locations = [0.0, 0.2, 0.4, 0.6, 0.8, 1.0]
//            gradientLayer.frame = self.view.bounds
//    
//            self.view.layer.insertSublayer(gradientLayer, at: 0)
//        }
}

extension ConversionViewController: UITextFieldDelegate {
    func textField(
        _ textField: UITextField,
        shouldChangeCharactersIn range: NSRange,
        replacementString string: String
    ) -> Bool {
        let currentLocale = Locale.current
        let decimalSeparator = currentLocale.decimalSeparator ?? "."
        
        let existingTextHasDecimalSeparator = textField.text?.range(of: decimalSeparator)
        let replacementTextHasDecimalSeparator = string.range(of: decimalSeparator)
        
        if string.rangeOfCharacter(from: CharacterSet.letters) == nil {
            if existingTextHasDecimalSeparator != nil,
               replacementTextHasDecimalSeparator != nil {
                return false
            } else {
                return true
            }
        } else {
            return false
        }
    }
}

extension UIColor {
    static var random: UIColor {
        return UIColor(
            red: .random(in: 0...1),
            green: .random(in: 0...1),
            blue: .random(in: 0...1),
            alpha: 1.0
        )
    }
}
