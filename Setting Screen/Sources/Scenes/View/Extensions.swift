//
//  Extensions.swift
//  Setting Screen
//
//  Created by Serhii  on 08/10/2022.
//

import UIKit

extension UITextField {
    func setLeftIcon(_ image: UIImage?) {
        let iconView = UIImageView(frame: CGRect(x: 5, y: 0, width: 20, height: 20))
        iconView.image = image
        let iconContainerView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 30, height: 20))
        iconContainerView.addSubview(iconView)
        leftView = iconContainerView
        leftViewMode = .always
    }
}
