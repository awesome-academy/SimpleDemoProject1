//
//  ReusableView.swift
//  SimpleDemoProject1
//
//  Created by trinh.ngoc.nam on 26/02/2022.
//

import UIKit

protocol ReusableView {
    static var reuseIdentifier: String { get }
    static var nib: UINib { get }
}

extension ReusableView {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
    
    static var nib: UINib {
        return UINib(nibName: reuseIdentifier, bundle: nil)
    }
}
