//
//  Leve.swift
//  BMI_3
//
//  Created by Nguyễn Văn Hiếu on 21/9/24.
//

import Foundation

// Chuẩn Obj USA
enum Level: String {
    case severeThinness = "Severe Thinness"
    case moderateThinness = "Moderate Thinness"
    case mildThinness = "Mild Thinness"
    case normal = "Normal"
    case overweight = "Overweight"
    case obeseClassI = "Obese Class I"
    case obeseClassII = "Obese Class II"
    case obeseClassIII = "Obese Class III"
    
    var bmiRange: ClosedRange<Double>? {
        switch self {
        case .severeThinness:
            return nil
        case .moderateThinness:
            return 16.0...17.0
        case .mildThinness:
            return 17.0...18.5
        case .normal:
            return 18.5...25.0
        case .overweight:
            return 25.0...30.0
        case .obeseClassI:
            return 30.0...35.0
        case .obeseClassII:
            return 35.0...40.0
        case .obeseClassIII:
            return nil
        }
    }
}
