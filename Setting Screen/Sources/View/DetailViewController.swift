//
//  DetailViewController.swift
//  Setting Screen
//
//  Created by Serhii  on 29/08/2022.
//

import UIKit

class DetailViewController: UIViewController {

    var settingCell: Setting?

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

    convenience init(settingCell: Setting?) {
        self.init()
        self.settingCell = settingCell
    }

    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        setupHierarchy()
        setupLayout()
        fillSetting()
    }

    // MARK: - Setup

    private func setupHierarchy() {
        view.addSubview(iconView)
        view.addSubview(detailTitleText)
        iconView.addSubview(icon)
    }

    private func setupLayout() {
        iconView.snp.makeConstraints { make in
            make.center.equalTo(view)
            make.height.width.equalTo(80)
        }

        icon.snp.makeConstraints { make in
            make.center.equalTo(iconView)
            make.height.width.equalTo(60)
        }

        detailTitleText.snp.makeConstraints { make in
            make.centerX.equalTo(view)
            make.centerY.equalTo(view).offset(90)
        }
    }

    private func fillSetting() {
        icon.image = settingCell?.icon
        detailTitleText.text = settingCell?.title
        iconView.backgroundColor = settingCell?.imageBackgroundColor
    }
}
