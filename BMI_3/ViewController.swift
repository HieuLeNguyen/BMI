//
//  ViewController.swift
//  BMI_3
//
//  Created by Nguyễn Văn Hiếu on 20/9/24.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var menuBarView: UIView!
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var barButton: UIBarButtonItem!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var maleView: UIView! // button
    @IBOutlet weak var femaleView: UIView! // button
    @IBOutlet weak var heightView: UIView!
    @IBOutlet weak var weightView: UIView!
    @IBOutlet weak var ageView: UIView!
    @IBOutlet weak var lineWeightButton: UIButton!
    @IBOutlet weak var plusWeightButton: UIButton!
    @IBOutlet weak var lineAgeButton: UIButton!
    @IBOutlet weak var plusAgeButton: UIButton!
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var valueHeightLabel: UILabel!
    @IBOutlet weak var valueWeightLabel: UILabel!
    @IBOutlet weak var valueAgeLabel: UILabel!
    
    var weightTimer: Timer?
    var ageTimer: Timer?
    
    var titleNames = ["History"]
    var status = ["Normal", "OverW", "UnderW", "Obesity"]
    var results = ["22.2", "23", "50", "42"]
    var createdTime = ["22/09/2023", "22/09/2023", "22/09/2023", "22/09/2023"]
    
    var isShow: Bool = false
    
    var currentValueWeight: Int = 74
    var minValueWeight: Int = 0
    var maxValueWeight: Int = 200
    
    var currentValueAge: Int = 19
    var minValueAge: Int = 0
    var maxValueAge: Int = 120
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        registerTableView()
        createButtonWithUIView(maleView)
        createButtonWithUIView(femaleView)
        
        // Action Weight
        plusWeightButton.addTarget(self, action: #selector(startIncreaseWeight), for: .touchDown)
        plusWeightButton.addTarget(self, action: #selector(stopWeightChange), for: [.touchUpInside, .touchUpOutside])
        
        lineWeightButton.addTarget(self, action: #selector(startDecreaseWeight), for: .touchDown)
        lineWeightButton.addTarget(self, action: #selector(stopWeightChange), for: [.touchUpInside, .touchUpOutside])

        // Action Age
        plusAgeButton.addTarget(self, action: #selector(startIncreaseAge), for: .touchDown)
        plusAgeButton.addTarget(self, action: #selector(stopAgeChange), for: [.touchUpInside, .touchUpOutside])

        lineAgeButton.addTarget(self, action: #selector(startDecreaseAge), for: .touchDown)
        lineAgeButton.addTarget(self, action: #selector(stopAgeChange), for: [.touchUpInside, .touchUpOutside])


    }
    
    // MARK: - Weight
        @objc private func startIncreaseWeight() {
            plusWeightButton.backgroundColor = .lightGray
            weightTimer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(increaseWeight), userInfo: nil, repeats: true)
        }

        @objc private func startDecreaseWeight() {
            lineWeightButton.backgroundColor = .lightGray
            weightTimer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(decreaseWeight), userInfo: nil, repeats: true)
        }

        @objc private func stopWeightChange() {
            weightTimer?.invalidate()
            plusWeightButton.backgroundColor = UIColor(red: 29/255.0, green: 31/255.0, blue: 49/255.0, alpha: 1.0)
            lineWeightButton.backgroundColor = UIColor(red: 29/255.0, green: 31/255.0, blue: 49/255.0, alpha: 1.0)
        }

        @objc private func increaseWeight() {
            if currentValueWeight < maxValueWeight {
                currentValueWeight += 1
                valueWeightLabel.text = "\(currentValueWeight)"
            }
        }

        @objc private func decreaseWeight() {
            if currentValueWeight > minValueWeight {
                currentValueWeight -= 1
                valueWeightLabel.text = "\(currentValueWeight)"
            }
        }

        // MARK: - Age
        @objc private func startIncreaseAge() {
            plusAgeButton.backgroundColor = .lightGray
            ageTimer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(increaseAge), userInfo: nil, repeats: true)
        }

        @objc private func startDecreaseAge() {
            lineAgeButton.backgroundColor = .lightGray
            ageTimer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(decreaseAge), userInfo: nil, repeats: true)
        }

        @objc private func stopAgeChange() {
            plusAgeButton.backgroundColor = UIColor(red: 29/255.0, green: 31/255.0, blue: 49/255.0, alpha: 1.0)
            lineAgeButton.backgroundColor = UIColor(red: 29/255.0, green: 31/255.0, blue: 49/255.0, alpha: 1.0)
            ageTimer?.invalidate()
        }

        @objc private func increaseAge() {
            if currentValueAge < maxValueAge {
                currentValueAge += 1
                valueAgeLabel.text = "\(currentValueAge)"
            }
        }

        @objc private func decreaseAge() {
            if currentValueAge > minValueAge {
                currentValueAge -= 1
                valueAgeLabel.text = "\(currentValueAge)"
            }
        }

    //MARK: - Create action for view
    private func createButtonWithUIView(_ uiView: UIView) {
        let tapGesture = UITapGestureRecognizer(target: self, action:  #selector(tapButtonAC))
        uiView.addGestureRecognizer(tapGesture)
        uiView.isUserInteractionEnabled = true
    }
    
    @objc private func tapButtonAC(_ sender: UITapGestureRecognizer) {
        guard let selectedView = sender.view else {return}
        resetAllViews()
        highlightView(selectedView)
        
        // selectedView == maleView ? "male" : "female"
    }
    
    private func resetAllViews() {
        let views = [maleView, femaleView]
        for view in views {
            view?.alpha = 0.4
        }
    }
    
    private func highlightView(_ view: UIView) {
        view.alpha = 1
    }

    
    //MARK: - Register for table view menubar
    private func registerTableView() {
        tableView.register(UINib(nibName: "MenuBarTableViewCell", bundle: nil), forCellReuseIdentifier: "MenuBarTableViewCell")
    }
    
    //MARK: - Style for view
    private func setupLayout() {
        //style
        let views = [maleView, femaleView, heightView, ageView]
        for view in views {
            view?.layer.cornerRadius = 6
            view?.layer.masksToBounds = true
        }

        lineWeightButton.layer.cornerRadius = lineWeightButton.frame.width / 2
        plusWeightButton.layer.cornerRadius = plusWeightButton.frame.width / 2
        lineAgeButton.layer.cornerRadius = lineAgeButton.frame.width / 2
        plusAgeButton.layer.cornerRadius = plusAgeButton.frame.width / 2
        
        //default:
        valueHeightLabel.text = "183"
        maleView.alpha = 0.4
        femaleView.alpha = 0.4
        valueAgeLabel.text = "19"
        valueWeightLabel.text = "74"
        maleView.alpha = 1
    }
    
    private func calculateBMI(
        withHeight height: Int,
        withWeight weight: Int
    ) -> Double {
        if height <= 0 || weight <= 0 {
            return 0.0
        } else {
            return Double((weight*10000)/(height*height))
        }
    }
    
    private func classify(_ bmi: Double) -> Level? {
        switch bmi {
        case ..<16:
            return .severeThinness
        case 16..<17:
            return .moderateThinness
        case 17..<18.8:
            return .mildThinness
        case 18.5..<25:
            return .normal
        case 25..<30:
            return .overweight
        case 30..<35:
            return .obeseClassI
        case 35..<40:
            return .obeseClassII
        case 40...:
            return .obeseClassIII
        default:
            return nil
        }
    }
    
    @IBAction func heightSliderAC(_ sender: UISlider) {
        valueHeightLabel.text = "\(Int(sender.value))"
    }
    
    @IBAction func menuButtonTapped(_ sender: Any) {
        if isShow {
            barButton.image = UIImage(named: "close")
            menuBarView.isHidden = false
            mainView.alpha = 0.4
            UIView.animate(withDuration: 1) {
                self.view.layoutIfNeeded()
            }
        } else {
            barButton.image = UIImage(named: "sort")
            menuBarView.isHidden = true
            mainView.alpha = 1
            UIView.animate(withDuration: 1) {
                self.view.layoutIfNeeded()
            }
        }
        isShow.toggle()
    }
    
    @IBAction func tapCalculate(_ sender: Any) {
        let height: Int? = Int(valueHeightLabel.text!)
        let weight: Int? = Int(valueWeightLabel.text!)
        guard let height = height, let weight = weight else { return }
        
        let bmi = calculateBMI(withHeight: height, withWeight: weight)
//        let classificationResult = classify(bmi)!

        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let resultVC = storyboard.instantiateViewController(withIdentifier: "ResultViewController") as? ResultViewController {
            resultVC.bmiResult = bmi
//            resultVC.classification = classificationResult
            navigationController?.pushViewController(resultVC, animated: true)
        }
    }
    
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor(red: 29/255.0, green: 31/255.0, blue: 51/255.0, alpha: 1.0)
        let label = UILabel()
        label.text = "Saved"
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.frame = CGRect(x: 16, y: 5, width: tableView.frame.width - 32, height: 25)
        headerView.addSubview(label)
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 35
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return results.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MenuBarTableViewCell") as! MenuBarTableViewCell
        cell.createDate.text = createdTime[indexPath.row]
        cell.statusLabel.text = status[indexPath.row]
        cell.heightLabel.text = "180"
        cell.weightLabel.text = "70"
        cell.ageLabel.text = "24"
        cell.genderLabel.text = "Male"
        cell.resultLabel.text = results[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}
