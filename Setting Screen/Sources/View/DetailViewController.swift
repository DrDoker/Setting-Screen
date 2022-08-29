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

    private lazy var icon: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 150
        return imageView
    }()

    private lazy var detailTitleText: UILabel = {
        let lable = UILabel()
        lable.textColor = .systemBlue
        lable.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        return lable
    }()

    private lazy var additionalText: UILabel = {
        let lable = UILabel()
        lable.font = UIFont.systemFont(ofSize: 17, weight: .bold)
        return lable
    }()

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
        view.addSubview(detailTitleText)
    }

    private func setupLayout() {
        detailTitleText.snp.makeConstraints { make in
            make.center.equalTo(view)
        }
    }

    private func fillSetting() {
        icon.image = settingCell?.icon
        detailTitleText.text = settingCell?.title
        additionalText.text = settingCell?.additionalText
    }
}
