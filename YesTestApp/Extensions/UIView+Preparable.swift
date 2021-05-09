//
//  UIView+Preparable.swift
//  YesTestApp
//
//  Created by Владислав Афанасьев on 09.05.2021.
//

import UIKit

protocol Preparable {}

extension Preparable where Self: UIView {
    func prepare(block: (Self) -> Void) -> Self {
        block(self)
        return self
    }
}

extension NSObject: Preparable {}
