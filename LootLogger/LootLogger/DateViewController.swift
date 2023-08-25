//
//  DateViewController.swift
//  LootLogger
//
//  Created by Banut Raul on 31.07.2023.
//

import UIKit

class DateViewController: UIViewController {

    @IBOutlet weak var datePicker: UIDatePicker!
    
    weak var detailViewController: DetailViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        detailViewController?.item.dateCreated = datePicker.date
    }
}
