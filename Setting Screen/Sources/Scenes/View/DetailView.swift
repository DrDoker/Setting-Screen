//
//  DetailView.swift
//  Setting Screen
//
//  Created by Serhii  on 04/10/2022.
//

import UIKit
import SnapKit

class DetailView: UIView {

    // MARK: - Outlets

    private lazy var iconView: UIView = {
        let view = UIView()
        view.clipsToBounds = true
        view.layer.cornerRadius = 20
        view.tintColor = .white
        return view
    }()

    private lazy var icon: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.tintColor = .white
        return imageView
    }()

    private lazy var detailTitleText: UILabel = {
        let lable = UILabel()
        lable.textColor = .black
        lable.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        return lable
    }()

    //MARK: - Initializers

    init() {
        super.init(frame: .zero)
        commonInit()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }

    private func commonInit() {
        backgroundColor = .white

        setupHierarchy()
        setupLayout()
    }

    // MARK: - Setup

    private func setupHierarchy() {
        addSubview(iconView)
        addSubview(detailTitleText)
        iconView.addSubview(icon)
    }

    private func setupLayout() {
        iconView.snp.makeConstraints { make in
            make.center.equalTo(snp.center)
            make.height.width.equalTo(80)
        }

        icon.snp.makeConstraints { make in
            make.center.equalTo(iconView)
            make.height.width.equalTo(60)
        }

        detailTitleText.snp.makeConstraints { make in
            make.centerX.equalTo(snp.centerX)
            make.centerY.equalTo(snp.centerY).offset(90)
        }
    }

    func fillSetting(settingCell: Setting?) {
        icon.image = settingCell?.icon
        detailTitleText.text = settingCell?.title
        iconView.backgroundColor = settingCell?.imageBackgroundColor
    }
}
