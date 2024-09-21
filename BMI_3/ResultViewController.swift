//
//  ResultViewController.swift
//  BMI_3
//
//  Created by Nguyễn Văn Hiếu on 21/9/24.
//

import UIKit

class ResultViewController: UIViewController {
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!

    var bmiResult: Double?
//    var classification: String?

    override func viewDidLoad() {
        super.viewDidLoad()

        if let bmi = bmiResult {
            resultLabel.text = String(format: "%.1f", bmi)
        }
//        statusLabel.text = classification
    }

    @IBAction func backButtonTapped(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }


}
