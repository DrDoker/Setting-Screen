//
//  StandartTableViewCell.swift
//  Setting Screen
//
//  Created by Serhii  on 28/08/2022.
//

import UIKit

class StandartTableViewCell: UITableViewCell {

    var settingCell: Setting? {
        didSet {
            icon.image = settingCell?.icon
            title.text = settingCell?.title
            iconImageView.backgroundColor = settingCell?.imageBackgroundColor
        }
    }

    //MARK: - Outlets

    private lazy var iconImageView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 6
        return view
    }()

    private lazy var icon: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.tintColor = .white
        return imageView
    }()

    private lazy var title: UILabel = {
        let lable = UILabel()
        lable.textColor = .black
        return lable
    }()

    //MARK: - Initializers

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupHierarchy()
        setupLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Setup

    private func setupHierarchy() {
        contentView.addSubview(title)
        contentView.addSubview(iconImageView)
        iconImageView.addSubview(icon)
    }

    private func setupLayout() {
        iconImageView.snp.makeConstraints { make in
            make.centerY.equalTo(contentView)
            make.left.equalTo(contentView).offset(20)
            make.height.equalTo(30)
            make.width.equalTo(30)
        }

        title.snp.makeConstraints { make in
            make.centerY.equalTo(contentView)
            make.left.equalTo(iconImageView.snp.right).offset(20)
        }

        icon.snp.makeConstraints { make in
            make.center.equalTo(iconImageView)
            make.height.width.equalTo(23)
 
        }
    }

    // MARK: - Reuse

    override func prepareForReuse() {
        super.prepareForReuse()
        self.accessoryType = .none
        self.settingCell = nil
    }
}
